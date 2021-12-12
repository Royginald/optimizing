
% 3D stress element solver

SigmaX = 40;
SigmaY = -20;
SigmaZ = -10;
TaoXY = 5;
TaoYZ = -1.5;
TaoZX = 2.5;

ScaleExponate = 3;

sigma = [SigmaX TaoXY TaoZX; TaoXY SigmaY TaoYZ; TaoZX TaoYZ SigmaZ] .* 10^ScaleExponate;

x = -10*10^(ScaleExponate+2): 10^(ScaleExponate+1) : 10*10^(ScaleExponate+2);

y = zeros(length(x));

for i = 1:length(x)
    temp = sigma;
    temp(1,1) = temp(1,1) - x(i);
    temp(1,1) = temp(1,1) - x(i);
    temp(1,1) = temp(1,1) - x(i);
    
    y(i) = det(temp);
end


plot(x,y);

disp(det(sigma));