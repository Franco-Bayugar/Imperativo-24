program ImprimirRecursivamente;


procedure ImprimirNumerosRecursivos(N: integer);
	begin
		if(N > 1) then
			ImprimirNumerosRecursivos(N-1);
			
		writeln(N);
	end;
	
procedure ImprimirNumerosRecursivosInverso(N: integer);
	begin
		writeln(N);
		
		if(N > 1) then
			ImprimirNumerosRecursivosInverso(N-1);
	end;




var
	N: integer;
	
begin
	writeln('Que N número desea que se imprima desde el 1 a N');
	readln(N);
	ImprimirNumerosRecursivos(N);
	writeln();
	ImprimirNumerosRecursivosInverso(N);
end.
