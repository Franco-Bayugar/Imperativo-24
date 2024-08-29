program PracticandoREGISTROS; {Saber la cantidad de alumnos leídos; termina con código = 0}

type
	str20 = String[20];
	
	alumno = record
		codigo: integer;
		nombre: str20;
		promedio: real;
		end;

procedure leer(var a: alumno);
	begin
		with a do begin
			writeln('Código del alumno: ');
			readln(codigo);
			
			if(a.codigo <> 0) then begin
				writeln('nombre: ');
				readln(nombre);
				writeln('promedio: ');
				readln(promedio);
				readln;
			end;
		end;
	end;
	


var
	a: alumno;
	cant: integer;

begin
	cant:= 0;
	leer(a);
	while(a.codigo <> 0) do begin
		cant:= cant+1;
		leer(a);
	end;
	writeln('CANTIDAD TOTAL DE ALUMNOS LEIDOS: ', cant);
	readln;
end.
