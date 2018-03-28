function displayData(robot_xposi,robot_yposi,xg,yg,x1,y1,x2,y2,x3,y3,Vt,x,y)



figure;
plot(robot_xposi,robot_yposi,'b.')
hold on
plot(xg, yg, 'r-s','LineWidth',2)
hold on
plot(x1,y1, 'k-s','LineWidth',2)
hold on
plot(x2,y2, 'k-s','LineWidth',2)
hold on
plot(x3,y3, 'k-s','LineWidth',2)
hold on
xlim([0 11])
ylim([0 11])
xlabel('x')
ylabel('y')
title(' Mobile Robot Trajectory')


figure;
contour(x,y,Vt)
hold on
plot(robot_xposi,robot_yposi,'k','LineWidth',2);
hold on
plot(xg,yg,'r-s','LineWidth',2)
xlabel('x')
ylabel('y')
title('\bfContour Plot of Single Mobile Robot Trajectory ')





end