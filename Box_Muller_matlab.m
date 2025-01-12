
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Channel simulation for NVM 
%   1) Simulation of the Gaussian random variables using Box-Muller
%   2) Part 1 shows the feature of Gaussian distribution .
%   3) Part 2 shows the distribution using Box-Muller.
%   4) Part 3 analyse with 2 portion.
%   5) Change some format and save as .coe for ROM's initial value
%
%   Date: June 2016, Jiaying Wen, Singapore University of Technology  
%         and Design (SUTD)
%==========================================================================
% clc;
% clear all;
% N=1000000;
% Standard_10=normrnd(0,1, 1, N);
% 
% 
% %-----Test the distribution------------------------------------------------
% 
% 
%  Standard_2_35_t=normrnd(2,2, 1, N);
%  [y1 x1]=hist(Standard_2_35_t, 1000);
%  figure(1);
%  h1=plot(x1,y1);
%  hold on;
%  
%   Standard_2_35=2+(Standard_10.*2);
%  [y1 x1]=hist(Standard_2_35, 1000);
%  figure(1);
%  h1=plot(x1,y1,'r');
%  hold on;
%  
%  
%  set(gcf,'color','w');
%  grid on;
%  



%----------------2 ------------------------
% clc;
% n=1e5;                   %number of samples
% num_iter=1e3;            %number of monte carlo iterations
% 
% A=0;         %constant to be estimated
% A_hat=zeros(num_iter,1);
% sigma=1;                 %noise standard deviation
% 
% for i=1:num_iter
%     u1=rand(n,1); %~U[0,1]
%     u2=rand(n,1); %~U[0,1]
% 
%     %Box-Mueller Transform
%  %   w1=sqrt(-2*log(u1)).*cos(2*pi*u2); %~N(0,1)
%     w2=sqrt(-2*log(u1)).*sin(2*pi*u2); %~N(0,1)
% 
%     x=A+ sigma*w2; %x \in R
%    % A_hat(i)=-1/2+sqrt((x'*x)/length(x)+1/4);
% end
% 
%  [y1 x1]=hist(x, 1000);
%  figure(1);
%  h1=plot(x1,y1);
%  hold on;
% 
%  Standard_10=normrnd(0,1, 1, n);
%  Standard_2_35=A+(Standard_10.*sigma);
%  [y1 x1]=hist(Standard_2_35, 1000);
%  h1=plot(x1,y1,'r');
%  legend('0 ','0');
%  hold on;
%  
 %--------------- 3 --------------------------------

% clc;
% clear all;
% n=1024;                   %number of samples
% 
% mean =0;
% sigma=1;                 %noise standard deviation
% x=1/n:1/n:1;
% 
%     %Box-Mueller Transform
%     w1=(-2.*log(x)).^(0.5);
%     w2= cos(2* 3.14159 * x);
%     w2= sin(2* pi * x);
%     op=w1 .* w2 ;
% 
% 
% figure(1);
% h1=plot(x,w1,'k');
% hold on;
% 
% h2=plot(x,w2,'r');
% hold on;
% 
% grid on;

%--------------- 4 --------------------------------
% 
% clc;
% clear all;
% n=1024;                   %number of samples
% 
% mean =0;
% sigma=1;                 %noise standard deviation
% x=1/n:1/n:1;
% 
%     %Box-Mueller Transform
%     w1=(-2.*log(x)).^(0.5);
% %    w2= cos(2* 3.14159 * x);
%     w2= sin(2* pi * x);
%     op=w1 .* w2 ;
% 
% 
% figure(1);
% h1=plot(x,w1,'k');
% hold on;
% 
% h2=plot(x,w2,'r');
% hold on;
% 
% grid on;
%--------------- 5 modelsim data check--------------------------------
% 
clc;
clear all;

a(1,:)=textread('Data-g0-sin.txt','%d');  
%a=a./(2^11);
mean_a=mean(a)
stadand_a=std(a)
 [y1 x1]=hist(a, 1000);
 figure(1);
 h1=plot(x1,y1);
 hold on;


b(1,:)=textread('Data-g1-cos.txt','%d');    
%b=b./(2^11);
mean_b=mean(b)
stadand_b=std(b)
 [y1 x1]=hist(b, 1000);
 figure(2);
 h1=plot(x1,y1);
 hold on;




 