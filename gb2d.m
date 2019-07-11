function outpic = gb2d(inpic,lambda,stddev,up)
outpic = zeros(size(inpic)); % Generate filter size of input picture
[x y] = meshgrid(-size(inpic,1)/2:(size(inpic,1)/2)-1,-size(inpic,2)/2:(size(inpic,2)/2)-1);
x = x*cos(up)+y*sin(up);
y = -x*sin(up)+y*cos(up);
outpic = exp(-.5*(x.^2+y.^2)/(stddev^2)).*cos(2*pi/lambda.*x);

