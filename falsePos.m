function [xr,Ea,i,elapsedTime] = falsePos(f,xl,xu,stoppingErrorCriteria,maxIterations)
    tic
    while xl>xu || xl==xu
        fprintf('\nUpper x point should be greater than lower x point.\n')
        xl = input('Lower x value:  ');
        xu = input('Upper x value:  ');
    end
    plot(xl:0.01:xu,f(xl:0.01:xu),'k')
    grid on; hold on
    xr = xu-((f(xu)*(xl-xu))/(f(xl)-f(xu)));
    xrPrevious = xr;
    for i=1:maxIterations
        xr = xu-( (f(xu)*(xl-xu))/(f(xl)-f(xu)) );
        Ea = 100*abs((xr-xrPrevious)/xr);
        if f(xl)*f(xr)<0
            xrPrevious = xu;
            xu = xr;    
        elseif f(xl)*f(xr)>0
            xrPrevious = xl;
            xl = xr; 
        end
        if i>1 && Ea<stoppingErrorCriteria && abs(f(xr))<0.001
            plot(xr,f(xr),'b*')
            break
        end
        plot(xr,f(xr),'go')
        hold on
    end
    if abs(f(xr))>0.001
        xr = "No Root Found, please change the interval limits.";
        Ea = "No Root Found, please change the interval limits.";
    end
    % title('False-Position Method - f(x) = x^2+x-14')
    xlabel('x'); ylabel('y(x)')
    elapsedTime = toc;
