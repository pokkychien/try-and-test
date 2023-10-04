%%FEM_fixed
clc;clear;
close
Te=0.5; k=2; n=5;
x=linspace(0,1,n);
t=linspace(0,1,n*100);
h=x(2)-x(1);
T=zeros(n,1);
T(1)=1;
s=@(t) exp(-k*t)+Te*(1-exp(-k*t));
m=1/h;
phi_k01 = @(t) (h-t).*t./(h.^2);
beta_00=-h/2;
beta_k01=integral(phi_k01,h,0);
beta_k00=beta_k01*2;

for i=1:n*100 %compare meth sol
    s1(i)=s(t(i));
end

y=zeros(n,1);  %%creat Vector y
y(1)=k*Te*beta_00;
y(n)=k*Te*beta_00;
for i=2:n-1
    y(i)=k*Te*beta_00*2;
end

beta=zeros(n);  %%creat Matrix beta
for i =1:n
    for j=1:n
        if(i==j)
            if (i==1)
                beta(i,j)=-m*beta_00+k*beta_k00;
            elseif(i==n)
                beta(i,j)=m*beta_00+k*beta_k00;
            else
                beta(i,j)=k*beta_k00*2;
            end
        elseif(j==i+1)
            beta(i,j)=m*beta_00+k*beta_k01;
        elseif(j==i-1)
            beta(i,j)=-m*beta_00+k*beta_k01;
        end
    end
end

y(2)=y(2)-T(1)*beta(2,1);
T(2:n)=beta(2:n,2:n)\y(2:n);

plot(x,T);
hold on
plot(t,s1,'r');


