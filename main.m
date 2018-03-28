close all;clear;
clc;

%% QUESTION 1 %%
fprintf('\n QUESTION 1 : POTENTIAL FIELD\n')

% Gain
k1 = 50;
k2 = 50;
k3 = 50;
kg = 500;
kp = 5;



initialCond1 = [0; 0; pi/3];
initialCond2 = [0; 0; pi/3];
initialCond3 = [0; 0; pi/3];
initialCond4 = [0; 0; pi/3];


% Position of obstacle 1
x1 = 3;
y1 = 2;

% Position of obstacle 2
x2 = 6;
y2 = 5;

x3 = 3;
y3 = 4;

theta = pi/3;

% Position of Target
xg = 10;
yg = 10;

x = 0:0.1:13;
y = 0:0.1:13;
n = length(x);


% CALCULATING POTENTIAL FIELDS
[vt] = computeV(n, x, y, x1, y1, x2, y2,x3,y3, xg, yg, k1, k2,k3, kg);


% PLOTTING
figure;
mesh(x,y,vt);
title(' 3D PLOT OF POTENTIAL FIELDS ');
xlabel('X');
ylabel('Y');
zlabel('Z');

figure;
plot(vt);
title(' 2D PLOT OF POTENTIAL FIELDS');
xlabel('X');
ylabel('Y');

fprintf(' Press ENTER for Potential field navigation simulation\n')
pause;


%% QUESTION 2 %%

close all;
fprintf(' QUESTION 2 : POTENTIAL FIELD NAVIGATION \n')

[Fx, Fy] = computeforces(xg,yg,kg,x1,y1,k1,x2,y2,x3,y3,k2,k3);

fprintf('\n 3D plot of X components...');
figure(1);
mesh(x,y,Fx);
title('X COMPONENTS')

fprintf('\n 3D plot of Y components...');
figure(2);
mesh(x,y,Fy);
title('Y COMPONENTS')



[t,matrix1] = ode23('robotdynamics',[0 8],initialCond1);

robot1_xposi = matrix1(:,1);
robot1_yposi = matrix1(:,2);

[t,matrix2] = ode23('robotdynamics',[0 8],initialCond2);
robot2_xposi = matrix2(:,1);
robot2_yposi = matrix2(:,1);

[t,matrix3] = ode23('robotdynamics',[0 8],initialCond3);
robot3_xposi = matrix3(:,1);
robot3_yposi = matrix3(:,1);


[t,matrix4] = ode23('robotdynamics',[0 8],initialCond4);
robot4_xposi = matrix4(:,1);
robot4_yposi = matrix4(:,1);




for i = 1: n
for j = 1: n 
    v1(j,i) = (k1) / sqrt((x(i)-x1)^2 + (y(j)-y1)^2);
    v2(j,i) = (k2) / sqrt((x(i)-x2)^2 + (y(j)-y2)^2);
    vg(j,i) = (kg) * sqrt((x(i)-xg)^2 + (y(j)-yg)^2);
end
end

Vt = v1+v2+vg;

fprintf('\n Contour plot...')
displayData(robot1_xposi,robot1_yposi,xg,yg,x1,y1,x2,y2,x3,y3,Vt,x,y);
displayData(robot2_xposi,robot2_yposi,xg,yg,x1,y1,x2,y2,x3,y3,Vt,x,y);
fprintf('\n Press ENTER for short movie, still working on it...');
pause;


%% SWARM/PLATOON FORMATION VIDEO %%
close all;
plot(xg, yg, 'r-s','LineWidth',2)
hold on;
plot(x1,y1, 'k-s','LineWidth',2)
hold on;
plot(x2,y2, 'k-s','LineWidth',2)
hold on; 
plot(x3,y3, 'k-s','LineWidth',2)
hold on;

for k = 1:90
    
    plot(robot1_xposi(k),robot1_yposi(k),'b.');
    F(k) = getframe;
    plot(robot2_xposi(k),robot2_yposi(k),'m.');
    F(k) = getframe;
    plot(robot3_xposi(k),robot3_yposi(k),'r.');
    F(k) = getframe;
    plot(robot4_xposi(k),robot4_yposi(k),'g.');
    F(k) = getframe;
end

figure;
imshow(F.cdata);








