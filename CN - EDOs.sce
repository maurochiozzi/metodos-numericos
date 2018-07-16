// Resolução de Equações Diferenciais Ordinarias
// $$ a = x_0, b = x_f, h = \text{passo} $$

// EDO's
// $$ y' = f(x, y) $$
function y1 = f(x, y)
	//y1 = -2 .* x^3 + 12 .* x^2 - 20 * x + 8.5 
	y1 = y - x .^ 2 + 1
endfunction

// Forma geral dos métodos: $$ y_{i} = y_{i-1} + \phi \cdot h $$
// Onde $$ \phi $$ varia de acordo com o método

// Euler
// $$ \phi = f(x_{i - 1}, y_{i - 1})$$
function [x, y] = euler(a, b, h, y_0, f)
	y(1) = y_0
	x = a:h:b; // Dominio em x
	
	for i = 2 : length(x)
		y(i) = y(i - 1) + f(x(i - 1), y(i - 1)) * h
	end
	
	y = y'
endfunction

// Euler Modificado / Runge - Kutta 2º ordem / Heun
// $$ \phi = \cfrac{1}{2} \cdot k_1 + \cfrac{1}{2} \cdot k_2 $$
// Onde $$ k_1 = f(x_{i - 1}, y_{i - 1})$$ e 
// $$ k_2 = f(x_{i - 1} + h, y_{i - 1} + k_1 \cdot h) $$
function [x, y] = heun(a, b, h, y_0, f)
	y(1) = y_0
	x = a:h:b
	
	for i = 2 : length(x)
		k1 = f(x(i - 1), y(i - 1))
		k2 = f(x(i - 1) + h, y(i - 1) + k1 * h)
		
		y(i) = y(i - 1) + ((k1 + k2) / 2.0 ) * h
	end
	
	y = y'
endfunction

// Runge - Kutta 2ª ordem com Ponto Médio
// $$ \phi = k_2 $$
// $$ k_1 = f(x_{i - 1}, y_{i - 1}) $$
// $$ k_2 = f(x_{i - 1} + \cfrac{1}{2} \cdot h, y_{i - 1} + \cfrac{1}{2} \cdot k_1 \cdot h) $$
function [x, y] = pontoMedio(a, b, h, y_0, f)
	y(1) = y_0
	x = a:h:b;
	
	for i = 2 : length(x)
		k1 = f(x(i - 1), y(i - 1))
		k2 = f(x(i - 1) + 0.5 * h, y(i - 1) + 0.5 * k1 * h)
		
		y(i) = y(i - 1) + k2 * h 
	end
	
	y = y'
endfunction

// Runge - Kutta 3ªordem
// $$ \phi = \cfrac{1}{6} \cdot (k_1 + 4\cdot k_2 + k_3) $$
// $$ k_1 = f(x_{i - 1}, y_{i - 1}) $$
// $$ k_2 = f(x_{i - 1} + \frac{1}{2} \cdot h, y_{i - 1} + \frac{1}{2} \cdot k_ 1 \cdot h) $$
// $$ k_3 = f(x_{i - 1} + h, y_{i - 1}-k_1 \cdot h + 2 \cdot k_2 \cdot h)$$
function [x, y] = rk3(a, b, h, y_0, f)
	y(1) = y_0
	x = a:h:b;
	
	for i = 2:length(x)
		k1 = f(x(i - 1), y(i - 1))
		k2 = f(x(i - 1) + 0.5 * h, y(i - 1) + 0.5 * k1 * h)
		k3 = f(x(i - 1) + h, y(i - 1) - k1 * h + 2 * k2 * h)
		
		y(i) = y(i - 1) + 1/6.0 * (k1 + 4 * k2 + k3) * h
	end
	
	y = y'
endfunction

// Runge - Kutta 4ª ordem
// $ \phi = \cfrac{1}{6} \cdot (k_1 + 2 \cdot k_2 + 2 \cdot k_3 + k_4) $
// $ k_1 = f(x_{i - 1}, y_{i - 1})$
// $ k_2 = f(x_{i - 1} + \cfrac{1}{2} \cdot h, y_{i - 1} + \cfrac{1}{2} \cdot k_1 \cdot h) $
// $ k_3 = f(x_{i - 1} + \cfrac{1}{2} \cdot h, y_{i - 1} + \cfrac{1}{2} \cdot k_2 \cdot h) $
// $ k_4 = f(x_{i - 1} + h, y_{i - 1} + k_3 \cdot h) $
function [x, y] = rk4(a, b, h, y_0, f)
	y(1) = y_0
	x = a:h:b;
	
	for i = 2:length(x)
		k1 = f(x(i - 1), y(i - 1))
		k2 = f(x(i - 1) + 0.5 * h, y(i - 1) + 0.5 * k1 * h)
		k3 = f(x(i - 1) + 0.5 * h, y(i - 1) + 0.5 * k2 * h)
		k4 = f(x(i - 1) + h, y(i - 1) + k3 * h)
		
		y(i) = y(i - 1) + 1/6.0 * (k1 + 2 * k2 + 2 * k3 + k4) * h
	end
	
	y = y'
endfunction

[x, y] = rk4(0, 5, 0.25, 0.5, f);

plot(x, y, 'or');

x = 0:0.01:5;
y = (x + 1) .^ 2 - 0.5 .* (%e .^ x);

plot(x,y)
