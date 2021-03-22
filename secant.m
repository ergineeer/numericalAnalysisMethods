function [rootVal,EaFinal,i,elapsedTime] = secant(f,x1,x2,stoppingErrorCriteria,maxIterations)
    tic
    xVect = zeros(maxIterations,1);
    Ea = xVect;
    xVect(1,1) = x1;
    xVect(2,1) = x2;
    
    for i=2:maxIterations
        xVect(i+1,1) = xVect(i,1)-(f(xVect(i,1))*(xVect(i-1,1)-xVect(i,1))/( f(xVect(i-1,1))-f(xVect(i,1))));
        Ea(i,1) = 100*abs((xVect(i,1)-xVect(i-1,1))/xVect(i,1));
        ifNaN = any(xVect(i+1,1));
        if ifNaN == 0
            xVectFinal(1:i,1) = xVect(1:i,1);
            EaVectFinal(1:i+1,1) = Ea(1:i+1,1);
            break
        end
        if i>1 && Ea(i,1)<stoppingErrorCriteria
            xVectFinal(1:i,1) = xVect(1:i,1);
            EaVectFinal(1:i+1,1) = Ea(1:i+1,1);
            break
        end
    end
    rootVal = xVectFinal(end,1);
    EaFinal = EaVectFinal(end,1); 
    i = i-1;    
    plot(-14:0.01:5,f(-14:0.01:5),'k')
    grid on; hold on
    plot(xVectFinal(end,1),f(xVectFinal(end,1)),'b*')
    plot(xVectFinal,f(xVectFinal),'go')
    xlabel('x'); ylabel('y(x)')
    elapsedTime = toc;
end
