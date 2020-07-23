function [y_fft, y_dmrs, loc_dmrs]=fft_rx(y_rmcp,Nfft)

y_fft=[];
for k=1:size(y_rmcp,1)
    for i=0:(size(y_rmcp,2)/Nfft-1)
         y_fft(k,i*Nfft+1:i*Nfft+Nfft)=fftshift(fft((y_rmcp(k,i*Nfft+1:i*Nfft+Nfft)),Nfft));
    end
end
%y=reshape(y_fft,L,1);
length_dmrs=ceil((size(y_fft,2)/Nfft)/7);
row_dmrs=size(y_fft,1);
for i=1:row_dmrs
    %y_dmrs(i,1:2*Nfft)=y_fft(i,1:2*Nfft);
    for j=0:length_dmrs-1
        y_dmrs(i,2*Nfft*j+1:2*Nfft*j+2*Nfft)=y_fft(i,7*j*Nfft+1:7*j*Nfft+2*Nfft);
        loc_dmrs(i,2*Nfft*j+1:2*Nfft*j+2*Nfft)=7*j*Nfft+1:7*j*Nfft+2*Nfft;
    end
end