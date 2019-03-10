%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                    TUGAS KOMPUTER APLIASI TE-VII           
%                      Nama    : Anita Fitrizia                                     
%                      NIM     : 13112008
%                      Jurusan : Teknik Elektro UNIKOM
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Fs=100;                 % frekuensi banyaknya kejadian dalam 1 perioda gelombang
t=(1:100)/Fs;           % waktu yang dihabiskan untuk membentuk satu gelombang t=1/f 
s1=2*sin(2*pi*t*5+pi/2);    % Asin(2*pi*f*t)
                        % 10 merupakan tinggi amplitudo yang ditetapkan (A)
                        % sin merupakan bentuk gelombang yang akan di plot
                        % 2*pi merupakan rumus dasar untuk memplotting
                        % t didapatkan dari 1/f
                        % f merupakan banyaknya gelombang yg ingin di plot
plot(t,s1)              % memplot hasil data menjadi grafik sinus
