program ProgramaNumAleatorio;

var 
	aleatorio: integer;

begin
	randomize;
				{Elige una semilla distinta cada vez que se ejecuta el programa.}
                {La semilla sirve para generar series de números aleatorios distintos.}
                {Sin la llamada al procedimiento randomize, en todas las ejecuciones
                 del programa se elige siempre la misma serie de números aleatorios.}
     
    aleatorio := random(100);

	writeln('numero aleatorio generado es: ', aleatorio);
	writeln ('Presione cualquier tecla para finalizar');
    readln;
end.
