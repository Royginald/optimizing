%SteepestDecent.m                        Created by: Roy McIntosh 3620125
%                                        Created on: Febuary.25/2020
%                                     Last Modified: Febuary.26/2020
%
%STEEPESTDECENT: function to find the minimum of a multi dimetional function
%            using the Steepest Decent method
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
%Modification History: See end of file.

%%
function [xStar,fStar,counter] = SteepestDecent(functionName,StartPoint,step, ... 
    alphaEps,functionEps,gradiantEps,finCount,option)

%default option is Brent's Algorithm
if ~exist('option','var')
    option = 0;
end

%Declaring Variables
NewPoint = zeros(length(StartPoint),1);
counter = 0;
check = false;

while counter <= finCount
    %Setting the diection and the 1 variable function in that direction 
    dir = -1*Gradiant_Function(functionName,StartPoint,0.00001);
    fmin = @(a)functionName(StartPoint + a*dir);

    %optomizing alpha
    if option == 0
        aStar = BrentAlg(fmin,0,step,0.00001,finCount);
    else
        aStar = GoldenSection(fmin,0,step,0.00001,finCount);
    end
    
    %setting the new point that might be the minimum
    for c = 1:length(StartPoint)
        NewPoint(c) = StartPoint(c) + aStar*dir(c);
    end

    %checking termination critiria
    if ((abs(functionName(NewPoint) - functionName(StartPoint)) < ...
            functionEps) || aStar < alphaEps || all(dir < gradiantEps)) && check
	    fStar = functionName(NewPoint);
        xStar = NewPoint;
        return;
    elseif ((abs(functionName(NewPoint) - functionName(StartPoint)) < ...
            functionEps) || abs(aStar) < alphaEps || all(abs(dir) < gradiantEps))
        check = true;
    end

    %iterating some vaiables
    StartPoint = NewPoint;
    counter = counter + 1;
end

%assign NaN values if the max iteration number is exceded
xStar = NaN;
fStar = NaN;

end

%% Modification History:
%--Febuary.26/2020: Added the option to use Brent's Algorithum or Golden
%                   Section. Added more stoppong critiria.
