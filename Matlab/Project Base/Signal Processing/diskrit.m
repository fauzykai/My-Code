%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                    TUGAS KOMPUTER APLIASI TE-VII           
%                      Nama    : Anita Fitrizia                                     
%                      NIM     : 13112008
%                      Jurusan : Teknik Elektro UNIKOM
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%File Name: SS1_3.m 
%Pembangkitan Unit Step Sekuen 
L=input('Panjang Gelombang (>=40)=' ) 
P=input('Panjang Sekuen =' ) 
for n=1:L 
if (n>=P) 
step(n)=1; 
else 
step(n)=0; 
end 
end 
x=1:L; 
stem(x,step)
