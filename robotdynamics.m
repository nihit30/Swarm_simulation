function [ret] = robotdynamics(t,initialCond)

    k1 = 50;
    k2 = 100;
    k3 = 50;
    kg = 500;
    kp = 10;
    
    % Position of Target
    xg = 10;
    yg = 10;
    
    % Position of obstacle 1
    x1 = 3;
    y1 = 2;
    
    % Position of obstacle 2
    x2 = 6;
    y2 = 7;
    
    % Position of obstacle 3
    x3 = 3;
    y3 = 4;

    
   x = initialCond(1);
   y = initialCond(2);
   theta = initialCond(3);
   L = 4;
   V = 5;
   
    rg=sqrt((xg-x)^2+(yg-y)^2);
    r1=sqrt((x1-x)^2+(y1-y)^2);
    r2=sqrt((x2-x)^2+(y2-y)^2);
    r3=sqrt((x3-x)^2+(y3-y)^2);
    
    fgx=(kg*(xg-x))/rg;
    fgy=(kg*(yg-y))/rg;
 
    
    fx1=-(k1*(x1-x))/r1^3;
    fy1=-(k1*(y1-y))/r1^3;
 
    
    fx2=-(k2*(x2-x))/r2^3;
    fy2=-(k2*(y2-y))/r2^3;
    
    fx3=-(k3*(x3-x))/r3^3;
    fy3=-(k3*(y3-x))/r3^3;
 
 
    Fxt=fgx+fx1+fx2+fx3;
    Fyt=fgy+fy1+fy2+fy3;
    
    
    alpha=atan2(Fyt,Fxt); % Calculating the value of alpha
    phi=kp*(alpha-theta); % Calculating the value of phi
    xdot=V*cos(phi)*cos(theta);
    ydot=V*cos(phi)*sin(theta);
    thetadot=(V*sin(phi))/L;
    ret=[xdot;ydot;thetadot];

   
end