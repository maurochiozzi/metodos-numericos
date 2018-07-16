// f = ab ^ x

// ln(f) = ln(a) + xln(b)
// ln(f) = a0 + x * a1

// a = e^a0
// b = e^a1

function xr = mmqPolinomial(x, y, grau) 
	for i = 1 : (grau + 1)
		for j = 1 : (grau + 1)
			A(i, j) = sum( x .^ (j + i - 2))
		end
	end

	for i = 1 : (grau + 1)
		b(i) = sum(y .* (x .^ (i - 1))) 
	end

	xr = A\b
endfunction

function xr = vandermondMatrix(x, y, grau)
	n = length(x)
	
	for i = 1 : n
		for j = 1 : grau
			A(i,j) = x(i) ^ (j - 1)
		end
		
		b(i) = y(i)
	end
	
	xr = (A'*A)\(A'*b)
endfunction


