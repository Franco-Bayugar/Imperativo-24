program ArbolDeRegistros;

type 

	str = String[50];
	
	cliente = record
		codigo: 1..1000;
		mail: str;
		cantCorreosSinLeer: integer;
		end;
		
	arbol = ^node;
	
	node = record
		data: cliente;
		HI: arbol;
		HD: arbol;
		end;

// inciso A - Leer cliente y agregarlo al árbol


	procedure leerCliente(var C: cliente);
		begin
			with C do begin
				write('Código del cliente: '); readln(codigo);
				write('Mail: '); readln(mail);
				write('Cantidad de correos sin leer: '); readln(cantCorreosSinLeer);
				writeln();
			end;
		end;

	procedure AgregarArbol(var A: arbol; C: cliente);
		begin
			if(A = nil) then begin
				new(A);
				A^.data:= C;
				A^.HI:= nil;
				A^.HD:= nil;
			end
			else begin
				if(C.codigo <= A^.data.codigo) then
					AgregarArbol(A^.HI, C)
				else
					AgregarArbol(A^.HD, C);
			end;
		end;

	procedure AlmacenarCliente(var A: arbol);
		var
			C: cliente;
		begin
			repeat
				leerCliente(C);
				AgregarArbol(A, C);
			until(C.codigo = 1000);
		end;



//inciso B - Cuántos mails tiene sin leer
	function BuscarElemento(A: arbol; codigo: integer): integer;
		begin
			if(A = nil) then
				BuscarElemento:= -1
			else
				if(codigo =  A^.data.codigo) then
					BuscarElemento:= A^.data.cantCorreosSinLeer
				else
					if(codigo < A^.data.codigo) then
						BuscarElemento:= BuscarElemento(A^.HI, codigo)
					else
						BuscarElemento:= BuscarElemento(A^.HD, codigo);
		end;

// inciso C - Imprimir Arbol de Mayor a Menor
	procedure ImprimirArbolMayorAMenor(A: Arbol);
		begin
			if(A <> nil) then begin
				ImprimirArbolMayorAMenor(A^.HD);
				writeln(A^.data.codigo);
				ImprimirArbolMayorAMenor(A^.HI);
			end;
		end;


// inciso D - Leer mail y devolver un boolean si existe o no
	function BuscarCorreo(A: arbol; correo: str): boolean;
		var
			auxExito: boolean;
		begin
			if(A = nil) then
				BuscarCorreo:= False
			else
				if(A^.data.mail = correo) then
					BuscarCorreo:= True
				else begin
					// Acá cómo no busco por código, sino que voy a buscar a lo bruto por todo el arbol, necesito una variable extra
					auxExito:= BuscarCorreo(A^.HI, correo); // guardo en una variable aux todo el subarbol izquierdo
					if(not auxExito) then 
						auxExito:= BuscarCorreo(A^.HD, correo); //si no está, busco por toda la derecha
						
					BuscarCorreo:= auxExito;
				end;
		end;




var
	A: arbol;
	n: integer;
	correo: str;

begin
	A:= nil;
	//inciso A
	AlmacenarCliente(A);
	
	//inciso B
	writeln('Ingresar código de cliente para ver cuántos mails sin leer tiene: ');
	readln(n);
	writeln('Correos sin leer: ', BuscarElemento(A, n));	
	
	//inciso C
	writeln('Impresión del árbol de Mayor a Menor: ');
	ImprimirArbolMayorAMenor(A);
	
	//inciso D
	writeln('Ingrese Mail a buscar: ');
	readln(correo);
	writeln('Mail existe: ', BuscarCorreo(A, correo));	
end.
