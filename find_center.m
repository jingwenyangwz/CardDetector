function [mass_x, mass_y] = find_center(MASK)
% MASK: logical array (only zeros and ones).
%
% mass_x: coordinate of center of mass (horizontal), integer
% mass_y: coodrinate of center of mass (vertical), integer

[m,n] = size(MASK);
col = 1:m;
row = 1:n;
[x, y] = meshgrid(row,col);
X_masked = x.*MASK;
Y_masked = y.*MASK;
mass_x = round(sum(X_masked(:))/sum(MASK(:)));
mass_y = round(sum(Y_masked(:))/sum(MASK(:)));


    
end