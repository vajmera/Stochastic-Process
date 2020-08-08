% % % Q.2
%Consider the stationary Gaussian process 
% X(t) = W(t)+t    t>0 
%for where {W(s)}s ∈ R is a Wiener process so that increments are N(0, 1) distributed.  
% Simulate a sample path of {X(t)}t ∈ [0,10] and show the result with a plot

%

% 
% clear all;
% i=0;
% N=100;                                % path length
% T=1/N;                                %assuming intervals of same length  
% y(1)=sqrt(T)*normrnd(0,1);            
% w(1)=y(1); 
%     for i=1:N
%     y(i+1)=sqrt(T)*normrnd(0,1);      %generating normal rand var with mean 0 and standard deviation sqrt(T)*1
%     w(i+1)=w(i)+y(i+1);               %adding the deviation
%     x(i+1)=w(i)+(10-0)*rand()+0;      %generating t randomly ranging between 0 and 10 and adding weiner process corresspondingly
%     end
%     
%     
% %code for displaying first passage time
% k=1;alpha=2;
% S="First passage time when alpha=2, comes around out to ";
% while(k<=N)
%   if(x(k)>=alpha)               %alpha=2
%        disp(S+k);
%        break;
%    end
%    k=k+1;
% end
% t=1:N+1;
% plot(t,x);
% xlabel('time line');
% ylabel('Sample Path');
% grid on; 
% 
%  
% 
% 