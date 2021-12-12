%BreantAlg.m                             Created by: Roy McIntosh 3620125
%                                        Created on: Febuary.07/2020
%                                     Last Modified: Febuary.14/2020
%
%BREANTALG: function to find the minimum of a one varible function 
%using the Breant's method of quadratic fit.
%Inputs:
%    functionName - name of the function to be minimized          (String)
%    StartPoint - point were thefunction will start to look       (Integer)
%    Step - initial step size to be used                          (Integer)
%    finEpsilon - minimum value between varible values before the function
%        decides that the minimum is found                        (Integer)
%    finCount - maximum number of iterations performed            (Integer)
%
%Adapted from Roy McIntosh's GoldenSection.m function
%
%Note: requires the Bracket3P.m function
%
%Modification History: See end of file.

%% Function
function [xStar,fStar,counter] = BrentAlg(functionName,StartPoint,step,finEpsilon,finCount)

%declaring variables
points = zeros(4,1);
[points(1),points(2),points(3)] = Bracket3P(functionName,StartPoint,step);
counter = 0;

%loop to perform algorithum as long as the max iteration isn't exceded
while counter < finCount
    %finds a set of 4 points, 3 are the prevois 3 point bracket and the new
    %point (point(3)) is found using Breats method
    points(4) = points(3);
    
    Matrix = [points(1)^2 points(1) 1;points(2)^2 points(2) 1;points(4)^2 ...
        points(4) 1];
    
    funcVal = [functionName(points(1)); functionName(points(2)); ...
        functionName(points(4))];
    
    quadCo = Matrix\funcVal;
    
    points(3) = -quadCo(2)/(2*quadCo(1));
    
    %checks the function values at points 2 and 3 to determine the new 3
    %point bracket
    if(functionName(points(2))>functionName(points(3)))
        points(1) = points(2);
        points(2) = points(3);
        points(3) = points(4);
    end
    
    %checks stopping critira for the closness of the values of the points
    if abs(points(3)-points(2)) < 2*finEpsilon || abs(points(1)-points(2)) < 2*finEpsilon
        xStar = points(2);
        fStar = functionName(xStar);
        return;
    end
    counter = counter + 1;
end

%if the max number of iterations was exceded returns a NaN value
if counter > finCount
    xStar = NaN;
    fStar = NaN;
end
end

%% Modification History:
%--Febuary.14/2020: Fixed matrix multiplication to give correct values, and
%added comments

