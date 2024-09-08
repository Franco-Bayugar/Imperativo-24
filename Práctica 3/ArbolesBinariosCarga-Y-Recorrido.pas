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



var
    a: arbol;
    elemento: integer;
begin
  a:= nil;
  readln(elemento);
  while(elemento <> 0) do begin
    AgregarElemento(a, elemento);
    readln(elemento);
  end;
  RecorrerArbol(a);
end.
