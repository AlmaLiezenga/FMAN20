function [up, r] = projection(u, base)
%set empty arrays and matrices to use later
x = zeros(1,4);
up = zeros(size(base(:,:,1)));

%calculate the projection of u onto the bases
for i=1:4
    x(i) = sum(dot(u,base(:,:,i)), 'all');
    up = up + x(i) * base(:,:,i);
end

%calculate the error norm
v = u - up; 
r = sqrt(sum(dot(v, v), 'all')); 
end
