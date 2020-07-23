function y=add_cp(x,Nfft,Ncp)
for k=1:size(x,1)
    for i=0:(size(x,2)/Nfft-1)
        y(k,i*(Ncp+Nfft)+1:i*(Ncp+Nfft)+Ncp)=x(k,(i*Nfft+Nfft-Ncp+1):i*Nfft+Nfft);
        y(k,(i+1)*Ncp+i*Nfft+1:(i+1)*Ncp+i*Nfft+Nfft)=x(k,i*Nfft+1:i*Nfft+Nfft);
    end
end