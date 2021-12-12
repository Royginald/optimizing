%GeneticOptim.m                          Created by: Roy McIntosh
%                                        Created on: Febuary.22/2020
%                                     Last Modified: Febuary.22/2020

function [xstar,fstar,count] = GeneticOptim(functionName,Start,End,endCon,MaxIter)

phi = (5^0.5+1)/2;

for i = 1:MaxIter
    step = (End-Start)/1000;

    points = randi(1000,1,15);
    
    points = Start+points*step;
    fval = zeros(1,15);
    first = zeros(1,5);
    second = zeros(1,5);
    third = zeros(1,5);
    
    for c = 1:15
        fval(c) = functionName(points(c));
    end
    
    fvalsort = sort(fval);
    
    for c = 1:5
        first(i) = min(points(fval == fvalsort(i)));
    end
    for c = 1:5
        second(i) = min(points(fval == fvalsort(i+5)));
    end
    for c = 1:5
        third(i) = min(points(fval == fvalsort(i+8)));
    end

    avg = mean(mean(first)+second(randi(5,1))+second(randi(5,1)) ... 
        +second(randi(5,1))+third(randi(5,1)));

    Start = avg/phi;
    End = avg*phi;
    
    if abs(End - Start) < endCon
        xstar = avg;
        fstar = functionName(xstar);
        count = i;
        return;
    end
end

xstar = avg;
fstar = functionName(xstar);
count = MaxIter;
end

