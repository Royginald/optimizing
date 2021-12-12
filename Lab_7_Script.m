%Lab_7_Script.m                          Created by: Roy McIntosh 3620125
%                                        Created on: March.18/2020
%                                     Last Modified: March.19/2020
%
%LAB_7_SCRIPT: Script for the 7th lab of the course ME 2352 Design
%              Optomiztion exploring the function linprog.m
%
%Modification History: See end of file

%% Part 1 e)
%Declaring variables
f = [-1 -1 0 0];
A = [1 1 0 0;10 10 -1 -1];
b = [400;2000];
LB = [0 0 0 0];
UB = [inf 200 inf 800];

%Solving using linprog
[X,fval] = linprog(f,A,b,[],[],LB,UB);

disp(X);

disp('-----Part 1:');
disp(strcat(['Load 1: ' num2str(X(1)) ' kg, at a distance of: ' num2str(X(3)/X(1)) ' m' ]));
disp(strcat(['Load 2: ' num2str(X(2)) ' kg, at a distance of: ' num2str(X(4)/X(2)) ' m' ]));
disp(strcat(['Total load: ' num2str(-1*fval)]));

%% Part 2 e)
%Declaring Variables
f = [6 10 18 24 30];
Aeq = [0.1 0.15 0.2 0.3 0.4; 1 1 1 1 1];
beq = [250; 1000];
LB = [0 0 0 0 0];
UB = [300 400 200 700 450];

%Solving using linprog
[X,fval] = linprog(f,[],[],Aeq,beq,LB,UB);

disp('-----Part 2:');
disp(strcat(['Kilograms of Type 1 alloy: ' num2str(X(1))]));
disp(strcat(['Kilograms of Type 2 alloy: ' num2str(X(2))]));
disp(strcat(['Kilograms of Type 3 alloy: ' num2str(X(3))]));
disp(strcat(['Kilograms of Type 4 alloy: ' num2str(X(4))]));
disp(strcat(['Kilograms of Type 5 alloy: ' num2str(X(5))]));
disp(strcat(['Total cost: $' num2str(fval)]));

%% Modification History:
%--March.19/2020: Added comments

