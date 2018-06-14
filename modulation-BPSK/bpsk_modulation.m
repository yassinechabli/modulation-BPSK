clc;
close all;
clear all;
% génération de N=100 bloc de tail 1000
N=randint(100,1000);
%géneration des vectors avec deux derniers chiffre à 0
N(1:100,999)=zeros(1,100);
N(1:100,1000)=zeros(1,100);
Nlig=reshape(N',1,100000);

% définition des fonctions générateurs
G1=[1 1 1];
G2=[1 0 1];

% génération de code 
encod1=conv(G1,Nlig);
encod2=conv(G2,Nlig);

% les code contient des 2 3 donc ont le transforme en binaire avec la fonction mod() 2
c1=mod(encod1,2);
c2=mod(encod2,2);

% modulation BPSK
c1_bpsk=c1.*2-1;
c2_bpsk=c2.*2-1;
% application  de  bruit blan additif AWGN de SNR=5
c1br=awgn(c1_bpsk,5);
c2br=awgn(c2_bpsk,5);
%% ------décodage pondéré-------
M=zeros(8,1000);
M(1,1)=0; 
for i=1:1000 
M(1,i)= norm([encod1(i), encod2(i)]-[-1,-1]); 
end


