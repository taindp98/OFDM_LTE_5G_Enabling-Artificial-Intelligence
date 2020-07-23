function [y_eq,H_est]=channel_equal(x,x_dmrs,y_dmrs,P,SNRdb,Nfft)
%CHANNEL ESTIMATION
gamma = 10^(-SNRdb/10);
for i=1:length(x_dmrs)
    H_est(:,:,i) = y_dmrs(:,i)*x_dmrs(:,i)'*pinv(x_dmrs(:,i)*x_dmrs(:,i)'+eye(8).*gamma);
end
%EQUALIZATION WITH NOISE

H=H_est(:,:,1:Nfft);
for i=0:length(x)/Nfft-1
    x_rs(:,:,i+1)=x(:,Nfft*i+1:Nfft*i+Nfft);
%     a(i)=mod(i,2*Nfft);
%     y_est(:,i)=pinv(H_est(:,:,a(i)))*x(:,i);
%     y_eq(:,i)=pinv(P)*y_est(:,i);
end

for i=1:size(x_rs,3)
    for j=1:Nfft
    y_est(:,j,i)=pinv(H(:,:,j))*x_rs(:,j,i);
    y_eq(:,j,i)=pinv(P)*y_est(:,j,i);
    end
end