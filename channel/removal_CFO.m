function y_rm_cfo=removal_CFO(y_sync,CFO_est,L_fft)

c=size(y_sync,2);
for m=1:length(CFO_est)
    for n=0:c-1
       y_rm_cfo(m,n+1)=y_sync(m,n+1).*(1/(exp(2i*pi*CFO_est(m)*n/L_fft)));
    end
end