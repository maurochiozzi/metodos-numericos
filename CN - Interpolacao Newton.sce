// Interpolação de Newton -----------------------------------------------------
function tabelaDiffDiv = tDD(x, y)
	dimensao = length(x)
	tabela = zeros(dimensao, dimensao)
	tabela( : , 1) = y'
	diffDiv(tabela, x, 1, dimensao)
	tabelaDiffDiv = tabela
endfunction

function tabela = diffDiv(tabela, x, linha, coluna)
	if coluna == 1 then
		tabela(linha, coluna)
	else
		tabela(linha, coluna) = (diffDiv(tabela, x, linha + 1, coluna - 1) - diffDiv(tabela, x,linha, coluna - 1)) / (x(coluna + linha - 1) - x(linha));
	end
endfunction

y = [1.008 1.064 1.125 1.343];
x = [0 0.2 0.3 0.5];
