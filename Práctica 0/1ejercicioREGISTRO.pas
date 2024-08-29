{5. Realizar un programa que lea información de autos que están a la venta en una concesionaria. De cada auto se lee:
marca, modelo y precio. La lectura finaliza cuando se ingresa la marca “ZZZ” que no debe procesarse. La
información se ingresa ordenada por marca. Se pide calcular e informar:

a. El precio promedio por marca.
b. Marca y modelo del auto más caro.}

program EjercicioREGISTRO;
type

	str20 = String[20];

	auto = record
		marca: str20;
		modelo: str20;
		precio: real;
		end;
		
procedure leerAutos(var A: auto);
	begin
		with A do begin
				writeln('Ingresar MARCA: ');
				readln(marca);
				
				if(marca <> 'ZZZ') then begin
					writeln('MODELO: ');
					readln(modelo);
					writeln('PRECIO: ');
					readln(precio);
					writeln('-------------------')
				end;
		end;
	end;
	
function calcularPromedio(precioTotal: real;totalAutos: integer): real;
		begin
			calcularPromedio:= precioTotal / totalAutos;
		end;
	
		
var
	a: auto;
	totalAutos: integer;
	precioTotal: real;
	marcaActual: str20;
begin
	totalAutos:= 0; {inicialización de variables}
	precioTotal:= 0;
	marcaActual:= '';
	leerAutos(a);
	
	while(a.marca <> 'ZZZ') do begin {CORTE TOTAL}
		totalAutos:= totalAutos + 1;
		marcaActual:= a.marca; {el corte específico lleva siempre la misma condición arriba}
		
		while(marcaActual = a.marca) do begin {CORTE ESPECÍFICO  ^}
			precioTotal:= precioTotal + a.precio;
			writeln('PRECIO PROMEDIO MOMENTANEO: ', calcularPromedio(precioTotal, totalAutos):2:2);
			leerAutos(a);
			totalAutos:= totalAutos + 1;
		end;
		totalAutos:= 0; {reinicio de variables}
		precioTotal:= 0;
	end;
end.
