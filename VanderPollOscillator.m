clear all;
dt=2*(10^(-7));
alpha=1.0;
sigma=0.2;
T=8;
N=T/dt;
k=11;
e=.2;
X_1(1)=-k*e;
X_2(1)=0;
dW(1)=randn*sqrt(dt);
figure();
for k=11:4:19
    X_1(1)=-k*e;
    for j=2:N
        dW(j)=randn*sqrt(dt);
        X_1(j)=X_1(j-1)+(dt*X_2(j-1));
        X_2(j)=X_2(j-1)+(dt*(X_1(j-1)*(alpha-(X_1(j-1)^2))-X_2(j-1)))+(sigma*X_1(j-1)*dW(j-1));
    end
    

   t=1:N;
    subplot(2,1,1);plot(X_1)
    subplot(2,1,2);plot(X_2)
     hold on
    ax = gca;
    ax.XAxisLocation = 'origin';
    ax.YAxisLocation = 'origin';
    xlabel('t','FontSize',16) 
    ylabel('X_1','FontSize',16)
end
    

