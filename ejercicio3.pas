Program ejercicio3;
type
	Empleados= record 
		nombre:String[30];
		ape:String[30];
		dni:integer;
		edad:integer;
	end;
   Archivo=file of Empleados;
 procedure LeerEmpleados( var E:Empleados); 
 begin 
	writeln ('ingrese apellido'); 
	readln(E.ape);
	if( E.ape <> 'final') then begin 
		writeln ('ingrese Nombre'); 
		readln (E.nombre); 
		writeln ('ingrese edad');
		readln(E.edad);
		writeln ('ingrese dni'); 
		readln(E.dni);
	end
	else writeln ('finalizo la carga');
end;
	
procedure CreacionDeArchivos (var Empleados:Archivo); 
var E:Empleados;
begin 
	rewrite (Empleados);
	writeln ('ingrese los datos de empleados, el apellido "fin" cierra la carga');
	LeerEmpleados(E);
	while (E.ape <> 'final') do begin 
		write(Empleados, E);
		LeerEmpleados(E);
	end;
	close(Empleados);
end;
procedure ImprimirEmpleados(E:empleados); 
begin 
	writeln (' nombre: ', E.nombre, ' apellido: ', E.ape, ' dni: ', E.dni, ' edad: ', E.edad);
end;
procedure opcionA (var E:Archivo);
var emp:Empleados; n:String ;
begin 
	writeln ('ingrese el nombre a buscar:');
	readln (n);
	while not eof(E) do begin 
		read(E, emp);
		if (emp.nombre = n) then
			ImprimirEmpleados(emp)
	end;
	  
end;
procedure opcionB( var E:Archivo);
var 
	emp:Empleados;
begin 
	while not eof(E) do begin 
		read(E,emp); 
		ImprimirEmpleados(emp);
	end;
end;
procedure opcionC(var E:Archivo); 
var emp:Empleados; 
begin 
	while not eof(E) do begin 
		read(E, emp); 
		if (emp.Edad > 70) then 
			ImprimirEmpleados(emp)
		end;
end;
			
			
procedure LeerArchivo (var E:Archivo);
var 
	op:char;
begin 
	Reset(E); 
	writeln (' \\ menu de listados a acceder\\');
	writeln ('opcion A= Datos de empleado ingresado');
	writeln ('opcion b= Lista de todos los empleados');
	writeln ('opcion c= Lista de empleados mayores a 70 anios'); 
	writeln ('ingresas opcion: '); 
	readln(op); 
	case op of 
		'A': opcionA(E);
		'b': opcionB(E);
		'c': opcionC(E);
	else 
		writeln('la opcion fue incorrecta'); 
	end;
	close(E);
end;
var 
	emp:Archivo; op:String;NomFisico:String[20];
begin
	writeln('ingresar nombre fisico para crear o abrir archivo : ');
	readln(NomFisico);
	assign(emp, NomFisico);
	writeln(' \\menu\\' ); 
	writeln ('opcion A: cargar y creacion de archivo');
	writeln ('opcion B: Lectura y listados');
	writeln('seleccione opcion: '); 
	readln(op); 
	case op of 
		'A' :CreacionDeArchivos(emp);
		'B': LeerArchivo(emp);
	end;
	
End.
