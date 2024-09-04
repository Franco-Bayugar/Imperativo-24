program ProgramaNumAleatorio;

var 
	randomNumber, N, A, B, F, stop: integer;

begin
	Randomize; {star a new seed}
	stop:= 0;
	write('How many random numbers you want to generate?: ');
	readln(N);
	writeln('In what range?: ');
	write('A: ' );
	readln(A);
	write('B: ' );
	readln(B);
	write('Value that you dont want to appear, F: ');
	readln(F);
	
	repeat
		randomNumber:= random(B-A+1)+A; {"B=7, A=3 == 4 + 1 --> [3, 4, 5, 6, 7]" + A = where to start}
		if (randomNumber <> F) then begin
			writeln('number ', stop, ': ', randomNumber);
			stop:= stop+1
		end
		else begin
			writeln('Number ', F, ' has been found. Stoping the program...');
			stop:= N;
		end;
	until(stop = N);
end.
