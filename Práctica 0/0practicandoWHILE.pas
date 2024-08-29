program PracticandoWHILE;

procedure sumar(var total: integer);
	var 
		num: integer;
	begin
		writeln('Ingrese un número: ');
		readln(num);
		while(num >= 0) do begin
			total:= total + num;
			writeln('Ingrese un número: ');
			readln(num);
		end;
		writeln('número negativo detectado')
	end;


var
	total: integer;
	
begin
	total:= 0;
	sumar(total);
	writeln('Total: ', total);
end.
