%GoldenSection.m                          Created by: Roy McIntosh 3620125
%                                        Created on: Febuary.06/2020
%                                     Last Modified: Febuary.14/2020
%
%GOLDENSECTION: function to find the minimum of a one varible function 
%using the Golden Section algorithum.
%Inputs:
%    functionName - name of the function to be minimized          (String)
%    StartPoint - point were thefunction will start to look       (Double)
%    Step - initial step size to be used                          (Double)
%    finEpsilon - minimum value between varible values before the function
%        decides that the minimum is found                        (Double)
%    finCount - maximum number of iterations performed            (Integer)
%
%Note: requires the Bracket3P.m function
%
%Modification History: See end of file.

%% Function
function [xStar,fStar,counter] = GoldenSection(functionName,StartPoint,step, ...
    finEpsilon,finCount)

%Declaring variables
points = zeros(4,1);
[points(1),points(2),points(3)] = Bracket3P(functionName,StartPoint,step);
phi = (sqrt(5)+1)/2;
counter = 0;

%loop to perform algorithum as long as the max iteration isn't exceded
while counter < finCount
    %find a new point and put it is the right place of the bracket
    points(4) = points(3);
    points(3) = points(1)+(points(4) - points(1)) / phi;
    
    %decides what the new bracket should be based on the values of the
    %function at the middle bracket points
    if(functionName(points(2))<functionName(points(3)))
        temp = points(3);
        points(3) = points(1);
        points(1) = temp;
    else
        points(1) = points(2);
        points(2) = points(3);
        points(3) = points(4);
    end
    
    %stops if the 2 middle points are less then the minimum value
    if abs(points(3) - points(2)) < finEpsilon
        xStar = points(3);
        fStar = functionName(xStar);
        return;
    end
    counter = counter + 1;
end
%if the max iterations was exceded retruns a NaN value
if counter == finCount
    xStar = NaN;
    fStar = NaN;
end
end

%% Modification History:
%--Febuary.14/2020: Added comments

