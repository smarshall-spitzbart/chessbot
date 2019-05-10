function yaxis(points,n)
%n number of points, points %cell of actual points
i=1;
xpoints = zeros(1,n);
ypoints = zeros(1,n);
zpoints = zeros(1,n);
for i=1:n;
    point = points{1,i}
    xpoints(1,i) = point(1,1);
end
i =1;
for i=1:n;
    point = points{1,i}
    ypoints(1,i)= point(1,2);
end
i=1;
for i=1:n;
    point = points{1,i}
    zpoints(1,i)= point(1,3);
xbar = mean(xpoints);
ybar = mean(ypoints);
zbar = mean(zpoints);

