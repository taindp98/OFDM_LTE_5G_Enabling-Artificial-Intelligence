function y = modulation(sym,Nbit)
map_16QAM=[1+1i 1+3i 3+1i 3+3i 1-1i 1-3i 3-1i 3-3i -1+1i -1+3i -3+1i -3+3i -1-1i -1-3i -3-1i -3-3i].*(1/sqrt(10));
map_QPSK=[1+1i 1-1i -1+1i -1-1i].*1/sqrt(2);
L=length(sym);
for i = 1:L
    if Nbit==16
        if(sym(i)==0)
            y(i)=map_16QAM(1);
        elseif(sym(i)==1)
            y(i)=map_16QAM(2);
        elseif(sym(i)==2)
            y(i)=map_16QAM(3);
        elseif(sym(i)==3)
            y(i)=map_16QAM(4);
        elseif(sym(i)==4)
            y(i)=map_16QAM(5);
        elseif(sym(i)==5)
            y(i)=map_16QAM(6);
        elseif(sym(i)==6)
            y(i)=map_16QAM(7);
        elseif(sym(i)==7)
            y(i)=map_16QAM(8);
        elseif(sym(i)==8)
            y(i)=map_16QAM(9);
        elseif(sym(i)==9)
            y(i)=map_16QAM(10);
        elseif(sym(i)==10)
            y(i)=map_16QAM(11);
        elseif(sym(i)==11)
            y(i)=map_16QAM(12);
        elseif(sym(i)==12)
            y(i)=map_16QAM(13);
        elseif(sym(i)==13)
            y(i)=map_16QAM(14);
        elseif(sym(i)==14)
            y(i)=map_16QAM(15);
        else
            y(i)=map_16QAM(16);
        end
    else
        if(sym(i)==0)
            y(i)=map_QPSK(1);
        elseif(sym(i)==1)
            y(i)=map_QPSK(2);
        elseif(sym(i)==2)
            y(i)=map_QPSK(3);
        else
            y(i)=map_QPSK(4);
        end
    end
end