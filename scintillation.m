clc
clear all
% P = %atmospheric pressure in mb
% T= %effective temp. in Kelvin
% lambda= %%wavelength in microns
% n= 1+77.6(1+7.52x10^-3*(lambda^-2))*(P/T)*10^-6;

% PDF of log normal irradiance fluctuation
Io=1; %intensity in free space, as there is no energy loss E(I))=Io;
I=0:0.005:3; %Intensity in turbulent medium
Var_l=[0.1,0.2,0.5,0.8]; % Log irradiance variance

for i=1:length(Var_l)
    for j= 1: length(I)
            B= sqrt(2*pi*Var_l(i))
            C(j)=log(I(j)/Io)+Var_l(i)/2;
            D=2*Var_l(i);
            pdf(i,j)=(1/I(j))*(1/B)*exp(-(C(j))^2/D);
    end
end

plot((I./Io),pdf)