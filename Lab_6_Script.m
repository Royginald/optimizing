%Lab_6_Script.m                          Created by: Roy McIntosh 3620125
%                                        Created on: March.06/2020
%                                     Last Modified: March.06/2020
%
%LAB_6_SCRIPT: Script for the 6th lab of the course ME 2352 Design
%              Optomiztion looking at the Conjugate Gradiant method
%
%Adapted from Roy Mcintosh's Lab_5_Script.m script

%% Function 1 Seepest Decent
func = @(x) (x(1)+8*(x(2))-3)^2 + (2*x(1)+5*x(2)-15)^2;

startPoint = [0 0];

[xStarG,fStarG,countG] = SteepestDecent(func,startPoint,0.2,0.0001,0.0001,0.0001,500,1);

[xStarB,fStarB,countB] = SteepestDecent(func,startPoint,0.2,0.0001,0.0001,0.0001,500,0);

disp('------------------------------------------------------------------');
disp('Steepest Decent');
disp('------------------------------------------------------------------');
disp('Golden Section Algorithm');
disp('------------------------------------------------------------------');
disp('X Star:');
disp(xStarG);
disp('f Star:');
disp(fStarG);
disp('Iterations:');
disp(countG);
disp(' ');
disp("Brent's Algorithm");
disp('------------------------------------------------------------------');
disp('X Star:');
disp(xStarB);
disp('f Star:');
disp(fStarB);
disp('Iterations:');
disp(countB);

%% Six Hump Camel Seepest Decent
sixHump = @(x)(4-2.1*x(1)^2+x(1)^4/3)*x(1)^2+x(1)*x(2)+(-4+4*x(2)^2)*x(2)^2;

startPoint = [1 -1];

[xStarG,fStarG,countG] = SteepestDecent(sixHump,startPoint,0.02,0.02,0.02,0.02,500,1);

[xStarB,fStarB,countB] = SteepestDecent(sixHump,startPoint,0.02,0.02,0.02,0.02,500,0);

disp(' ');
disp('Six Hump Camel Back Function');
disp('------------------------------------------------------------------');
disp('Golden Section Algorithm');
disp('------------------------------------------------------------------');
disp('X Star:');
disp(xStarG);
disp('f Star:');
disp(fStarG);
disp('Iterations:');
disp(countG);
disp(' ');
disp("Brent's Algorithm");
disp('------------------------------------------------------------------');
disp('X Star:');
disp(xStarB);
disp('f Star:');
disp(fStarB);
disp('Iterations:');
disp(countB);

%% Function 1 Conjugate Gradiant
startPoint = [0 0];

[xStarG,fStarG,countG] = ConjugateGradiant(func,startPoint,0.2,0.0001,0.0001,0.0001,500,1);

[xStarB,fStarB,countB] = ConjugateGradiant(func,startPoint,0.2,0.0001,0.0001,0.0001,500,0);

disp(' ');
disp('------------------------------------------------------------------');
disp('Conjugate Gradiant');
disp('------------------------------------------------------------------');
disp('Golden Section Algorithm');
disp('------------------------------------------------------------------');
disp('X Star:');
disp(xStarG);
disp('f Star:');
disp(fStarG);
disp('Iterations:');
disp(countG);
disp(' ');
disp("Brent's Algorithm");
disp('------------------------------------------------------------------');
disp('X Star:');
disp(xStarB);
disp('f Star:');
disp(fStarB);
disp('Iterations:');
disp(countB);

%% Six Hump Camel Conjugate Gradiant

startPoint = [1 -1];

[xStarG,fStarG,countG] = ConjugateGradiant(sixHump,startPoint,0.02,0.02,0.02,0.02,500,1);

[xStarB,fStarB,countB] = ConjugateGradiant(sixHump,startPoint,0.02,0.02,0.02,0.02,500,0);

disp('Six Hump Camel Back Function');
disp('------------------------------------------------------------------');
disp('Golden Section Algorithm');
disp('------------------------------------------------------------------');
disp('X Star:');
disp(xStarG);
disp('f Star:');
disp(fStarG);
disp('Iterations:');
disp(countG);
disp(' ');
disp("Brent's Algorithm");
disp('------------------------------------------------------------------');
disp('X Star:');
disp(xStarB);
disp('f Star:');
disp(fStarB);
disp('Iterations:');
disp(countB);

