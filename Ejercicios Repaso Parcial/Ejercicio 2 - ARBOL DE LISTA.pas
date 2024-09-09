program Ejercicio2; 

{

Una agencia dedicada a la venta de autos ha organizado su stock y, tiene la información de
los autos en venta. Implementar un programa que:

a) Genere la información de los autos (patente, año de fabricación (2010..2018), marca y
modelo, finalizando con marca ‘MMM’) y los almacene en dos estructuras de datos:
i. Una estructura eficiente para la búsqueda por patente. //ARBOL 1 POR PATENTE
ii. Una estructura eficiente para la búsqueda por marca. Para cada marca se deben
almacenar todos juntos los autos pertenecientes a ella. //ARBOL 2 POR MARCA; ARBOL DE LISTAS

b) Invoque a un módulo que reciba la estructura generado en a) i y una marca y retorne la
cantidad de autos de dicha marca que posee la agencia. //RECORRER TODO EL ARBOL PORQUE ES POR PATENTE EL ORDEN

c) Invoque a un módulo que reciba la estructura generado en a) ii y una marca y retorne
la cantidad de autos de dicha marca que posee la agencia. //RECORRER HASTA LA MARCA Y AHÍ CONTAR ELEMENTOS DE LA LISTA

d) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con
la información de los autos agrupados por año de fabricación. //RECIBE ARBOL Y CREA UN ARBOL AGRUPADO POR FABRICACION

e) Invoque a un módulo que reciba el árbol generado en a) i y una patente y devuelva el
modelo del auto con dicha patente. // BUSCAR PATENTE EN ARBOL1 Y DEVOLVER MODELO

f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el
modelo del auto con dicha patente. // BUSCAR POR NODO Y RECORRER SU LISTA HASTA DAR CON PATENTE

}

type
	str = String[20];

	Auto = record
		patente: str;
		aFabricacion: integer;
		marca: str;
		modelo: str;
		end;

	//Arbol patentes
	ArbolPatentes = ^nodePatente;

	nodePatente = record
		data: Auto;
		HI: ArbolPatentes;
		HD: ArbolPatentes;
		end;
		
	//Arbol Marcas
	ListaAutos = ^nodeListaAutos;
	
	nodeListaAutos = record
		data: Auto;
		next: ListaAutos;
		end;
		
	ArbolMarcas = ^nodeMarcas;
	
	nodeMarcas = record
		marca: str;
		listaAutos: ListaAutos;
		HI: ArbolMarcas;
		HD: ArbolMarcas;
		end;
		
	//Arbol Fabricación
	ArbolFabricacion = ^nodePatente;
	
	
	

// inciso A: Lectura del Registro Auto
Procedure LeerAuto(var A: Auto);
	begin
		with A do begin
			write('Ingrese Patente: '); 
			readln(patente);
			if(patente <> 'MMM') then begin
				write('Ingrese Año de Fabricación: '); readln(aFabricacion);
				write('Ingrese Marca del auto: '); readln(marca);
				write('Ingrese Modelo del auto: '); readln(modelo);
				writeln();
			end;
		end;
	end;
	



// inciso Ai: Cargar Arbol ordenado por patentes
procedure CargarArbolPatentes(var A: ArbolPatentes; auto: Auto);
	begin
		if(A = nil) then begin
			new(A);
			A^.data:= auto;
			A^.HI:= nil;
			A^.HD:= nil;
		end
		else begin
			if(auto.patente < A^.data.patente) then
				CargarArbolPatentes(A^.HI, auto)
			else
				CargarArbolPatentes(A^.HD, auto);
		end;
	end;
	
	
procedure CargarArbolI(var A: ArbolPatentes);
	var
		UnAuto: Auto;
	begin
		LeerAuto(UnAuto);
		while(UnAuto.patente <> 'MMM') do begin
			CargarArbolPatentes(A, UnAuto);
			LeerAuto(UnAuto)
		end;
		writeln('-CARGA DE ARBOL ORDENADO POR PATENTES TERMINADA-');
		writeln();
	end;	

	
	
	
// inciso Aii: Cargar Arbol ordenado por marcas, dos campos: marca y lista de autos
procedure AgregarAdelante(var L: listaAutos; auto: Auto);
	var
		newNode: listaAutos;
	begin
		new(newNode);
		newNode^.data:= auto;
		newNode^.next:= L;
		L:= newNode;
	end;
	
	
		
procedure CargarArbolMarcas(var A: ArbolMarcas; auto: Auto);
	begin
		if(A = nil) then begin
			new(A);
			A^.marca:= auto.marca;
			A^.listaAutos:= nil;
			A^.HI:= nil;
			A^.HD:= nil;
			AgregarAdelante(A^.listaAutos, auto);
		end
		else begin
			if(auto.marca = A^.marca) then
				AgregarAdelante(A^.listaAutos, auto)
			else
				if(auto.marca < A^.marca) then 
					CargarArbolMarcas(A^.HI, auto)
				else 
					CargarArbolMarcas(A^.HD, auto);
		end;
	end;



procedure CargarArbolII(var A: ArbolMarcas);
	var
		UnAuto: Auto;
	begin
		LeerAuto(UnAuto);
		while(UnAuto.patente <> 'MMM') do begin
			CargarArbolMarcas(A, UnAuto);
			LeerAuto(UnAuto);
		end;
		writeln('-CARGA DE ARBOL ORDENADO POR MARCAS TERMINADA-');
		writeln();
	end;		
	





//inciso B: Recorrer ArbolPatentes con marca dada y retornar ocurrencias
function RecorrerArbolPatentes(A: ArbolPatentes; marca: str): integer;
	begin
		if(A = nil) then
			RecorrerArbolPatentes:= 0
		else
			if(A^.data.marca = marca) then
				RecorrerArbolPatentes:= 1 + RecorrerArbolPatentes(A^.HI, marca) + RecorrerArbolPatentes(A^.HD, marca)
			else
				RecorrerArbolPatentes:= RecorrerArbolPatentes(A^.HI, marca) + RecorrerArbolPatentes(A^.HD, marca);
	end;
	
	
	
	
	
//inciso C: Recorrer ArbolMarca con marca dada y retornar la cantidad de autos en la lista
function RecorrerLista(L: ListaAutos): integer;
	var
		total: integer;
	begin
		total:= 0 ;
		while(L <> nil) do begin
			total:= total + 1;
			L:= L^.next;
		end;
		RecorrerLista:= total;
	end;
	

function RecorrerArbolMarcas(A: ArbolMarcas; marca: str): integer;
	begin
		if(A = nil) then
			RecorrerArbolMarcas:= 0
		else
			if(A^.marca = marca) then
				RecorrerArbolMarcas:= RecorrerLista(A^.listaAutos) + 1
			else
				if (marca < A^.marca) then
					RecorrerArbolMarcas:= RecorrerArbolMarcas(A^.HI, marca)
				else
					RecorrerArbolMarcas:= RecorrerArbolMarcas(A^.HD, marca);
	end;

	
	
	



// inciso E: Recorrer ArbolPatentes donde el criterio de encontrar es Patente dada y devuelva el modelo de auto
function BuscarModelo(A: ArbolPatentes; patente: str): str;
	begin
		if (A = nil) then
			BuscarModelo:= '-no existe-'
		else
			if(A^.data.patente = patente) then
				BuscarModelo:= A^.data.modelo
			else
				if(patente < A^.data.patente) then
					BuscarModelo:= BuscarModelo(A^.HI, patente)
				else
					BuscarModelo:= BuscarModelo(A^.HD, patente);
	end;
	
	


// inciso F: Recorrer ArbolMarcas donde el criterio de busqueda es patente, recorrer cada lista del campo del nodo
function RecorrerListaAutoNodo(L: ListaAutos; patente: str): str;
	begin
		while(L <> nil) do begin
			if(L^.data.patente = patente) then
				RecorrerListaAutoNodo:= L^.data.modelo
			else
				L:= L^.next;
		end;
		RecorrerListaAutoNodo:= 'No se encontró';
	end;

function BuscarModeloEnArbolLista(A: ArbolMarcas; patente: str): str;
	begin
		if(A = nil) then
			BuscarModeloEnArbolLista:= '-no existe-'
		else 
			if(A^.listaAutos^.data.patente = patente) then
				BuscarModeloEnArbolLista:= A^.listaAutos^.data.modelo
			else begin
				BuscarModeloEnArbolLista:= RecorrerListaAutoNodo(A^.listaAutos, patente);
				if(A^.listaAutos^.data.patente < patente) then
					BuscarModeloEnArbolLista:= BuscarModeloEnArbolLista(A^.HI, patente)
				else
					BuscarModeloEnArbolLista:= BuscarModeloEnArbolLista(A^.HD, patente)
			end;
	end;

var
	AP: ArbolPatentes;
	AM: ArbolMarcas;
	marca, patente: str;
	
	
begin
	// inciso Ai: Cargar Registros en Arbol ordenado por patentes
	writeln('--INGRESO DE CARGA DE AUTOS--');
	CargarArbolI(AP);
	
	// inciso Aii: Arbol donde cada nodo tiene: Marca y Lista de autos;
	CargarArbolII(AM);
	
	// inciso B: Recorrer ArbolPatentes con una MARCA dada y RETORNAR cantidad de ocurrencias
	writeln('De qué marca querés contar las ocurrencias - ARBOL ORDENADO POR PATENTES: ');
	readln(marca);
	writeln('Cantidad de ocurrencias: ', RecorrerArbolPatentes(AP, marca));
	
	// inciso C: Recorrer ArbolMarcas con una MARCA dada, encontrar el NODO.marca = MARCA y retornar cantidad de autos en ListaAutos
	writeln('De qué marca querés contar las ocurrencias - ARBOL ORDENADO Y AGRUPADO POR MARCAS: ');
	readln(marca);
	writeln('Cantidad de ocurrencias: ', RecorrerArbolMarcas(AM, marca));

	// inciso E: Recorrer ArbolPatentes donde el criterio de encontrar es Patente dada y devuelva el modelo de auto
	patente:= '';
	write('|ARBOL PATENTES| Ingresa una patente, se devolverá su modelo correspondiente: ');
	readln(patente);
	writeln(BuscarModelo(AP, patente));	
	
	// Inciso F: Recorrer ArbolMarcas donde el criterio de busqueda es patente, recorrer cada lista del campo del nodo
	write('|ARBOL MARCAS| Ingresa una patente, se devolverá su modelo correspondiente: ');
	readln(patente);
	writeln(BuscarModeloEnArbolLista(AM, patente));
end.



