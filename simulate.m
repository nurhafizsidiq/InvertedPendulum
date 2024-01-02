%% Muhammad Nurhafiz Sidiq
% 20/460179/TK/50768
% Control of Inverted pendulum on cart with partial feedback linearization
clc
clear all
close all


%% run simulation using ode45
t = 0:0.001:30;
t1 = 0:0.001:30;
x0 = [0 0 0 0];
[t x] = ode45(@IPoC,t,x0);

%% target
for i=1:length(t)
    x1(i) = 5;
    x2(i) = 0;
    x3(i) = pi;
    x4(i) = 0;
    
end

%% plot

figure(1)
subplot(2,1,1)
plot(t,x(:,1),'-r',t,x1,'--k')
xlabel('Time (second)')
ylabel('m') 
title('x1')
subplot(2,1,2)
plot(t,x(:,2),'-r',t,x2,'--k')
xlabel('Time (second)')
ylabel('m/s')
title('x2')
figure(2)
subplot(2,1,1)
plot(t,x(:,3),'-r',t,x3,'--k')
xlabel('Time (second)')
ylabel('rad')
title('x3')
subplot(2,1,2)
plot(t,x(:,4),'-b',t,x4,'--k')
xlabel('Time (second)')
ylabel('rad/s')
title('x4')


%% animation
L=1;
X0 = 0;
Y0 = 0;
temp = 20
for i=1:length(t1)/temp
    figure(3)
    Xc = x(temp*i,1);
    Xp = x(i*temp,1) + 5*L*sin(pi-x(i*temp,3));
    Yp = L*cos(pi-x(temp*i,3));
    %Yp = L;
    time = i/50;
    
    %plot([-150,150],[-0.48,-0.48],'linewidth',2,'color','k');
    plot([-5,20],[-0.45,-0.45],'linewidth',2,'color','k');
    %axis([-15 15 -3 3]);
    axis([-5 15 -2 2]);
   
    hold on
    line([Xc Xp],[Y0 Yp],'linewidth',4,'color','r');
    plot(Xc,Y0,'s','markersize',50,'markerfacecolor','#EDB120');
    
    plot(Xc-0.9,Y0-0.35,'o','markersize',15,'markerfacecolor','b');
    plot(Xc+0.9,Y0-0.35,'o','markersize',15,'markerfacecolor','b');
   
   
   

    %line([Xc Xp],[Y0 Yp],'linewidth',5,'color','r');
    text(-2.5,-1.7,'time = ');
    text(0.9,-1.7,{time});
    text(3.4,-1.7,'s');
    hold off
end