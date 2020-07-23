function [y_rmcp,RX_est,STO1_est]=CFO_STO_est(RX,Nfft,Ncp)
c=size(RX,2);
Nsym=Nfft+Ncp;
RX_est=zeros(2,length(RX));
%window start slide from sample 288 of symbol #0
for j= Ncp+1:Nsym+Ncp
    nn=0:Ncp-1;
    subtr(1,j-Ncp)=(abs(RX(1,nn+j))-abs(RX(1,nn+j+Nfft)))*(abs(RX(1,nn+j))-abs(RX(1,nn+j+Nfft)))';
    subtr(2,j-Ncp)=(abs(RX(2,nn+j))-abs(RX(2,nn+j+Nfft)))*(abs(RX(2,nn+j))-abs(RX(2,nn+j+Nfft)))';
end

%find corr min user #1
STO1_min=subtr(1,1);
for i= 1:length(subtr)
    if subtr(1,i) < STO1_min
        STO1_min=subtr(1,i);
    end
end
STO1_est=(find(subtr(1,:)==STO1_min)+Ncp)-Nsym-1;
if abs(STO1_est) < Ncp && STO1_est <= 0
    if STO1_est == 0
        RX_est(1,:)= [RX(1,STO1_est+1:end) zeros(1,STO1_est)];
        RX_est(2,:)= [RX(2,STO1_est+1:end) zeros(1,STO1_est)];
    else
        RX_est(1,:)= [zeros(1,-STO1_est) RX(1,1:end+STO1_est)];
        RX_est(2,:)= [zeros(1,-STO1_est) RX(2,1:end+STO1_est)];
    end
end

%find corr min user #2
% STO2_min=subtr(2,1);
% for i= 1:length(subtr)
%     if subtr(2,i) < STO2_min
%         STO2_min=subtr(2,i);
%     end
% end
% STO2_est=(find(subtr(2,:)==STO2_min)+Ncp)-Nsym-1;
% if abs(STO2_est) < Ncp && STO2_est <= 0
%     if STO2_est == 0
%         RX_est(2,:)= [RX(2,STO2_est+1:end) zeros(1,STO2_est)];
%     else
%         RX_est(2,:)= [zeros(1,-STO2_est) RX(2,1:end+STO2_est)];
%     end
% end

%ESTIMATION CFO
CFO_est=cfo_est(RX_est,Nfft,Ncp);
y_rm_cfo=removal_CFO(RX_est,CFO_est,Nfft);

%REMOVAL CYCLIC PREFIX
for k=0:length(RX)/Nsym-1
    user1(k+1,1:Nfft)= y_rm_cfo(1,Ncp+(Nsym)*k+1:(Nsym)*k+Nsym);
end

for k=0:length(RX)/Nsym-1
    user2(k+1,1:Nfft)= y_rm_cfo(2,Ncp+(Nsym)*k+1:(Nsym)*k+Nsym);
end

user1_rs=reshape(fliplr(imrotate(user1,-90)),1,length(RX)*Nfft/Nsym);
user2_rs=reshape(fliplr(imrotate(user2,-90)),1,length(RX)*Nfft/Nsym);
y_rmcp=[user1_rs;user2_rs];


            