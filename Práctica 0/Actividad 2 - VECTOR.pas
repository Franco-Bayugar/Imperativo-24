program vectores;

const
	dimf = 5;

type
	Vector = array[1..dimf] of integer;



	{CHARGING VECTOR}
	
procedure CargarVector(var v: Vector; var diml: integer; A, B: integer);
	var
		randomNumber: integer;
	begin
		{charging data}
		randomNumber:= random(B-A+1)+A;
		while(diml <=	 dimf) and (randomNumber <> 0) do begin
			v[diml]:= randomNumber;
			writeln('Posición ', diml);
			writeln('value generated = ', randomNumber);
			diml:= diml+1;
			randomNumber:= random(B-A+1)+A;
			writeln();
		end;
		
		diml:= diml-1; {correct the last diml++}
		
		{if 0 appears or diml=dimf}
		if(diml >= dimf) then
			writeln('DIMF reached... ending charge')
		else
			writeln('0 founded... ending charge');
			
			
		writeln();
	end;
	
	
	
	{PRINTS}
	
procedure PrintVector(v: Vector; diml: integer);
	var
		i: integer;
	begin
		writeln('Printing ordered Vector: ');
		for i:= 1 to diml do begin
			write('[',v[i],']');
		end;
		writeln();
	end;
	
procedure PrintInversedVector(v: Vector; diml: integer);
	var
		i: integer;
	begin
		writeln('Printing backwards Vector: ');
		for i:= diml downto 1 do begin
			write('[',v[i],']');
		end;
		writeln();
	end;
	

var
	V: Vector;
	A, B, diml: integer;

begin
	Randomize;
	diml:= 1;
	writeln('The following vector will charge values in a A-B range until reach diml=50 or generates the value = 0');
	write('Minimum range: ');
	readln(A);
	write('Maximum range: ');
	readln(B);
	CargarVector(V, diml, A, B);
	PrintVector(V, diml);
	writeln('---------');
	PrintInversedVector(V, diml);
end.
