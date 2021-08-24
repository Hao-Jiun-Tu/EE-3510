%% 8.1
clc;clear all; close all;

num=[30];
den=[1 1 30];
sys=tf(num,den);
w=logspace(0,2,400);    %0~100 產生400個點
[mag,phase]=bode(sys,w);
[y,l]=max(mag); 
Mpw=20*log10(y)        %peak value of magnitude
wr=w(l)                %resonant frequency
bode(sys,w)
%% 8.4
clc;clear all; close all;

num=[60];
den=[1 6 0];
w=logspace(0,2,400);
sys=tf(num,den);
sys_fb=feedback(sys,1);
bode(sys_fb,w)


%% 8.9
clc;clear all; close all;

dc=0.707;               %when dc=1 mag(at freq=0)=+3db=1.41 -> 1/1.41=0.707
num=dc*[1 1001 1000];   %zeros: 0 1000
den=[1 110 1000];       %poles: 10 100
w=logspace(-1,4,400);
sys=tf(num,den);
[mag,phase]=bode(sys,w);
[y,l]=max(mag); 
Mpw=20*log10(y)        %peak value of magnitude
wr=w(l)                %resonant frequency
bode(sys,w)

%% 9.3
clc;clear all; close all;

%(a)
sys1=tf(1,[1 0.5]);
figure;
nichols(sys1);
ngrid;
figure;
margin(sys1);

%(b)
sys2=tf(4,[1 4 4]);
figure;
nichols(sys2);
ngrid;
figure;
margin(sys2);

%(c)
sys3=tf(6,[1 6 11 6]);
figure;
nichols(sys3);
ngrid;
figure;
margin(sys3);
