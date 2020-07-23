function [y_CFO, test_cfo]=add_CFO(y,nCFO,L_fft)
r=size(y,1);
c=size(y,2);
for m=1:r
    for n=0:c-1
        y_CFO(m,n+1) = y(m,n+1).*exp(2i*pi*nCFO*n/L_fft);
        test_cfo(m,n+1)=exp(2i*pi*nCFO*n/L_fft);
    end
end