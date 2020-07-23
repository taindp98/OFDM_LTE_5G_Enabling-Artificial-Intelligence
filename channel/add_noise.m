function y=add_noise(x,SNRdb,Nrx)
snr = 10^(SNRdb/10);
At=mean(mean(x.'.*conj(x.')));
An=At/snr;
n=sqrt(An/2).*(randn(Nrx,length(x))+1i.*randn(Nrx,length(x)));
y=x+n;