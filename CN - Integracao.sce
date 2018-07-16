// Trapezios
// $ \int\limits_a^bf(x) dx $
// $ \cfrac{h}{2}\cdot(f(x_i) + f(x_{i+1})) $
// 										 f(x)
function area = integracaoTrapezios(a, b, f, qnt_intervalos)
	passo = (b - a)/qnt_intervalos
	area = 0
	
	// $ \text{cte} = \cfrac{\text{passo}}{2} $
	cte = passo / 2
	
	for i = a : passo : (b - passo)
		area = area + cte * (f(i) + f(i + passo))
	end
endfunction

// 1/3 Simpson
function i=simpson13(a0, bf, n)
	n = n/2;
	h = (bf - a0)/n;
	i = 0;
	
	for k = 0 : n - 1
		a = a0 + h * k;
		b = a0 + h * (k + 1);
		i = i + (1/3) * ((b-a)/2) * (f(a) + 4 * f((a+b)/2) + f(b));
	end
endfunction
