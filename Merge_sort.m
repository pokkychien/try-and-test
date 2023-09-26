%Merge sort
%writen by HungSheng 2022.10.07
clc
clear
num = load('numbers.txt','-ascii');
HS = fopen("Result.txt",'w');
%disp(num);

mg = merge(num,1,HS);
disp(mg)

fprintf(HS,'%d\b', mg);


