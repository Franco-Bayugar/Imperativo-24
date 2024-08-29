program PracticandoIF;

var 
	x, y: integer;
begin
	x:= 7;
	y:= 2;
	
	
	if(x > 4) or (y > 4) then begin
		writeln('exito')
	end
	else begin
		writeln('falla');
	end;
	
end.
