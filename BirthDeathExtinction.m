%Q.1 (a) and (b) part
clear all; 
birth=0;
    death=0;
    n=5;
    i=1;
    n_pop(1) = 5;
    t(1)=0;
    T=20;
    while t(i)<=T
        lambda = ((8.12*(n)+2.43)/60); 
        mu = ((9.04*(n))/60);
        
        u_birth = unifrnd(0,1);
        u_death = unifrnd (0,1);
        
        time_mu(i)= -(1/mu)* log(u_death);                           %time for death from a particular state
        time_lambda(i)= -(1/lambda)*log(u_birth);                     %time taken for birth 
       
        if time_lambda(i)<time_mu(i)                                    %birth occurs
            n=n+1;                         % move to forward state
            birth=birth+1;
            t(i+1)=t(i)+ time_lambda(i);    %updating clock
       
        elseif time_lambda(i)>time_mu(i)    %death occurs
            n=n-1;                             % move to backward state
            death=death+1;
            t(i+1)=t(i)+ time_mu(i); 
       
        elseif time_lambda(i) == time_mu(i)
            n=n;
            t(i+1) = t(i) + time_lambda(i);
        end
        
        n_pop(i+1) = n;                     %storing population size in array
        i=i+1;
    end
    disp("Variation of POPULATION");
    disp(n_pop);
    disp("Simulated time ");
    disp(t);
    plot(t(1:i-1), n_pop(1:i-1));
    xlabel('simulated time');
    ylabel("Population");
    
    
     
      
    
  %Q.1 (c) part  
  
    
    t_extinction = 0;
for j = 1:3000
    birth=0;
    clear n_pop;
    clear t;
    death=0;
    n=5;
    i=1;
    t(1) = 0;
    n_pop(1) = 5;
    
    while(n ~=0)
        lambda = (8.12*(n)+2.43)/60; 
        mu = (9.04*(n))/60;
        u_birth = unifrnd(0,1);
        u_death = unifrnd (0,1);
        time_mu(i)= -(1/mu)* log(u_death); %time for death from a particular state
        time_lambda(i)= -(1/lambda)*log(u_birth); %time taken for birth 
        
        if time_lambda(i)<time_mu(i) %birth occurs
            n=n+1;  % move to forward state
            birth=birth+1;
            t(i+1)=t(i)+ time_lambda(i);
       
        elseif time_lambda(i)>time_mu(i) %death occurs
            n=n-1;  % move to backward state
            death=death+1;
            t(i+1)=t(i)+ time_mu(i);
        
        elseif time_lambda(i) == time_mu(i)
            n=n;
            t(i+1) = t(i) + time_lambda(i);
        end
        
        n_pop(i+1) = n;
        i=i+1;
    end
    t_extinction =t_extinction+ t(i);
    
end

disp("Extinction TIME (minutes)");
disp(t_extinction/3000);