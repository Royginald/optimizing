%Lab_1_Script.m                          Created by: Roy McIntosh 3620125
%                                        Created on: January.17/2020
%                                     Last Modified: January.17/2020
%
%LAB_1_SCRIPT: script that is for Lab 1 of ME2352. Lab 1 gave a problem
%that could be solved using linear programing and this program solves the
%given problem.
%
%NOTE: requires the plotLP_Function function to run properly

%%
%Objecive Function
fob = [0.15*24; 0.15*20.5];

%Equality Constraints
eqConstM = [1 1];
eqConstV = 240;

%Greater then or Equal to Constraints
geConstM = [];
geConstV = [];

%Less then or Equal to Constraints
leConstM = [];
leConstV = [];

%Bounds
lowerB = [0;0];
upperB = [200;200];

%running function to plot the problem
output = plotLP_Function(fob,eqConstM,eqConstV,geConstM,geConstV,leConstM, ...
    leConstV,lowerB,upperB);

