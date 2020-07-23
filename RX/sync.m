function subtr=sync(RX,x_dmrs,Nfft,Ncp)
c=size(RX,2);
Nsym=Nfft+Ncp;
for j=1:c-Nsym+1
    nn=0:Nsym-1;
    subtr(1,j)=(abs(RX(1,nn+j))-abs(x_dmrs(1,1:Nsym)))*(abs(RX(1,nn+j))-abs(x_dmrs(1,1:Nsym)))';
end
t_div=c/(Nsym);

% for k=0:t_div-1
%     if k==0
%         cor1(k+1,1:Nsym)=subtr(1,1:Nsym);
%         STO1_min=cor1(k+1,1);
%         for j=1:Nsym
%             if cor1(k+1,j) < STO1_min
%                 STO1_min=cor1(k+1,j);
%             end
%         end
%         STO1_est(k+1)=find(cor1(k+1,:)==STO1_min);
%         if STO1_est (k+1) > Nfft
%             % symbol 4384 OFDM
%             %[4096-(4384-4285+1)=3096 + 1 start to end
%             sym1(k+1,1:Ncp)= RX(1,Nfft-(Nsym-STO1_est(k+1)+1)+1:Nsym-(Nsym-STO1_est(k+1)+1));
%             %[288-(4384-4285+1)=188 + 1 start to end
%             sym1(k+1,Ncp+1:Nsym)= RX(1,Ncp-(Nsym-STO1_est(k+1)+1)+1:Nsym-(Nsym-STO1_est(k+1)+1));
%         else
%             sym1(k+1,1:Nsym)= RX(1,STO1_est(k+1)+(Nsym)*k:STO1_est(k+1)+(Nsym)*k+Nsym-1);
%         end
%     elseif k < t_div-1 && k~=0
%        cor1(k+1,1:Nsym)=subtr(1,(Nsym)*k+1:(Nsym)*k+Nsym);
%         STO1_min=cor1(k+1,1);
%         for j=1:Nsym
%             if cor1(k+1,j) < STO1_min
%                 STO1_min=cor1(k+1,j);
%             end
%         end
%         STO1_est(k+1)=find(cor1(k+1,:)==STO1_min);
%          if STO1_est (k+1) > Nfft
% %             % symbol 4384 OFDM
%             %[4384 - (4384-4285+1)= 4284 +1 start
%             sym1(k+1,1:Nsym)= RX(1,(Nsym)*k-(Nsym-STO1_est(k+1)+1)+1:Nsym+(Nsym)*k-(Nsym-STO1_est(k+1)+1));
%          else
%             sym1(k+1,1:Nsym)= RX(1,STO1_est(k+1)+(Nsym)*k:STO1_est(k+1)+(Nsym)*k+Nsym-1);
%          end
%     else
%         STO1_est(k+1)=STO1_est(k);
%        if STO1_est (k+1) > Nfft
%             % symbol 4384 OFDM
%            sym1(k+1,1:Nsym)= RX(1,(Nsym)*k-(Nsym-STO1_est(k+1)+1)+1:Nsym+(Nsym)*k-(Nsym-STO1_est(k+1)+1));
%         else
%             sym1(k+1,1:Nfft)= RX(1,STO1_est(k+1)+(Nsym)*k:STO1_est(k+1)+(Nsym)*k+Nfft-1);
%             sym1(k+1,Nfft+1:Nsym)= RX(1,STO1_est(k+1)+(Nsym)*k:STO1_est(k+1)+Ncp+(Nsym)*k-1);
%         end
%     end
% end

% for k=0:t_div-1
%     if k==0
%         cor2(k+1,1:Nsym)=subtr(2,1:Nsym);
%         STO2_min=cor2(k+1,1);
%         for j=1:Nsym
%             if cor2(k+1,j) < STO2_min
%                 STO2_min=cor2(k+1,j);
%             end
%         end
%         STO2_est(k+1)=find(cor2(k+1,:)==STO2_min);
%         if STO2_est (k+1) > Nfft
%             % symbol 4384 OFDM
%             %[4096-(4384-4285+1)=3096 + 1 start to end
%             sym2(k+1,1:Ncp)= RX(2,Nfft-(Nsym-STO2_est(k+1)+1)+1:Nsym-(Nsym-STO2_est(k+1)+1));
%             %[288-(4384-4285+1)=188 + 1 start to end
%             sym2(k+1,Ncp+1:Nsym)= RX(2,Ncp-(Nsym-STO2_est(k+1)+1)+1:Nsym-(Nsym-STO2_est(k+1)+1));
%         else
%             sym2(k+1,1:Nsym)= RX(2,STO2_est(k+1)+(Nsym)*k:STO2_est(k+1)+(Nsym)*k+Nsym-1);
%         end
%     elseif k < t_div-1 && k~=0
%        cor2(k+1,1:Nsym)=subtr(2,(Nsym)*k+1:(Nsym)*k+Nsym);
%         STO2_min=cor2(k+1,1);
%         for j=1:Nsym
%             if cor2(k+1,j) < STO2_min
%                 STO2_min=cor2(k+1,j);
%             end
%         end
%         STO2_est(k+1)=find(cor2(k+1,:)==STO2_min);
%          if STO2_est (k+1) > Nfft
% %             % symbol 4384 OFDM
%             %[4384 - (4384-4285+1)= 4284 +1 start
%             sym2(k+1,1:Nsym)= RX(2,(Nsym)*k-(Nsym-STO2_est(k+1)+1)+1:Nsym+(Nsym)*k-(Nsym-STO2_est(k+1)+1));
%          else
%             sym2(k+1,1:Nsym)= RX(2,STO2_est(k+1)+(Nsym)*k:STO2_est(k+1)+(Nsym)*k+Nsym-1);
%          end
%     else
%         STO2_est(k+1)=STO2_est(k);
%        if STO2_est (k+1) > Nfft
%             % symbol 4384 OFDM
%            sym2(k+1,1:Nsym)= RX(2,(Nsym)*k-(Nsym-STO2_est(k+1)+1)+1:Nsym+(Nsym)*k-(Nsym-STO2_est(k+1)+1));
%         else
%             sym2(k+1,1:Nfft)= RX(2,STO2_est(k+1)+(Nsym)*k:STO2_est(k+1)+(Nsym)*k+Nfft-1);
%             sym2(k+1,Nfft+1:Nsym)= RX(2,STO2_est(k+1)+(Nsym)*k:STO2_est(k+1)+Ncp+(Nsym)*k-1);
%         end
%     end
% end
% 
% %y_sync=sym1;
% 
% user1_rs=reshape(fliplr(imrotate(sym1,-90)),1,t_div*(Nsym));
% user2_rs=reshape(fliplr(imrotate(sym2,-90)),1,t_div*(Nsym));
% y_sync=[user1_rs;user2_rs];
% 
% %ESTIMATION CFO
% CFO_est=cfo_est(y_sync,Nfft,Ncp);
% y_rm_cfo=removal_CFO(y_sync,CFO_est,Nfft);
% 
% %REMOVAL CYCLIC PREFIX
% for k=0:t_div-1
%     if k < t_div-1
%         user1(k+1,1:Nfft)= y_rm_cfo(1,Ncp+(Nsym)*k+1:(Nsym)*k+Nsym);
%     else
%        if STO1_est (k+1) < Ncp
%             user1(k+1,1:Nfft-Ncp)= y_rm_cfo(1,Ncp+(Nsym)*k+1:(Nsym)*k+Nfft);
%             user1(k+1,Nfft-Ncp+1:Nfft)= y_rm_cfo(1,(Nsym)*k+1:(Nsym)*k+Ncp);
%         else
%             user1(k+1,1:Nfft)= y_rm_cfo(1,Ncp+(Nsym)*k+1:(Nsym)*k+Nsym);
%         end
%     end
% end
% 
% for k=0:t_div-1
%     if k < t_div-1
%         user2(k+1,1:Nfft)= y_rm_cfo(2,Ncp+(Nsym)*k+1:(Nsym)*k+Nsym);
%     else
%        if STO1_est (k+1) < Ncp
%             user2(k+1,1:Nfft-Ncp)= y_rm_cfo(2,Ncp+(Nsym)*k+1:(Nsym)*k+Nfft);
%             user2(k+1,Nfft-Ncp+1:Nfft)= y_rm_cfo(2,(Nsym)*k+1:(Nsym)*k+Ncp);
%         else
%             user2(k+1,1:Nfft)= y_rm_cfo(2,Ncp+(Nsym)*k+1:(Nsym)*k+Nsym);
%         end
%     end
% end
% 
% user1_rs=reshape(fliplr(imrotate(user1,-90)),1,t_div*Nfft);
% user2_rs=reshape(fliplr(imrotate(user2,-90)),1,t_div*Nfft);
% y_rmcp=[user1_rs;user2_rs];


            