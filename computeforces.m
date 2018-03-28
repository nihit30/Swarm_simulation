function[Fx, Fy] = computeforces(xg,yg,kg,x1,y1,k1,x2,y2,x3,y3,k2,k3)

x = 0:0.1:13;
y = 0:0.1:13;
n = length(x);

for i = 1:n
    for j=1:n

            rg = sqrt((x(i)-xg)^2 + (y(j)-yg)^2);
            Fgx(i,j) = kg/rg * (xg-x(i)); 
            Fgy(i,j) = kg/rg * (yg-y(j));
            
            
            % Distance
            r1 = sqrt((x(i)-x1)^2 + (y(j)-y1)^2);
            r2 = sqrt((x(i)-x2)^2 + (y(j)-y2)^2);
            r3 = sqrt((x(i)-x3)^2 + (y(j)-y3)^2);
     
            % Forces due to obstacle 1
            F1x(i,j) = (-k1/(r1^2)) * (x1 - x(i)/r1);
            F1y(i,j) = (-k1/(r1^2)) * (y1 - y(j)/r1);
                   
            
             % Forces due to obstacle 2
            F2x(i,j) = (-k2/(r2^2)) * (x2 - x(i)/r2);
            F2y(i,j) = (-k2/(r2^2)) * (y2 - y(j)/r2);
            
             % Forces due to obstacle 3
            F3x(i,j) = (-k3/(r3^2)) * (x3 - x(i)/r3);
            F3y(i,j) = (-k3/(r3^2)) * (y3 - y(j)/r3);

            
            Fx = F1x + F2x + F3x + Fgx;
            Fy = F1y + F2y + F3y + Fgy;
            
            

    end
end
end