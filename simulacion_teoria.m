%Definir Variables
h = 0.01;                % Tamaño del paso de la cuadrícula.
max = 10;                % Límite superior para calcular los primeros cinco términos de la serie.
V = 0;

% a = Largo del rectángulo
% b = Ancho del rectángulo
% x = Coordenada en eje x del punto de interés
% y = Coordenada en eje y del punto de interés
% Vo = Voltaje en uno de los lados del réctangulo
% Definir el arreglo de los escenarios - [x, y, a, b, vo]
escenarios = [
0.25, 0.25, 1, 4, 100;
0.25, 0.50, 1, 4, 100;
0.25, 0.75, 1, 4, 100;
0.50, 0.25, 1, 4, 100;
0.50, 0.50, 1, 4, 100;
0.50, 0.75, 1, 4, 100;
0.75, 0.25, 1, 4, 100;
0.75, 0.50, 1, 4, 100;
0.75, 0.75, 1, 4, 100;
];
% Loop for para obtener los términos de la serie
for f = 1:9 % El bucle se hace la primera fila hasta la última (en este caso de 1 a 9). La columna se define a la derecha
x = escenarios(f, 1);
y = escenarios(f, 2);
a = escenarios(f, 3);
b = escenarios(f, 4);
vo = escenarios(f, 5);
c = 4 * vo / pi;           % Constante utilizada en la suma de la serie de Fourier
temp = 0;
% Calcular el potencial en el punto (x, y)
for n = 1:2:max
valor1 = sin(n * pi * x / b);
valor2 = sinh(n * pi * y / b);
valor3 = n * sinh(n * pi * a / b);
temp = temp + (valor1 * valor2) / valor3;
end
V = temp*c;
% Imprimir el valor del potencial en la terminal
fprintf('El potencial en el punto (x = %.2f, y = %.2f) es V = %.2f V\n ', x, y, V);
end
% Hacer la cuadrícula en base al ancho y alto del rectángulo en base al problema, además del step utilizado que es 0.01 para que se vea bien
[x, y] = meshgrid(0:h:a, 0:h:b);

temp = 0;
%Graficar todos los puntos en la gráfica
for n = 1:2:max
valor1 = sin(n * pi * x / b);
valor2 = sinh(n * pi * y / b);
valor3 = n * sinh(n * pi * a / b);
temp = temp + valor1 .* valor2 ./ valor3; %Para mostrarse en la gráfica hay que realizar un producto punto para dejarlo con coordenadas
V = temp * c;
end

% Generar la gráfica
surf(x, y, V, 'EdgeColor', 'none');
