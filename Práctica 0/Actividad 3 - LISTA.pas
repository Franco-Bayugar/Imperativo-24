program Lista;

type

	List = ^Node;
	
	Node = record
		data: integer;
		next: List;
		end;


procedure AgregarAtras(var L, ultimo: List; randomNumber: integer);
	var
		newNode: List;
		
	begin
		new(newNode);					{creación de nodo}
		newNode^.data:= randomNumber;
		newNode^.next:= nil;
		
		if(L = nil) then			{enlazamientos; considerando primera vez y subsecuentes}
			L:= newNode
		else
			ultimo^.next:= newNode;
		
		ultimo:= newNode;	{apuntar ultimo al newNode creado}
	end;
	
	
procedure PrintList(L: List);
	begin
		while(L <> nil) do begin
			writeln(L^.data);
			L:= L^.next;
		end;
	end;			
			
procedure createList(var L: list);
	var
		randomNumber: integer;
		ultimo: list;
	begin
		randomNumber:= random(150-100+1)+100;
		while(randomNumber <> 120) do begin
			writeln('numero generado: ', randomNumber);
			AgregarAtras(L, ultimo, randomNumber);
			randomNumber:= random(150-100+1)+100;
			if(randomNumber = 120) then
				writeln('120 GENERATED, STOPING PROGRAM...');
		end;
		PrintList(L);
	end;


function BuscarElemento(L: list; toSearch: integer): boolean;
	begin
		BuscarElemento:= False;
		while(L <> nil) do begin
			if(L^.data = toSearch) and (BuscarElemento = False) then begin
				BuscarElemento:= true;
			end
			else begin
				L:= L^.next;
			end;
		end;
	end;	
var
	L: List;
	numberToSearch: integer;
begin
	Randomize;
	L:= nil;
	createList(L);
	
	writeln('numero a buscar: ');
	readln(NumberToSearch);
	
	if(BuscarElemento(L, NumberToSearch)) then
		writeln('NUMERO ENCONTRADO')
	else
		writeln('NUMERO NO ENCONTRADO');
	
end.

