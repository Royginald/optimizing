%Bracket3P.m                             Created by: Roy McIntosh 3620125
%                                        Created on: Febuary.05/2020
%                                     Last Modified: March.08/2020
%
%BRACKET3P: Function to acuaire a 3 point bracket of a function. 
%Inputs:
%    FunctionNamme - name of the function to find a bracket for   (String)
%    StartPoint - point were thefunction will start to look       (Integer)
%    Step - initial step size to be used                          (Integer)
%
%Modification History: See end of file

%% Function
function [FirstBracket,MiddleBracket,FinalBracket] = Bracket3P(FunctionName,StartPoint,Step,MaxIter)

%% Declare Variables
if ~exist('MaxIter','var')
    MaxIter = 1000;
end

phi = (sqrt(5)+1)/2;
cont = true;

SPt = StartPoint;

FSt = FunctionName(SPt);
MPt = SPt + Step;
FMd = FunctionName(MPt);

counter = 0;
    
%Check to see if minimum is in the right direction
if FMd > FSt
    Step = -1 * Step;
    SPt = MPt;
    MPt = SPt + Step;
end
    
%% Loop to search function
while cont    
    %finds a new point from the step size
    Step = Step*phi;
    EPt = MPt + Step;
    
    
    %checks to see if the function has a higher value at the new point then
    %the prevois point
    FMd = FunctionName(MPt);
    FEd = FunctionName(EPt);
    
    if FEd > FMd
        cont = false;
    else
        SPt = MPt;
        MPt = EPt;
    end
    if counter > MaxIter
        FirstBracket = NaN;
        MiddleBracket = NaN;
        FinalBracket = NaN;
        return;
    else
        counter = counter + 1;
    end
end

%Once stopped uses last values to determine the bracket
FirstBracket = SPt;
MiddleBracket = MPt;
FinalBracket = EPt;

end

%% Modification History:
%--Febuary.14/2020: Added comments
%--March.06/2020: Added a max iteration counter
%--March.08/2020: Corrcted starting direction for when the start point is
%                 within one bracket of the optimum
