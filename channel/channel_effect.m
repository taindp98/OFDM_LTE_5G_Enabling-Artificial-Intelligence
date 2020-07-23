function [y,H_3d] = channel_effect(TX,H)
for i=1:length(TX)
    H_3d(:,:,i)=H(:,:);
end
for k=1:size(H_3d,3)
    y(:,k)=H_3d(:,:,k)*TX(:,k);
end
    