function [root,EaFinal,i,elapsedTime] = brents(f,x1,x2,x3,stoppingErrorCriteria,maxIterations)
    tic
    if length(unique([x1 x2 x3]))~=3
        fprintf('\nData points should not be the same value.\n\n')
        x1 = input('First data point: ');
        x2 = input('Second data point: ');
        x3 = input('Third data point: ');
    end
    xVect = zeros(maxIterations,1);
    Ea = xVect;
    xVect(1,1) = x1;
    xVect(2,1) = x2;
    xVect(3,1) = x3;
    for i=4:maxIterations
        R = f(xVect(i-2,1))/f(xVect(i-1,1));
        S = f(xVect(i-2,1))/f(xVect(i-3,1));
        T = f(xVect(i-3,1))/f(xVect(i-1,1));
        P = S*(T*(R-T)*(xVect(i-1,1)-xVect(i-2,1))-(1-R)*(xVect(i-2,1)-xVect(i-3,1)));
        Q = (T-1)*(R-1)*(S-1);
        xVect(i,1) = xVect(i-2,1)+P/Q;
        if i>3
            Ea(i,1) = 100*abs((xVect(i,1)-xVect(i-1,1))/xVect(i,1));
        end
        ifNaN = any(xVect(i,1));
        if ifNaN == 0
            break
        end
        if i>1 && Ea(i,1)<stoppingErrorCriteria
            xVectFinal(1:i,1)=xVect(1:i,1);
            EaVectFinal(1:i+1,1)=Ea(1:i+1,1);
            break
        end
        plot(xVect(i,1),f(xVect(i,1)),'go')
        hold on
    end
    plot(-14:0.01:5,f(-14:0.01:5),'k')
    grid on; hold on
    plot(xVectFinal(i,1),f(xVectFinal(i,1)),'b*')
    xlabel('x'); ylabel('y(x)')
    root = xVectFinal(end,1);
    EaFinal = EaVectFinal(end,1);
    elapsedTime = toc;
    i = i-3; % First three Iterations
end
