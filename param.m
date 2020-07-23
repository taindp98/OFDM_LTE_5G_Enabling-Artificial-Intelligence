%paraeter

para.Nsample=30000;
para.Fsample=61.44e6;
para.Nfft=4096;
para.Ncp=288;
para.Nsub=3000;
para.NantTX=8;
para.NantRX=2;
para.Nlayer=2;
para.Nbit=16;
para.Precode=[1 1;1i 1i;1 -1;1i -1i;1 1;1i 1i;1 -1;1i -1i]./(2*sqrt(2));
para.STO=0; % #0 dont use
para.CFO=0; % #0 dont use
para.SNRdb=20;
para.Nsym=para.Nfft+para.Ncp;


%config XSG
configXSG.fclock=1/para.Fsample;

configXSG.masterReset = zeros(200000,2);
configXSG.masterEnable= ones(200000,2);
for t = 0:199999
    configXSG.masterReset(t+1,1) = t;
    configXSG.masterReset(t+1,1) = configXSG.masterReset(t+1,1)/(para.Fsample);
    configXSG.masterEnable(t+1,1) = t;
    configXSG.masterEnable(t+1,1) = configXSG.masterEnable(t+1,1)/(para.Fsample);
end
configXSG.masterReset(1,2)=1;
configXSG.masterReset(2,2)=1;
configXSG.masterEnable(1,2)=0;
configXSG.masterEnable(2,2)=0;

configXSG.Nslot=7*para.Nsym;
configXSG.Nsubframe=(para.Nsample/para.Nsub)/5;
configXSG.Lstart=(para.Nfft-para.Nsub)/2;
configXSG.Lend=configXSG.Lstart+para.Nsub/2;
configXSG.Rstart=configXSG.Lend+para.Ncp;
configXSG.Rend=configXSG.Rstart+para.Nsub/2;