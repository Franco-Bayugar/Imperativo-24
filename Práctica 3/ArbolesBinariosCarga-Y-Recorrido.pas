program Hello;


type
    arbol = ^node;
    
    node = record
        data: integer;
        HI: arbol;
        HD: arbol;
        end;
        
procedure AgregarElemento(var A: arbol; elemento: integer); 
    begin
        //nodo vacío
        if (A = nil) then begin
			new(A);
            A^.data:= elemento;
            A^.HI:= nil;
            A^.HD:= nil;
        end
        else begin //nodo con data; tengo que recorrer el árbol
            if(elemento <= A^.data) then
                AgregarElemento(A^.HI, elemento)
            else    
                AgregarElemento(A^.HD, elemento);
        end;
    end;

procedure RecorrerArbol(A: Arbol);
	begin
		if(A <> nil) then begin
			RecorrerArbol(A^.HI);
			writeln(A^.data);
			RecorrerArbol(A^.HD);
		end;
	end;
	
	// ORDEN -> HI, ACCION, HD
	// PREORDEN -> ACCION, HI, HD
	// POSTORDEN -> HI, HD, ACCION
	
	
	
	
	
	// BUSCAR ELEMENTO -> BOOLEAN

function BuscarElementoConBoolean(A: arbol; x: integer): boolean;
	begin
		if(A = nil) then
			BuscarElementoConBoolean:= False
		else
			if(A^.data = x) then 
				BuscarElementoConBoolean:= True
			else
				if(x < A^.data) then
					BuscarElementoConBoolean:= BuscarElementoConBoolean(A^.HI, x)
				else
					BuscarElementoConBoolean:= BuscarElementoConBoolean(A^.HD, x);
	end;
	
	
	
	
	// BUSCAR ELEMENTO -> NODO

function BuscarElemento(A: arbol; x: integer): integer;
	begin
		if(A = nil) then
			BuscarElemento:= 0
		else
			if (x = A^.data) then
				BuscarElemento:= A^.data
			else
				if (x < A^.data) then
					BuscarElemento(A^.HI, x)
				else
					BuscarElemento(A^.HD, x);
	end;	

var
    a: arbol;
    elemento, x: integer;
begin
	a:= nil;
	readln(elemento);
	while(elemento <> 0) do begin
		AgregarElemento(a, elemento);
		readln(elemento);
	end;
	writeln();
	RecorrerArbol(a);
	writeln();
  
	writeln('BUSCAR NÚMERO, RETORNA SI EXISTE O NO: ');
	readln(x);
	writeln(BuscarElementoConBoolean(a, x));
	writeln();
	
	writeln('BUSCAR NÚMERO, RETORNA EL NODO: ');
	readln(x);
	writeln(BuscarElemento(a, x));
end.
