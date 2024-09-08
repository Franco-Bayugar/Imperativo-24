{

El administrador de un edificio de oficinas tiene la información del pago de las expensas
de dichas oficinas. Implementar un programa con:

a) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas que
administra. Se deben cargar, para cada oficina, el código de identificación, DNI del
propietario y valor de la expensa. La lectura finaliza cuando llega el código de
identificación 0.

b) Un módulo que reciba el vector retornado en a) y retorne dicho vector ordenado por
código de identificación de la oficina. Ordenar el vector aplicando uno de los métodos
vistos en la cursada.

c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
generado en b) y un código de identificación de oficina. En el caso de encontrarlo, debe
retornar la posición del vector donde se encuentra y en caso contrario debe retornar 0.
Luego el programa debe informar el DNI del propietario o un cartel indicando que no
se encontró la oficina.

d) Un módulo recursivo que retorne el monto total de las expensas.

}

program Repaso1;

const
	dimf = 300;
	
type
	oficina = record
		codigo: integer;
		dniPropietario: integer;
		valorExpensas: real;
		end;
		
	vectorOficinas = array [1..dimf] of oficina;
	
	
	
//inciso A; leer y cargar vector
procedure LeerOficina(var O: oficina);
	begin
		with O do begin
			write('Código del Propietario: ');
			readln(codigo);
			if(codigo <> 0) then begin
				write('DNI: ');
				readln(dniPropietario);
				write('Valor de Expensas: ');
				readln(valorExpensas);
				writeln();
			end;
		end;
	end;


procedure CargarVector(var V: vectorOficinas; var diml: integer);
	var
		O: oficina;
	begin
		LeerOficina(O);
		while (diml <= dimf) and (O.codigo <> 0) do begin
			diml:= diml + 1;
			V[diml]:= O;
			LeerOficina(O);
			writeln();
		end;
	end;

//inciso B: Ordenar vector por código
procedure OrdenarVector(var V: vectorOficinas; diml: integer);
	var
		i, j, pos: integer;
		item: oficina;
	begin
		for i:= 1 to diml-1 do begin
			pos:= i;
			for j:= i+1 to diml do
				if(v[j].codigo < v[pos].codigo) then
					pos:= j;
			
			item:= v[pos];
			v[pos]:= v[i];
			v[i]:= item;
		end;			
	end;

//inciso C: RETORNA posición del elemento
function BusquedaVector(V: vectorOficinas; diml, cod: integer): integer;
	var
		inicio, medio, fin: integer;
		exito: boolean;
	begin
		inicio:= 1; //inicialización auxiliares
		fin:= diml;
		exito:= false;
		BusquedaVector:= 0;
		
		while(inicio <= fin) and (not exito) do begin
			medio:= (inicio + fin) div 2;
			
			if(V[medio].codigo = cod) then begin
				BusquedaVector:= medio; //Encuentra al medio
				exito:= true;
			end
			else begin
				if (V[medio].codigo > cod) then //Corta el vector
					fin:= medio - 1
				else 
					inicio:= medio + 1;
			end;
		end;
	end;


// inciso D: módulo recursivo que retorna el monto total de expensas
function TotalExpensas(V: vectorOficinas; diml: integer): real;
	begin
		if(diml = 0) then
			TotalExpensas:= 0
		else
			TotalExpensas:= TotalExpensas(V, diml-1) + V[diml].valorExpensas;
	end;





// PROGRAMA PRINCIPAL
var
	V: vectorOficinas;
	diml, cod: integer;
begin
	//inciso A; leer y cargar vector
	diml:= 0;
	CargarVector(V, diml);
	
	//inciso B; ordenar vector por código
	OrdenarVector(V, diml);

	//inciso C: búsqueda binaria que debe RETORNAR posición del código ingresado; INFORMAR dni o no se encontró
	write('Ingrese código a buscar: ');
	readln(cod);
	if(BusquedaVector(V, diml, cod) <> 0) then
		writeln('DNI del propietario: ', V[BusquedaVector(V, diml, cod)].dniPropietario)
	else
		writeln('No se encontró la oficina');
		
	//inciso D: módulo recursivo que devuelva el monto total de expensas
	writeln('Total del valor de expensas: ', TotalExpensas(V, diml):2:2);
	
end.




