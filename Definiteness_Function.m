%Definiteness_Function.m                 Created by: Roy McIntosh 3620125
%                                        Created on: January.27/2020
%                                     Last Modified: Febuary.02/2020
%
%DEFINITENESS_FUNCTION: Function to find the definiteness of an inputed 
%matrix using either Sylvester's method (option = 1) or the eigenvalue 
%method (option = 2)
%
%Modification History: See end of file

%%
function [def] = Definiteness_Function(Matrix,option)

[r,c] = size(Matrix);
if r ~= c
    disp("Invalid Matrix: must be a square matrix");
    return;
end

%defining varibles
lg = length(Matrix);
def = [];
detVec = zeros(lg,1);

%sets default option to 1 (Sylvester's method)
if (option ~= 1) && (option ~= 2)
    option = 1;
end

if option == 1  % (Sylvester's Method)
    %makes a vector with the determintes of the leading pricipal minors
    for c = 1:lg
        detVec(c) = det(Matrix(1:c,1:c));
    end
    
    %determiness the definatness from the signs of the determintes
    if detVec >= 0
        def = "Positive semi-Definite";
    elseif detVec > 0 
        def = "Positive Definite";
    else
        for i = 1:lg
            detVec(i) = detVec(i)*(-1)^i;
        end
        if detVec > 0
            def = "Negitive Definate";
        else
            def =  "Indefinite";
        end
    end
    
    
elseif option == 2  % (EigenValue Method)
    %checks to see if any values of the matrix are NaN or infinity
    for i = 1:lg
        for j = 1:lg
            if isnan(Matrix(i,j)) || isinf(Matrix(i,j))
                def = "Indefinite";
            end
        end
    end
    if isempty(def)
        %finds the eigenvalues of the matrix
        detVec = eig(Matrix);
    
        %determines the definainess from the eigenvalues
        if detVec >= 0 
            def = "Positive semi-Definite";
        elseif detVec > 0
            def = "Positive Definite";
        elseif detVec <= 0
            def = "Negative semi-Defintite";
        elseif detVec < 0
            def = "Negative Defintite";
        else
            def = "Indefinite";
        end
    end
end
end

%% Modification History:
%--January.29/2020: added the option to use eigen values and cleand up the
%syvesters method code
%--Febuary.02/2020: accounted for infinty and NaN values in the eigen value
%section, added comments




