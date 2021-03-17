function [root,Ea,i,elapsedTime] = newtonraphson(f,df,x1,stoppingErrorCriteria,maxIterations)
    tic
    xVect = zeros(maxIterations,1);
    Ea = xVect;
    xVect(1,1) = x1;
    for i=1:maxIterations
        xVect(i+1,1) = xVect(i,1)-(f(xVect(i,1))/df(xVect(i,1)));
        if i>1
            Ea(i,1) = 100*abs((xVect(i,1)-xVect(i-1,1))/xVect(i,1));
        end
        ifNaN = any(xVect(i+1,1));
        if ifNaN == 0
            break
        end
        if i>1 && Ea(i,1)<stoppingErrorCriteria
            xVectFinal(1:i,1) = xVect(1:i,1);
            EaVectFinal(1:i+1,1) = Ea(1:i+1,1);
            break
        end
        plot(xVect(i,1),f(xVect(i,1)),'go')
        hold on
    end
    plot(-14:0.01:5,f(-14:0.01:5),'k')
    grid on; hold on;
    plot(xVectFinal(i,1),f(xVectFinal(i,1)),'b*')
    xlabel('x'); ylabel('y(x)')
    root = xVectFinal(end,1);
    Ea = EaVectFinal(end,1);
    elapsedTime = toc;
end
