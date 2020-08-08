%Consider a machine that works as follows. 
% If it is up at the beginning of a day, it stays up at the beginning of the next day 
% with probability p 
% and fails with probability 1 - p. It takes exactly 2 days for the repairs, at the 
% end of which the machine is as good as new. 
% Let Xn be the state of the machine at the beginning of day n, where the state is 0 
% if the machine has just failed, 1 if 1 day’s worth of repair work is done on it, and 2 if it is up.
% Show that {Xn: n ≥ 0} is a DTMC, and display its transition probability matrix. 
% Suppose the machine is initially up. 
% Compute the probability that the machine is up at times n = 5; 10; 15; and 20. 
% (Assume p = 0.95)


%transition probablity matrix
P=[0,1,0;0,0,1;.05,0,.95];                               

o='probablity that the machine is up at times n =';

%Discrete time markov chain
mc=dtmc(P);                                                                  

%loop for n=5,10,15,20
for i=5:5:20                                                                
    %getting the desired column corresponding to state 2
    t=(P^i)*([0,0,1]');   
    %third row corresponds to state 2
    L=t(3,1);                                                                
    X=sprintf('%s %d is %d',o,i,L);
    disp(X);
end


%Number of steps to be taken.
rng(9);
N=15;     
X0=zeros(1,3);
%starting simulation from state 2 upto 15 steps
X0(3)=1;            
Y=simulate(mc,N,'X0',X0);
%displaying the steps taken randomly
disp("Steps taken in simulation");
disp(Y);        
simplot(mc,Y);

%simulation without using function
%we will fix a starting state let it be 3rd , then we would
%have a probablity distribution corresponding to third row,
%we will take out the CDF of the probablity distribution and then using
%uniform random varaibles we will simulate it.

% chain=zeros(1,15);
% starting_state=3;
% chain(1)=starting_state;
% for i=2:15
%     q=P(chain(i-1),:);
%     cdf=cumsum(q);
%     rn=rand();
%     chain(i) = find(cdf>rn,1);%finding the first occurence of the inequality
%     
% end
% disp(chain);



%Limiting Distribution using V(P-I)=0
A=[(P-eye(3))';[1,1,1]];
limiting_probablity=A\[0;0;0;1];  %a=A\[0;0;0;1] solves system of equations Aa=[0;0;0;1]

%Limiting Distribution using function
T=asymptotics(mc);
Limiting__probablity=T';
disp('Limiting probablity matrix');
disp(limiting_probablity);
% 
% %limiting distribution using convergence
% l=zeros(3,3);
% r=zeros(N,3);
% for i=1:N
%     l=vpa(P^i);
%     for j=1:3
%        r(i,j)=l(1,j);       %extracting any row from l(it doesn't matter) for convergence
% 
%     end
%     
%    % disp(l);
% end
% for i=5:N
%     for j=1:3
%             if i<N
%               
%                      if r(i+1,j)-r(i,j)< (10^(-12)) 
%                         disp(r(i+1,j));
%                      end
%             end
%     end
%                 
%             
%         
% end

%PLOT SHOWING CONVERGENCE OF 3 STATES
% hold on
% plot(r(:,1));
% xlabel('number of steps');
% ylabel('corresponding to all three states');
% plot(r(:,2));
% plot(r(:,3));
% legend ('state1','state2','state3');
% hold off
