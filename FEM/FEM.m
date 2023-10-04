%%%FEM dT/dt+k(T-Te)=0,
clc;clear;close
Te=0.5; k=2; n=3;
x=linspace(0,1,n);
h=x(2)-x(1);
phi_0 = @(t) (h-t)/h;
phi_n0= @(t) t/h;
phi_n1= @(t) (1-t)/h;
phi_1 = @(t) (t-h)/h;
dphi_0 = -1/h; %% dhpi_0=dphi_n1
dphi_1 =  1/h; %% dphi_1=dphi_n0
b00=@(t) dphi_0*phi_0;
b01=@(t) dphi_1*phi_0;
b10=@(t) dphi_0*phi_1;
b11=@(t) dphi_1*phi_1;
k00=k.*phi_0.^2;
k01=k.*phi_n0.*phi_0;
k11=k.*phi_1.^2;
% k10=k*phi_n0*phi_0;
beta=zeros(n);
beta(1,1)=integral((b00+k00),x(1),x(2));
beta_01=integral((b01+k01),x(1),x(2));
beta_10=integral((b10+k01),x(1),x(2));
beta(n,n)=integral((b11+k11),x(n-1),x(n));
% for i=1:n
%     for j=1:n
%         if(i==1&&j==1)
%             beta(i,j)=integral((phi_0*dphi_0+k*phi_0^2),x(i),x(i+1));
%         elseif(i==n&&j==n)
%             beta(i,j)=integral((phi_1*dphi_1+k*phi_1^2),x(i),x(i+1));
%         elseif(i==j)
%             beta(i,j)=integral(k*(phi_0+phi_1)^2,x(i-1),x(i+1));
%         elseif(abs(i-j)==1)
%             if(j>i)
%             beta(i,j)=integral((dphi_0*phi_0+k*phi_0*phi_n0),x(i),x(i+1));
%             elseif(j<i)
%                 beta(i,j)=integral((dphi_1*))
%             end
%         end
% 
%     end
% end
