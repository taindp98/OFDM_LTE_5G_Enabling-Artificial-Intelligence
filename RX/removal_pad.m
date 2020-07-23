function [y_cw0, y_cw1]=removal_pad(y_sig)
r=size(y_sig,1);
c=size(y_sig,2);
y_map=[1+1i 1+3i 3+1i 3+3i 1-1i 1-3i 3-1i 3-3i -1+1i -1+3i -3+1i -3+3i -1-1i -1-3i -3-1i -3-3i];
y_r=[];
for m=1:r
   for n=1:c
       y_r(m,n)=round(y_sig(m,n)*sqrt(10));
       if abs(y_r(m,n))~=0
           y_r(m,n)=y_sig(m,n);
       else y_r(m,n)=0;
       end
   end
end
loc_sig(1,:)=find(y_r(1,:)~=0+0i);
y_r=y_r(:,loc_sig);

r=size(y_r,1);
c=size(y_r,2);
for m=1:r
   for n=1:c
       y_r(m,n)=round(y_r(m,n)*sqrt(10));          
   end
end

y_layer1(1,:)=y_r(1,:);
y_layer2(1,:)=y_r(2,:);
c=size(y_layer1,2);
for n=1:c
    if y_layer1(1,n)==y_map(1)
        y_dm1(n,1:4)=[0 0 0 0];
    elseif y_layer1(1,n)==y_map(2)
        y_dm1(n,1:4)=[0 0 0 1];
    elseif y_layer1(1,n)==y_map(3)
        y_dm1(n,1:4)=[0 0 1 0];
    elseif y_layer1(1,n)==y_map(4)
        y_dm1(n,1:4)=[0 0 1 1];
    elseif y_layer1(1,n)==y_map(5)
        y_dm1(n,1:4)=[0 1 0 0];
    elseif y_layer1(1,n)==y_map(6)
        y_dm1(n,1:4)=[0 1 0 1];
    elseif y_layer1(1,n)==y_map(7)
        y_dm1(n,1:4)=[0 1 1 0];
    elseif y_layer1(1,n)==y_map(8)
        y_dm1(n,1:4)=[0 1 1 1];
    elseif y_layer1(1,n)==y_map(9)
        y_dm1(n,1:4)=[1 0 0 0];
    elseif y_layer1(1,n)==y_map(10)
        y_dm1(n,1:4)=[1 0 0 1];
    elseif y_layer1(1,n)==y_map(11)
        y_dm1(n,1:4)=[1 0 1 0];
    elseif y_layer1(1,n)==y_map(12)
        y_dm1(n,1:4)=[1 0 1 1];
    elseif y_layer1(1,n)==y_map(13)
        y_dm1(n,1:4)=[1 1 0 0];
    elseif y_layer1(1,n)==y_map(14)
        y_dm1(n,1:4)=[1 1 0 1];
    elseif y_layer1(1,n)==y_map(15)
        y_dm1(n,1:4)=[1 1 1 0];
    else
        y_dm1(n,1:4)=[1 1 1 1];
    end
end
y_dm1=fliplr(y_dm1);
for n=1:c
    if y_layer2(1,n)==y_map(1)
        y_dm2(n,1:4)=[0 0 0 0];
    elseif y_layer2(1,n)==y_map(2)
        y_dm2(n,1:4)=[0 0 0 1];
    elseif y_layer2(1,n)==y_map(3)
        y_dm2(n,1:4)=[0 0 1 0];
    elseif y_layer2(1,n)==y_map(4)
        y_dm2(n,1:4)=[0 0 1 1];
    elseif y_layer2(1,n)==y_map(5)
        y_dm2(n,1:4)=[0 1 0 0];
    elseif y_layer2(1,n)==y_map(6)
        y_dm2(n,1:4)=[0 1 0 1];
    elseif y_layer2(1,n)==y_map(7)
        y_dm2(n,1:4)=[0 1 1 0];
    elseif y_layer2(1,n)==y_map(8)
        y_dm2(n,1:4)=[0 1 1 1];
    elseif y_layer2(1,n)==y_map(9)
        y_dm2(n,1:4)=[1 0 0 0];
    elseif y_layer2(1,n)==y_map(10)
        y_dm2(n,1:4)=[1 0 0 1];
    elseif y_layer2(1,n)==y_map(11)
        y_dm2(n,1:4)=[1 0 1 0];
    elseif y_layer2(1,n)==y_map(12)
        y_dm2(n,1:4)=[1 0 1 1];
    elseif y_layer2(1,n)==y_map(13)
        y_dm2(n,1:4)=[1 1 0 0];
    elseif y_layer2(1,n)==y_map(14)
        y_dm2(n,1:4)=[1 1 0 1];
    elseif y_layer2(1,n)==y_map(15)
        y_dm2(n,1:4)=[1 1 1 0];
    else
        y_dm2(n,1:4)=[1 1 1 1];
    end
end
y_dm2=fliplr(y_dm2);
y_cw0=y_dm1;
y_cw1=y_dm2;
