%Gradiant_Function.m                     Created by: Roy McIntosh 3620125
%                                        Created on: January.26/2020
%                                     Last Modified: Febuary.26/2020
%
%GRADIANT_FUNCTION: Function to evaluate the gradiant of a function at a
%point using the finite difrence method. Inputs are the function as a 
%string, the point as a vector, the value of the increment
%
%Modification History: See end of file.

%%
function [gradiant] = Gradiant_Function(functionString,pointVector, ...
    incrementScalar)

%declaring varibles
num = length(pointVector);
gradiant = zeros(num,1);

%for each variable evaluate the function around the point use those values
%to find the slope, leaving the value of the point unchanged
for c = 1:num
    
    pointVector(c) = pointVector(c) + incrementScalar;
    slope1 = functionString(pointVector);
    
    pointVector(c) = pointVector(c) - 2*incrementScalar;
    slope2 = functionString(pointVector);
    
    gradiant(c) = (slope1 - slope2)/(2*incrementScalar);
    
    pointVector(c) = pointVector(c) + incrementScalar;
end
end

%% Modification Histroy:
%--January. 29/2020: changed the file to work with any number of varibles
%--January. 30/2020: added comments
%--Febuary. 26/2020: Modifided so user passes an anonymous funation istead
%                    of this function making an anonymous function
