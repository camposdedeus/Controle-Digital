%% Fun��o em malha aberta
num = [100];
den = [10 120 1000];
T = 0.01;  
s = tf('s');
Gp = tf(num, den)
%Gp = Gp*(1/10)*(1-exp(-T*s)/s)
Gz = c2d(Gp, T, 'zoh')

z = tf('z');
%% Fun��o em malha fechada - sem atraso
Dz = 20;
Gz_Dz = series(Gz, Dz);
Gzmf = feedback(Gz_Dz, 1)

step(Gzmf)
%title('Fun��o em malha fechada - sem atraso')

%% Calculando erro entrada degrau
parametros_iniciais = stepinfo(Gzmf)

