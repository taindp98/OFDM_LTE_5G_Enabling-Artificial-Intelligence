function y=demod_16qam(z)
s=size(z);
r=s(1);
c=s(2);
amp=abs(z);
agr=angle(z);
y_dm=[];
for m=1:r
   for n=1:c
       y_dm(m,n)=round(z(m,n)*sqrt(10));
   end
end
y=y_dm.*(1/sqrt(10));