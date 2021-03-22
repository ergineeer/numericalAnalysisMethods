# numericalAnalysisMethods
Functions for numerical analysis methods.

Provided function is plotted in the interval of [-14:5] for illustration. 

Root-Finding Algorithms
- Bracketing Methods
  - Bisection Method  
    Also known as Binary Chopping and Bolzano's Method, the Bisection Method is an iterative application of IVT to numerically determine roots of continuous functions. 
  - False-Position Method  
    The False-Position Method is a modificiation of Bisection Method that is needed due to Brute-Force approach and poor convergence of Bisection Method.
- Open Methods
  - Newton-Raphson Method  
    The Newton-Raphson method is a widely used root-finding algorithm. Method successively and numerically obtains better results and approximations for the roots. It is based on the idea of linear approximation and named after Isaac Newton and Joseph Raphson. For the derivative of the input function, it might be useful to use diff + matlabFunction + sym instead.  
  - Secant Method  
    Secant Method does not require evaluation for the derivation, instead it uses a finite difference to approximate the derivative. The Method divides each interval by the secant line connecting to the endpoints.   
  - Brent's Method  
    Brent's Method is also known as Van Wijngaarden-Dekker-Brent Method. It is a hybrid approach combining the Bisection Method and inverse quadratic interpolation; therefore, having reliability of bracketing methods and fast computing of open methods. Brent's Method was developed by Richard Brent (1973).  
