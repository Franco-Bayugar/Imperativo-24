program PracticandoREPEAT;

procedure chequear(numRandom: integer);
	var
		num: integer;
	begin
		writeln('Un número fue generado aleatoriamente entre el 1 y 10 incluidos');
		
		repeat
			writeln('escribí tu adivinanza: ');
			readln(num);
			
			if(num > numRandom) then begin
				writeln('El número random es MENOR a eso.');
			end
			else begin
				if(num < numRandom) then 
					writeln('El número random es MAYOR a eso.');
			end;
			
		until(num = numRandom);
		writeln('¡ADIVINASTE! el número random es: ', numRandom);
	end;

var
	numRandom: integer;
begin
	Randomize; {inicializar la seed}
	numRandom:= Random(10)+1;
	chequear(numRandom);
end. 
