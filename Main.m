% % % % % % % % % % %
% 
% Works, Not Complete
% 17/03/2021
% 
% % % % % % % % % % %

%% Cleaning
clear
clc

%% Input Function and Variables
func = @(x) x.^(2)+x-14;
xl = -14;
xu = 0;
terminationCriteria = 0.00001;
maxIterations = 100;

%% Bracketing Methods - Bisection Method 
% (Binary Chopping - Bolzano's Method)
% The Bisection Method is an iterative application of IVT to numerically 
% determine roots of continuous functions. 
figure('Name','Bisection Method')
[rootValBisection,errorValBisection,iterNumbBisection,elapsedTimeBisection] = ...
    bisection(func,xl,xu,terminationCriteria,maxIterations);

%% Bracketing Methods - False-Position Method
% The False-Position Method is a modificiation of Bisection Method that is 
% needed due to Brute-Force approach and poor convergence of Bisection Method. 
figure('Name','False-Position Method')
[rootValFP,errorValFP,iterNumbFP,elapsedTimeFP] = ...
    falsePos(func,xl,xu,terminationCriteria,maxIterations);

%% Open Methods - Newton-Raphson Method
% The Newton-Raphson method is a widely used root-finding algorithm. Method
% successively and numerically obtains better results and approximations for the roots.
% It is based on the idea of linear approximation and named after Isaac Newton and Joseph Raphson. 
% For the derivative of the input function, 
% It might be useful to use diff + matlabFunction + sym instead.
figure('Name','Newton-Raphson Method')
[rootValNR,errorValNR,iterNumbNR,elapsedTimeNR] = ...
    newtonraphson(func,dFunc,xl,terminationCriteria,maxIterations);
