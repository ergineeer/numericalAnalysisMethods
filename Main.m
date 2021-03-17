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
% Bisection Method is an iterative application of IVT to numerically 
% determine roots of a continuous functions. 
figure('Name','Bisection Method')
[rootValBisection,errorValBisection,iterNumbBisection,elapsedTimeBisection] = ...
    bisection(func,xl,xu,terminationCriteria,maxIterations);

%% Bracketing Methods - False-Position Method
% The False-Position Method is a modificiation of Bisection Method that is 
% needed due to Brute-Force approach and poor convergence of Bisection Method. 
figure('Name','False-Position Method')
[rootValFP,errorValFP,iterNumbFP,elapsedTimeFP] = ...
    falsePos(func,xl,xu,terminationCriteria,maxIterations);
