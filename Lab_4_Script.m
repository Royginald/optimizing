%Lab_4_Script.m                          Created by: Roy McIntosh 3620125
%                                        Created on: Febuary.23/2020
%                                     Last Modified: Febuary.23/2020
%
%LAB_4_SCRIIPT: Made for the 4th lab of the course ME2352. This lab 
%explores the Golden Section Algorithum ands Breant's algorithum for
%minimizing functions.
%
%Note: requires Bracket3P.m, GoldenSection.m and BreantAlg.m functions
%
%Modification History: See end of file.

%% Part 3
fOb = @(D)400*(pi*D^2/2+1000/D);

[GoldenXStar,GoldenfStar,GoldenCount] = GoldenSection(fOb,2,1,0.001,100);

[BrentXStar,BrentfStar,BrentCount] = BreantAlg(fOb,2,1,0.001,100);

disp('------------------------------------------------------------------');
disp('Golden Section Algorithum');
disp('------------------------------------------------------------------');
disp('X Star:');
disp(GoldenXStar);
disp('Function Star:');
disp(GoldenfStar);
disp('Iterations:');
disp(GoldenCount);

disp('------------------------------------------------------------------');
disp("Brent's Algorithum");
disp('------------------------------------------------------------------');
disp('X Star:');
disp(BrentXStar);
disp('Function Star:');
disp(BrentfStar);
disp('Iterations:');
disp(BrentCount);


%% Modification History: 
