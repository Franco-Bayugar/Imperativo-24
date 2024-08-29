program PracticandoFOR;

procedure GeneradorTablaMultiplicar(num: integer);
	var
		i: integer;
	begin
		for i:= 1 to 10 do begin
			writeln(num, 'x', i);
			writeln(num*i);
		end;
	end;

var
	numero: integer;
begin
	writeln('Ingresar numero a calcular tabla: ');
	readln(numero);
	GeneradorTablaMultiplicar(numero);
end.
