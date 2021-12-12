%Lab_3_Script.m                          Created by: Roy McIntosh 3620125
%                                        Created on: Febuary.05/2020
%                                     Last Modified: Febuary.21/2020
%
%LAB_3_SCRIIPT: Made for the 3th lab of the course ME2352. This lab explores 3 point
%bracketing and using the golden section algorithum to find the minimum of
%single variable functions.
%
%Note: requires Bracket3P.m and GoldenSection.m function
%
%Modification History: See end of file.


%% Part 2
disp('Part 2');
disp('------------------------------------------------------------------');

objFunc = @(D)400*(pi*D^2/2+1000/D);

[xStar,fstar,count] = GoldenSection(objFunc,2,1,0.0001,1000);
disp('X Star:');
disp(xStar);
disp('f Star:');
disp(fstar);
disp('Number of Iterations:');
disp(count);

%% Part 4 b
disp('Part 4');
disp('------------------------------------------------------------------');

F = @(x)(3*x(1)^4-8*x(1)^2+2*x(2)^2+4*x(1)*x(2)-5);

minf = @(x)(F([x 1]));

[xStar,fstar,count] = GoldenSection(minf,-2,0.01,0.0001,100);

disp('X Star:');
disp(xStar);
disp('f Star:');
disp(fstar);
disp('Number of Iterations:');
disp(count);


%% Modification History
%Febuary.14/2020: Started code for part 4
%Febuary.21/2020: Started code for part 2
    
