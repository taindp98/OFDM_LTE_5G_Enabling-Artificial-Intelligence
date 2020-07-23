function [y_map_rs,dmrs_0,dmrs_1]=map_rs(mod0,mod1,Nsub)
Nsym=length(mod0);
row_sym=ceil(Nsym/Nsub);
col_final=mod(Nsym,Nsub);
loc_final=floor((Nsub-mod(Nsym,Nsub))/2);

sym_map1=zeros(row_sym,Nsub);
sym_map2=zeros(row_sym,Nsub);
if col_final ~= 0
    for i=0:row_sym-1
        if i<row_sym-1
            for k=1:Nsub
                sym_map1(i+1,k)=mod0(1,Nsub*i+k);
                sym_map2(i+1,k)=mod1(1,Nsub*i+k);
            end
        else
            for k=1:col_final
                sym_map1(i+1,k+loc_final)=mod0(1,Nsub*i+k);
                sym_map2(i+1,k+loc_final)=mod1(1,Nsub*i+k);
            end
        end
    end
else
    for i=0:row_sym-1
        for k=1:Nsub
            sym_map1(i+1,k)=mod0(1,Nsub*i+k);
            sym_map2(i+1,k)=mod1(1,Nsub*i+k);
        end
    end
end

% row_map=ceil(row_sym/5);  %7symbol
row_map=row_sym/5;
y_map1=zeros(row_sym+2*row_map,Nsub);
y_map2=zeros(row_sym+2*row_map,Nsub);
for r=0:row_map-1
    k_odd=mod((mod(r,2)+1),2);
    k_even=mod(r,2);
%     if r<row_map-1
        for j=7*r+1:7*(r+1)
            if j< 7*r+2
%                 y_map1(j,:)=k_odd.*PSS(Nsub,100);
%                 y_map2(j,:)=k_even.*PSS(Nsub,100);
                y_map1(j,:)=1.*PSS(Nsub,100);
                y_map2(j,:)=0.*PSS(Nsub,200);
            elseif j> 7*r+2
                y_map1(j,:)=sym_map1(j-2*(r+1),:);
                y_map2(j,:)=sym_map2(j-2*(r+1),:);
            else
%                 y_map1(j,:)=k_even.*PSS(Nsub,100);
%                 y_map2(j,:)=k_odd.*PSS(Nsub,100);
                  y_map1(j,:)=0.*PSS(Nsub,100);
                  y_map2(j,:)=1.*PSS(Nsub,200);
                
            end
        end
%     else
%         for j=7*r+1:7*r+mod(row_sym,5)+2
%             if j< 7*r + 2
% %                 y_map1(j,:)=k_odd.*PSS(Nsub,100);
% %                 y_map2(j,:)=k_even.*PSS(Nsub,100);
%                   y_map1(j,:)=1.*PSS(Nsub,100);
%                   y_map2(j,:)=0.*PSS(Nsub,200);
%             elseif j> 7*r + 2
%                 y_map1(j,:)=sym_map1(j-2*(r+1),:);
%                 y_map2(j,:)=sym_map2(j-2*(r+1),:);
%             else
% %                 y_map1(j,:)=k_even.*PSS(Nsub,100);
% %                 y_map2(j,:)=k_odd.*PSS(Nsub,100);
%                   y_map1(j,:)=0.*PSS(Nsub,100);
%                   y_map2(j,:)=1.*PSS(Nsub,200);
%                 
%             end
%         end
%     end
end

%y_map_rs=y_map1;
y_map1=reshape(fliplr(imrotate(y_map1,-90)),1,(row_sym+2*row_map)*Nsub);
y_map2=reshape(fliplr(imrotate(y_map2,-90)),1,(row_sym+2*row_map)*Nsub);
dmrs_0=[PSS(Nsub,100) zeros(1,Nsub)];
dmrs_1=[zeros(1,Nsub) PSS(Nsub,200)];
y_map_rs=[y_map1;y_map2];

        
            
        
