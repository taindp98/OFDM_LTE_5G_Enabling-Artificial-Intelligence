function y=PSS(Nsub,ID)
%ran=randi([0 1],1,4);
Nc=1600;
%initial x1
x1_init=[1 zeros(1,30)];

%initial x2
K(1,1)=(2^17*(14*1+1+1)*(2*ID+1)+2*ID);
for n=1:31
    x2_init(1,n)=mod(K(1,n),2);
    K(1,n+1)=fix(K(1,n)/2);
end    

x1=zeros(1,2*Nsub+1+Nc+31);
x2=zeros(1,2*Nsub+1+Nc+31);

c=zeros(1,2*Nsub+1);
r=zeros(1,Nsub);

x1(1:31)=x1_init;
x2(1:31)=fliplr(x2_init(1,1:31));

for n=1:(2*Nsub+1+Nc)
    x1(n+31)=mod(x1(n+3)+x1(n),2);
end

for n=1:(2*Nsub+1+Nc)
    x2(n+31)=mod(x2(n+3)+x2(n+2)+x2(n+1)+x2(n),2);
end

for n=1:2*Nsub+1
    c(n)=mod(x1(n+Nc)+x2(n+Nc),2);
   
end
for n=1:Nsub
    r(n)=(1/sqrt(2)).*((1-2*c(2*n))+1i*(1-2*c(2*n+1)));
end
y=r;