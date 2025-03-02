close all ; clear all; clc;

rng (4) ;
a = -2; b = 4; myRho = 1.5; myBeta = 4; myGamma = 1.8; N = 3; nPunti = 10* N ;
x = rand ( nPunti ,1) * (b - a) + a ;
myDelta = (2* rand ( nPunti ,1) - 1) * myRho / 4;
fun = @ ( x ) ( myRho * sin ( myBeta * x + myGamma ) + myDelta ) ;
A = x .^([4: -1:0]) ; y = fun ( x ) ;
fprintf ("\ nSoluzione sistema delle equazioni normali :") ;
sol1 = (A' * A ) \( A' * y )
fprintf ("\ nSoluzione mediante mldivide :") ;
sol2 = A \ y
fprintf ("\n\n") ;
xx = linspace (a ,b ,1001) ; ff = polyval ( sol2 , xx ) ;
ph = plot (x ,y ,'ro', xx , ff ,'-b') ;