function y=removal_cp(y_rx,L_fft,L_cp)
s=size(y_rx);
r=s(1);

L_temp=fix(length(y_rx)/(L_fft+L_cp));
y_rmcp=[];
for k=1:r
    for i=0:(L_temp-1)
        y_rmcp(k,i*L_fft+1:i*L_fft+L_fft)=y_rx(k,i*(L_fft+L_cp)+L_cp+1:i*(L_fft+L_cp)+L_cp+L_fft);
    end
end
%y=reshape(x_cp,(L+(L*L_cp)/L_ifft),1);
y=y_rmcp;