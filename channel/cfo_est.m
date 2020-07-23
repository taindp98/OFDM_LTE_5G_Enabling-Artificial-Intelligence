function CFO=cfo_est(y_cfo,L_fft,L_cp)
r=size(y_cfo,1);
c=size(y_cfo,2);
for m=1:r
    k=1:L_cp;
    CFO(m,1)=angle(y_cfo(m,k+L_fft+L_fft+L_cp)*y_cfo(m,k+L_fft+L_cp)')/(2*pi);
     end
end