%Lab_2_Script.m                          Created by: Roy McIntosh 3620125
%                                        Created on: January.26/2020
%                                     Last Modified: Febuary.02/2020
%
%LAB_2_SCRIPT: Script for the second lab of the class ME2352 Design
%Optimization. Plots the gradiant versus the increment value of 2x^2+1/x^2.
%Finds the gradiant and hessian of several functions at several points.
%
%NOTE: Requires Gradint_Function.m, Hessian_Function.m and
%Definitness_Function.m to work
%
%Modification History: see end of file

clear;
%% Part 2
%declaring varibles
deltaX = 10^-12:(1-10^-12)/10000:1;
G1 = zeros(length(deltaX),1);
G2 = G1;

%finding the gradiant for varying increments at 2 diffrent points
for i = 1:length(deltaX)
    G1(i) = Gradiant_Function("2*x^2+1/x^2",0.01,deltaX(i),"x");
    G2(i) = Gradiant_Function("2*x^2+1/x^2",2,deltaX(i),"x");
end

%plotting the log of the increment verses the gradiant value
hold on;

subplot(1,2,1),plot(log10(deltaX),G1);
grid on;
ylabel('Gradiant at x = 0.01');
xlabel('log of the Increment');

subplot(1,2,2),plot(log10(deltaX),G2);
grid on;
ylabel('Gradiant at x = 2');
xlabel('log of the Increment');

hold off;

%% Part 3

% declaring the functions, variable names and the points
Functions = ["(x1^3-6*x1^2*x2+x1*x2^2+2*x1^2-x1*x2+5*x1)/x1" ...
    "x1*(6*x1-2*x2+2)+x2*(4*x2-1)+5" "2*x1+x2/x1" ...
    "6*x1^2-2*x1*x2+4*x2^2-2*x3^2+x1*x3+2*x1-x2+5*x3+5"];

VariableNames2D = ["x1" "x2"];
VariableNames3D = ["x1" "x2" "x3"];

points2D = [0 0; 1 0.5; -10 -10];

points3D = [0 0 0; 1 0.5 10; -10 -10 -10];

%evaluate the gradiant and hessian at all points for the 2D functions and
%display them to the user
for f = 1:3
    disp("---------------------------------------------");
    disp(strcat("    Function",num2str(f),": "));
    for p = 1:3
        disp("---------------------------------------------");
        disp(strcat("At point: ",num2str(points2D(p,:))));
        disp("Gradiant: ");
        disp(Gradiant_Function(Functions(f),points2D(p,:),0.001, ...
            VariableNames2D));
        hessian = Hessian_Function(Functions(f),points2D(p,:),0.001, ...
            VariableNames2D);
        disp("Hessian: ");
        disp(hessian);
        disp(strcat("Defiantness: ", Definiteness_Function(hessian,1)));
    end
end
        
%evaluate the gradiant and hessian at all points for the 3D functions and
%display them to the user
disp("---------------------------------------------");
disp("    Function4: ")
for p = 1:3
    disp("---------------------------------------------");
    disp(strcat("At point: ", num2str(points3D(p,:))));
    disp("Gradiant: ");
    disp(Gradiant_Function(Functions(4),points3D(p,:),0.001, ...
        VariableNames3D));
    hessian = Hessian_Function(Functions(4),points3D(p,:),0.001, ...
        VariableNames3D);
    disp("Hessian: ")
    disp(hessian);
    disp(strcat("Defiantness: ", Definiteness_Function(hessian,1)));
end
 
%% Part 4
%display analysis for part 4
disp(" ");
disp("Part 4:");
disp("Function1:");
disp("At (0 0)    : Neither convex or concave");
disp("At (1 0.5)  : Neither convex or concave");
disp("At (-10 -10): Neither convex or concave");
disp(" ");
disp("Function2:");
disp("At (0 0)    : Convex and flat");
disp("At (1 0.5)  : Convex and flat");
disp("At (-10 -10): Convex and flat");
disp(" ");
disp("Function3:");
disp("At (0 0)    : Neither convex or concave");
disp("At (1 0.5)  : Neither convex or concave");
disp("At (-10 -10): Neither convex or concave");
disp(" ");
disp("Function4:");
disp("At (0 0 0)      : Neither convex or concave");
disp("At (1 0.5 10)   : Neither convex or concave");
disp("At (-10 -10 -10): Neither convex or concave");

%% Modification History:
%--Febuary.02/2020: Removed test code, added comments
        
        
        
