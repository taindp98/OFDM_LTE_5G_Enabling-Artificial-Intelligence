function [x_pad,x_dmrs]=zero_pad(x,Nfft,Nsub)
s=size(x);
s=s(1);
r=length(x)/Nsub;
x_pad=zeros(s,Nfft*r);
z1=ceil((Nfft-Nsub)/2)+1;   %549
z2=ceil(Nsub/2);              %1500
for i=1:s
    for k=0:r-1
        x_pad(i,k*Nfft+z1:k*Nfft+z1+z2-1)=x(i,k*Nsub+1:k*Nsub+z2);
        x_pad(i,k*Nfft+z1+z2+1:k*Nfft+z1+2*z2)=x(i,k*Nsub+z2+1:k*Nsub+Nsub);
    end
end
length_dmrs=ceil((size(x_pad,2)/Nfft)/7);
row_dmrs=size(x_pad,1);
for i=1:row_dmrs
    %x_dmrs(i,1:2*Nfft)=x_pad(i,1:2*Nfft);
    for j=0:length_dmrs-1
        x_dmrs(i,2*Nfft*j+1:2*Nfft*j+2*Nfft)=x_pad(i,7*j*Nfft+1:7*j*Nfft+2*Nfft);
    end
end