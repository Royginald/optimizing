%Hessian_Function.m                     Created by: Roy McIntosh 3620125
%                                        Created on: January.27/2020
%                                     Last Modified: Febuary.26/2020
%
%HESSIAN_FUNCTION: function to calculate the hessian matrix of a function
%using the finite diffrence method. Inputs are function as a string, the
%point were you want to find the hessian, the increment you want to use.
%
%NOTE: recuires the file Gradiant_Function.m to work.
%
%Modification history: see end of file.

%%
function [hessian] = Hessian_Function(functionString,pointVector, ...
    incrementScalar)

%declaring varibles
num = length(pointVector);
hessian = zeros(num);

%for each variable finds the gradaint at 2 points and makes the
%corrisponding row of the hessian the gradiant values, while keeping the
%value of the point the same
for c = 1:num
    pointVector(c) = pointVector(c)+incrementScalar/2;
    slope1 = Gradiant_Function(functionString, pointVector, incrementScalar);
    
    pointVector(c) = pointVector(c)-incrementScalar;
    slope2 = Gradiant_Function(functionString, pointVector, incrementScalar);
    
    hessian(c,:) = (slope1 - slope2)/incrementScalar;
    
    pointVector(c) = pointVector(c) + incrementScalar/2;
end
end

%% Modification History:
%--January. 30/2020: cleaned up the code and made it work for any number of
%                    variables
%--Febuary. 26/2020: Modifided so user passes an anonymous funation istead
%                    of this function making an anonymous function
