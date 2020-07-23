%--------------------------------------------------------------------------
%----------------------------TRANSMITTER-----------------------------------
%--------------------------------------------------------------------------
clear all
param;

%GENERATE CODEWORD
x.cw0=randi([0 1],para.Nsample,log2(para.Nbit));
x.cw1=randi([0 1],para.Nsample,log2(para.Nbit));
x.sym0=bi2de(x.cw0);
x.sym1=bi2de(x.cw1);

%MODULATION
x.mod0=modulation(x.sym0,para.Nbit);
x.mod1=modulation(x.sym1,para.Nbit);

%REFERENCE SIGNAL & MAPPING
[x.layer,x.dmrs0,x.dmrs1]=map_rs(x.mod0,x.mod1,para.Nsub);

%PRECODING
x.precoding=precoding(x.layer,para.Precode);

%PADDING ZERO
[x.pad, x.dmrs] = zero_pad(x.precoding,para.Nfft,para.Nsub);

%IFFT 4096
x.ifft=ifft_tx(x.pad,para.Nfft);

%ADD CYCLIC PREFIX
x.cp=add_cp(x.ifft,para.Nfft,para.Ncp);

TX=x.cp;

%--------------------------------Channel----------------------------------

%CHANNEL MATRIX
%https://www.mathworks.com/matlabcentral/fileexchange/22304-mimo-with-zero-forcing-equalizer
H=(randn(para.NantRX,para.NantTX)+1i.*randn(para.NantRX,para.NantTX))./sqrt(2);

%CHANNEL FADING
[x.fading, H_3d]=channel_effect(TX,H);
% x.fading=H*TX;

%ADD CFO
x.cfo=add_CFO(x.fading,para.CFO,para.Nfft);

%ADD STO
x.cfosto=add_STO(x.cfo,para.STO);

%NOISE
x.noise=add_noise(x.cfosto,para.SNRdb,para.NantRX);

%--------------------------------------------------------------------------
%-----------------------------RECEIVER-------------------------------------
%--------------------------------------------------------------------------
RX=x.noise;

%SYNC TIME-DOMAIN
%[y.rmcp_test,cor1]=sync(RX,para.Nfft,para.Ncp);
[y.rmcp,RX_est,STO1_est]=CFO_STO_est(x.cfosto,para.Nfft,para.Ncp);

% [y.rmcp ,y.sync ,STO1_est,STO2_est,sym1,sym2]=CFO_STO_est(x.noise,para.Nfft,para.Ncp);

%FFT 4096
[y.fft , y.dmrs , y.locdmrs]=fft_rx(y.rmcp,para.Nfft);

%CHANNEL ESTIMATION & EQUALIZATION
[y.est, H_est] = channel_equal(y.fft,x.dmrs,y.dmrs,para.Precode,para.SNRdb,para.Nfft);
k1=angle(H_est(1,1,551)*H_est(1,1,550)')*4096/(2*pi);
k2=angle(H_est(1,1,552)*H_est(1,1,551)')*4096/(2*pi);
k3=angle(H_est(1,1,3544)*H_est(1,1,3543)')*4096/(2*pi);
%FREQUENCY DOMAIN COMPENSATE
y.locsig = setxor(1:length(y.est ),y.locdmrs);
y.sym =y.est(:,y.locsig);
% [y.cmp,agr] = freqDM_comp(x.dmrs0,x.dmrs1,y.est,para.Nfft,para.Nsub);

 const_16qam(y.est(1,:));

%REMOVAL ZERO
% [y.cw0 , y.cw1 ]=removal_pad(y.sym );

%----------------------------PLOT------------------------------------------
%PLOT BANDWIDTH
% x_plot=reshape(fliplr(imrotate(x_ifft,-90)),1,length(x_ifft)*8);
%  [PowerSpectrum,W] = pwelch(x_plot,[],[],L_ifft,fs);
%  plot([-L_ifft/2:L_ifft/2-1]*fs/L_ifft,10*log10(fftshift(PowerSpectrum)),'k');
