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
		new(newNode);					{asignación de datas}
		newNode^.data:= randomNumber;
		newNode^.next:= nil;
		
		if(L = nil) then			{enlazamientos; primera vez y subsecuentes}
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



var
	L: List;
begin
	Randomize;
	L:= nil;
	createList(L);
end.

