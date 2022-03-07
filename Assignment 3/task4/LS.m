function leastsquares = LS(x, y)
    xsquared = x;
    npoints = max(size(x)); 
    
    for i=1: size(xsquared)
        xsquared(i) = x(i)^2; 
    end 
    
    xy = x;
    
    for i=1: size(xy) 
        xy(i) = x(i) * y(i); 
    end 
    
    sumx = sum(x);
    sumy = sum(y);
    sumxsquared = sum(xsquared);
    sumxy = sum(xy);
    
    k = (npoints*sumxy - sumx*sumy)/(npoints*sumxsquared - sumx^2);
    m = (sumy - k*sumx)/npoints; 
    
    leastsquares = [k, m]; 

end