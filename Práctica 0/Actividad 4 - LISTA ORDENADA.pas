program CargarListaOrdenada;

type
	List = ^node;
	
	node = record
		data: integer;
		next: List;
		end;
		
	
procedure InsertarOrdenado(var L: List; randomNumber: integer);
	var
		newNode, prev, actual: List;
	begin
		new(newNode); // creación de nodo
		newNode^.data:= randomNumber;
		prev:= L; // siempre apunten al head de la lista
		actual:= L;
		
		while(actual <> nil) and (randomNumber > actual^.data) do begin // ">" porque el que viene de afuera, randomNumber, chequea si es MAYOR porque es de menor a MAYOR, el extremo.
			prev:= actual; // anclo prev con actual y muevo actual
			actual:= actual^.next;
		end;
		
		//si hubo movimiento o no; asigno L, prev y new.
		if(actual = prev) then
			L:= newNode //enlazamiento de head
		else
			prev^.next:= newNode; //enlazamiento en el corte, hago que el anterior en el corte se enlace al nuevo...
		
		newNode^.next:= actual; // ...y que el nuevo se enlace al actual, que sería el último
	end;
		

procedure PrintList(L: List);
	begin
		writeln('INICIANDO PRINT DE LISTA...');
		while(L <> nil) do begin
			writeln(L^.data);
			L:= L^.next;
		end;
	end;

procedure CargarLista(var L: List);
	var
		randomNumber: integer;
	begin
		randomNumber:= random(150-100+1)+100;
		while(randomNumber <> 120) do begin
			InsertarOrdenado(L, randomNumber);
			randomNumber:= random(150-100+1)+100;
			writeln('Número generado: ', randomNumber);
		end;
		PrintList(L);
	end;
	
function BuscarElementoOrdenado(L: List; N: integer): boolean;
	begin
		BuscarElementoOrdenado:= False;
		while(L <> nil) and (L^.data <= N) do begin
			if(L^.data = N) then begin
				BuscarElementoOrdenado:= True;
				L:= nil;
			end
			else begin
				L:= L^.next;
			end;
		end;
	end;
	
	

var
	L: List;
	N: integer;


// programa principal 
begin
	Randomize();
	L:= nil;
	CargarLista(L);
	writeln('ELEMENTO A BUSCAR: ');
	readln(N);
	if (BuscarElementoOrdenado(L, N)) then
		writeln('ELEMENTO ENCONTRADO')
	else 
		writeln('NO ENCONTRADO');
end.
