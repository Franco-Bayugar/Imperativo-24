
procedure CrearArbolListas(var A: arbolMarcas; marca: str; auto: Auto); //"marca" criterio de ordenación, se pasa por parámetro
begin
    if A = nil then begin
        new(A);
        A^.marca := marca; //lleno el campo marca del nodo
        A^.autos := nil; //inicio el campo lista del nodo
        A^.HI := nil;
        A^.HD := nil;
        AgregarAtras(A^.autos, auto); // le agrego a la lista del campo del nodo creado el Auto leído
    end
    else begin
		if (A^.marca = marca) then //Inserto en el campo lista del mismo nodo
			AgregarAtras(A^.autos, auto) 
		else // recursión
			if (marca < A^.marca) then
				CrearArbolListas(A^.HI, marca, auto)
			else
				CrearArbolListas(A^.HD, marca, auto);
    end;
end;
