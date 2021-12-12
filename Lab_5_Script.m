%Lab_5_Script.m                          Created by: Roy McIntosh 3620125
%                                        Created on: Febuary.26/2020
%                                     Last Modified: March.06/2020
%
%LAB_5_SCRIPT: Script for the 5th lab of the course ME 2352 Design
%              Optomiztion looking at the Steepest decent method
%
%Modification History: See end of file.
%%
func = @(x) (x(1)+8*(x(2))-3)^2 + (2*x(1)+5*x(2)-15)^2;

startPoint = [0 0];

[xStarG,fStarG,countG] = SteepestDecent(func,startPoint,0.2,0.0001,0.0001,0.0001,500,1);

[xStarB,fStarB,countB] = SteepestDecent(func,startPoint,0.2,0.0001,0.0001,0.0001,500,0);


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

%%
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

%% Modification History: 
%--March.06: Did some rearanding and added some comments
