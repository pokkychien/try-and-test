%integral
function [y_out] = Integral(x0,x1,y)
x=linspace(x0,x1,(x1-x0)*500);
Sig_y = 0;
for i=1:length(x)-1
Sig_y = Sig_y+y(x(i))*(x1-x0)/length(x);
end
y_out = Sig_y;
