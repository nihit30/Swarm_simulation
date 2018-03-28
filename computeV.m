function [vt] = computeV(n, x, y, x1, y1, x2, y2,x3,y3, xg, yg, k1, k2, k3, kg)



for i = 1:n
    for j = 1:n
        
        % vector to each obstacle
        ro1 = sqrt((x(i)-x1)^2 + (y(j)-y1)^2);
        ro2 = sqrt((x(i)-x2)^2 + (y(j)-y2)^2);
        ro3 = sqrt((x(i)-x3)^2 + (y(j)-y3)^2);
        
        
        rg = sqrt((x(i)-xg)^2 + (y(j)-yg)^2);
        
        v1(j,i) = k1 / ro1;            % repulsive potential
        v2(j,i) = k2 / ro2;            % repulsive potential
        v3(j,i) = k3 / ro3;
        vg(j,i)  = kg * rg;             % attractive potential
        vt = v1 + v2 + v3 + vg;
    end
end



end