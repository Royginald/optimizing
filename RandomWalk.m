%RandomWalk.m                            Created by: Roy McIntosh 3620125
%                                        Created on: Febuary.25/2020
%                                     Last Modified: Febuary.25/2020
%
%RANDOMWALK: function to find the minimum of a multi dimetional function
%            using the random walk algorithum
%
%Inputs:
%    functionName - name of the function to be minimized          (String)
%    StartPoint - point were the function will start to look      (Double Vector)
%    Step - initial step size to be used                          (Double)
%    finEpsilon - minimum value between varible values before the function
%        decides that the minimum is found                        (Double)
%    finCount - maximum number of iterations performed            (Integer)
%
%Note: requires Bracket3P.m and GoldenSection.m functions
%
%Modification History: See end of file.

function [xstar,fStar] = RandomWalk(functionName,StartPoint,step,finEpsilon,finCount)

CheckPoint = functionName(StartPoint);

for c = 1:fincount
    d = rand(length(StartPoint),1);

    fmin = @(a)functionName(StartPoint + a*d);

    xStar = GoldenSection(fmin,0,step,finEpsilon,finCount);

    if (abs(xStar - CheckPoint) < finEpsilon)
	fStar = functioName(xStar);
	return;
    end

    CheckPoint = xStar;
end

xStar = NaN;
fStar = Nan;

end

%Modification History:
