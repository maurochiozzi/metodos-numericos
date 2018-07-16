// Interpolação de Newton -----------------------------------------------------
function tabelaDiffDiv = tDD(x, y)
	global tabela
	dimensao = length(x)
	tabela = zeros(dimensao, dimensao)
	tabela( : , 1) = y'

	diffDiv(x, 1, dimensao)
	tabelaDiffDiv = tabela
endfunction

function dd = diffDiv(x, linha, coluna)
	global tabela
	
	if coluna == 1 then
		dd = tabela(linha, coluna)
	else
		tabela(linha, coluna) = (diffDiv(x, linha + 1, coluna - 1) - diffDiv(x,linha, coluna - 1)) / (x(coluna + linha - 1) - x(linha));
		dd = tabela(linha, coluna)
	end
endfunction

// $ \sum\limits_{i = 1}^{n}b_i\prod\limits_{j = 1}^{i - 1}(p - x_j)$
function y1 = newton(x, y, ponto)
	soma = 0
	qnt_pontos = length(x)
	DD = tDD(x,y)
	
	for i = 1 : qnt_pontos
		produto = 1
		
		for j = 1 : i - 1
			produto = produto .* (ponto - x(j))
		end
		
		soma = soma + produto .* DD(1, i)
	end
	
	y1 = soma
endfunction

// Interpolação de LaGrange ---------------------------------------------------
// $ P(x) = \sum\limits_{i = 1}^{n}(y_i\prod\limits_{j = 1;j \neq{i}}^n \cfrac{x - x_j}{x_i - x_j}) $
function y1 = laGrange(x, y, ponto)
	qnt_pontos = length(x)
	soma = 0
	
	for i = 1 : qnt_pontos
		produto = 1
		
		for j = 1 : i - 1
			produto = produto .* (ponto - x(j))/(x(i) - x(j))
		end
		
		for j = i + 1 : qnt_pontos
			produto = produto .* (ponto - x(j))/(x(i) - x(j))
		end
		
		soma = soma + produto .* y(i)
	end
	
	y1 = soma
endfunction
