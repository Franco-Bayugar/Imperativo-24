program Lista;

type

	Persona = record
		Nombre: String[20];
		DNI: integer;
		end;
		
	{List definition}
	PNode = ^Node;
	
	Node = record
		data: Persona;
		next: PNode;
		end;
		
{procedures definition}

procedure AddToFront(var head: PNode; value: Persona);
	var
		NewNode: PNode; {Stores a memory direction}
	begin
		New(NewNode);
		NewNode^.data:= value;
		NewNode^.next:= head; {First one points to NIL; Next ones will point to head which is NewNode which also is a mem. direction}
		
		head:= NewNode;
		writeln(NewNode^.data.Nombre);
	end;


var
	N: PNode;
	P: Persona;
begin
	N:= NIL;
	P.nombre:= 'Franco';
	P.DNI:= 123;
	AddToFront(N, P);
end.












