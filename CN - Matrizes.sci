//i linha
//j coluna

function o = otimizacao(A)
	[linha, coluna] = size(A)
	
	for i = 1:linha
		A(i, :) = A(i, :) / A(i, i)
	end
	
	o = A
endfunction

function inf_tri = triangularInferior(A)
	[linha, coluna] = size(A)
	
	A = otimizacao(A)
	
	inf_tri(1) = A(1, coluna)
	
	for i = 2:linha
		S = 0
		
		for j = 1:(i - 1)
			S = S + A(i, j) * inf_tri(j)
		end
		disp(S)
		inf_tri(i) = A(i, coluna) - S
	end
endfunction

function sup_tri = triangularSuperior(A)
	[linha, coluna] = size(A)
	
	A = otimizacao(A)
	
	sup_tri(linha) = A(linha, coluna)
	
	for i = (linha - 1):(-1):1
		S = 0
		
		for j = (i + 1):linha
			S = S + A(i, j) * sup_tri(j)
		end
	
	sup_tri(i) = A(i, coluna) - S
	
	end
endfunction


function g = gauss1(A)
	[linha, coluna] = size(A)
	
	if A(1,1) ~= 0 then
		g(1, :) = A(1, :)
		
		for i = 2:linha
			g(i,:) = A(i, :) - A(i,1)/A(1,1) * A(1, :)
		end
	end
	
endfunction

function g = eliminacaoGauss(A)
	[linha, coluna] = size(A)
	
	for j = 1:coluna
		for i = (j+1):linha
			A(i, :) = A(i, :) - (A(i, j) / A(j,j)) * A(j, :)
		end
	end
	
	g = A
endfunction

function g = gauss(A)
	c = eliminacaoGauss(A)
	c = triangularSuperior(c)
	
	g = c
endfunction

function [B, g] = matrizB(A)
	
endfunction

function j = jacobi(A, solucao_inicial, tolerancia, Inter)
	
endfunction