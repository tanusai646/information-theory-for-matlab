% test
clear,clc,close all;

for i = 1:10
    x(i) = i /10;
    t = log(x(i));
    y(i) = t;

end

scatter(x,y)