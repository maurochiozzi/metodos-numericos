// $ e_{r} = \cfrac{e_n - e_v}{e_n} $
function e = erroRelativo(novo, velho)
	//if velho == null then
		//e = null
	//else
		e = abs((novo - velho) / novo)
	//end
endfunction

function bissec = bisseccao(a, b, precisao, qnt_int)
	if (((10^(-precisao))/2.0) > erroRelativo(a,b)) | (qnt_int == 1) then
		bissec = (a + b)/2.0
	else
		c = (a + b)/ 2.0

		if f(a) * f(c) < 0 then
			bissec = bisseccao(a, c, precisao, qnt_int - 1)
		else
			bissec = bisseccao(b, c, precisao, qnt_int - 1)
		end
	end
endfunction

function raiz = falsaPosicao(a,b,p, max_int)
	qnt_int = 1;

	c=(a.*f(b)-b.*f(a))./(f(b)-f(a))

	while (erroRelativo(c,b) > 10^(-p) / 2 & qnt_int < max_int)
		if f(a).*f(c) > 0 then 
			a = c
		else
			b = c
		end

		c=(a.*f(b)-b.*f(a))./(f(b)-f(a))
	
		qnt_int = qnt_int + 1
	end
	
	raiz=c
endfunction

function fpos = falsaPosicaob(a, b, precisao, qnt_int)
	if (((10^(-precisao))/2.0) > erroRelativo(a, b)) | (qnt_int == 1) then
		fpos = a - (((b - a) * f(a)) / (f(b) - f(a)))
	else
		c = a - (((b - a) * f(a)) / (f(b) - f(a)))
		
		fpos = falsaPosicaob(a, c, precisao, qnt_int - 1)
	end
endfunction

function ma = newton(a, b, precisao, qnt_int)
	if (((10^(-precisao))/2.0) > erroRelativo(a, b)) | (qnt_int == 1) then
		ma = a - (f(a)/f1(a))
	else
		b = a // para ficar mais legível
		a = a - (f(a)/f1(a))
		
		ma = newton(a, b, precisao, qnt_int - 1)
	end
endfunction

function seca = secante(a, b, precisao, qnt_int)
	if (((10^(-precisao))/2.0) > erroRelativo(a, b)) | (qnt_int == 1) then
		seca = a - f(a) * (a - b)/(f(a) - f(b))
	else
		c = a - f(a) * (a - b)/(f(a) - f(b))
		seca = secante(c, a, precisao, qnt_int - 1)
	end
endfunction

clc
