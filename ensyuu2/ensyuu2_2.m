%% 222C1021 今村優希
%% 情報理論 計算機演習2

%% 演習2-2 相互情報量のグラフ
clear,clc,close all;

x = 0:0.0001:1;                         %%xが0から1まで0.0001刻みの点
y = 1 + x.*log2(x) + (1-x).*log2(1-x);  %%相互情報量を求める式
plot(x,y)                               %%X,Yをグラフにプロット
title('Relationship between error probability and mutual information')
xlabel('p')
ylabel('I(X;Y)')
