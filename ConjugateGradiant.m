%ConjugateGradiant.m                    Created by: Roy McIntosh 3620125
%                                        Created on: March.06/2020
%                                     Last Modified: March.14/2020
%
%CONJUGATEGRADINT: function to find the minimum of a multi dimetional function
%            using the Conjugate Gradiant method
%
%Inputs:
%    functionName - name of the function to be minimized          (String)
%    StartPoint - point were the function will start to look      (Double Vector)
%    Step - initial step size to be used                          (Double)
%    alphaEps - minimum value between step sizes values before the function
%        decides that the minimum is found                        (Double)
%    functionEps - minimum value between function values before the
%        function decides that the minimum is found               (Double)
%    gradiantEps - minimum value between gradiant values before the 
%        function decides that the minimum is found               (Double)
%    finCount - maximum number of iterations performed            (Integer)
%    option - uses Brent's Algorithum if option = 0 and Golden
%    Section if option = 1                                        (Integer)
%
%Note: requires Gradiant_Function.m, Bracket3P.m and GoldenSection.m functions
%
%Adapted from Roy Mcintosh's SteepestDecent.m function
%
%Modification History: See end of file.

%% Function
function [xStar,fStar,counter] = ConjugateGradiant(functionName,StartPoint,step, ... 
    alphaEps,functionEps,gradiantEps,finCount,option)

%Uses Brent's Algorithm by default
if ~exist('option','var')
    option = 0;
end

%Declaring Varables
NewPoint = zeros(length(StartPoint),1);
counter = 0;
check = false;

%loops as long as the max iteration number isn't exceded
while counter <= finCount
    %sets the direction to the negitive norm of the gradiant the first time
    if counter == 0
        OGrad = Gradiant_Function(functionName,StartPoint,0.00001);
        dir = -1*OGrad;
        dir = dir/norm(dir);
    %Uses conjugate Gradiant formula to find the direction
    else
        NGrad = Gradiant_Function(functionName,StartPoint,0.00001);
        NGrad = NGrad/norm(NGrad);
        B = norm(NGrad)/norm(OGrad);
        dir = -1*NGrad + B*dir;
        dir = dir/norm(dir);
        OGrad = NGrad;
    end
    
    %function of one varable to minimize
    fmin = @(a)functionName(StartPoint + a*dir);
    if option == 0
        aStar = BrentAlg(fmin,0,step,0.0001,finCount);
    else
        aStar = GoldenSection(fmin,0,step,0.0001,finCount);
    end
    
    %Evaluates the new point
    for c = 1:length(StartPoint)
        NewPoint(c) = StartPoint(c) + aStar*dir(c);
    end

    %Checks stopping critiria
    if ((abs(functionName(NewPoint) - functionName(StartPoint)) < ...
            functionEps) || abs(aStar) < alphaEps || all(dir < gradiantEps)) && check
	    fStar = functionName(NewPoint);
        xStar = NewPoint;
        return;
    elseif ((abs(functionName(NewPoint) - functionName(StartPoint)) < ...
            functionEps) || abs(aStar) < alphaEps || all(abs(dir) < gradiantEps))
        check = true;
    else
        check = false;
    end

    %Incramenting variables
    StartPoint = NewPoint;
    counter = counter + 1;
end

%returns NaN values if the max number of iterations was exceeded
xStar = NaN;
fStar = NaN;

end

%% Modification History:
%--March.14/2020: Made the function use the norms of the gradiants to find
%                 the new search direction

