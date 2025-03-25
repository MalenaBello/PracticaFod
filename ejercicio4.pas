Program ejercicio4;
type
	Empleados= record 
		nombre:String[30];
		ape:String[30];
		dni:integer;
		edad:integer;
		num:integer
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
		writeln ('ingrese numero de empleado');
		readln(E.num);
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
procedure agregarEmpleado(var emp:Archivo);
var e,nuevo:Empleados; existe:boolean; fin :integer;
begin 
	reset(emp); //abro el archivo
	existe:= false; //necesito saber si ese empleado ya esta
	fin:=1; 
	while (fin = 1) do begin 
		LeerEmpleados(nuevo);
		while not eof(emp) do begin //recorro el archivo
			read(emp,e); 
			if (e.nombre = nuevo.nombre) then 
			existe:= true;
		end;
		if (existe= false) then begin
			write(emp,nuevo);
			writeln('empleado ingresado con existo');
		end
		else 
			writeln ('ya existe el empleado'); 
		writeln ('¿quiere ingresar otro empleado? (si =1; no=0)');
		readln(fin);
	end;
	
end;
procedure modificarEdad (var emp:Archivo); 
var e:Empleados; edad,num:integer; pude:boolean;
begin 
	pude:= false;
	writeln('ingrese el numero de empleado que quiere modificar'); 
	readln( num); 
	reset(emp);
	while not eof(emp) do begin 
		writeln('aca estoy');
		read(emp,e); 
		writeln('aca pude llegar2');
		if(e.num = num) then begin 
			writeln('pase la otra barrera');
			writeln('ingrese la nueva edad'); 
			readln(edad); 
			e.edad:= edad;
			seek(emp, FilePos(emp)-1);
			write (emp,e);
			pude:=true;
		end;
	if (Pude) then 
		writeln ('modificacion exitosa'); 
	end;
end; 			
procedure exportardatos(var emp:Archivo;var texto:Text);
var  nomF:String[30]; e:Empleados;
begin 
	writeln ('agregar nombre fisico'); 
	readln (nomF);
	assign (texto, nomF); 
	rewrite(texto); 
	reset(emp);
	while not eof(emp) do begin
		read(emp, e);
		with e do writeln (nombre:5,ape:5,edad:5, dni:5, num:5);
		with e do write(texto,nombre, ' ',ape,' ', dni, ' ' ,edad,' ',num); 
	end; 
	close(texto);
end;
procedure Modificar(var emp:Archivo;var Texto:Text); 
var 
	op:Char;
begin 
	writeln('\\menu para modificar\\\'); 
	writeln( 'opcion A= AgregarEmpleados');
	writeln('opcion B= ModificarDni');
	writeln ('opcion C= exportarDatos');
	readln(op);
	case op of 
		'A': agregarEmpleado(emp);
		'B': modificarEdad(emp);
		'C': exportarDatos(emp,Texto);
	else 
		writeln ('la opcion fue incorrecta');
	end;
	close(emp);
end;

var 
	emp:Archivo; op:String;NomFisico:String[20]; texto:Text;
begin
	writeln('ingresar nombre fisico para crear o abrir archivo : ');
	readln(NomFisico);
	assign(emp, NomFisico);
	writeln(' \\menu\\' ); 
	writeln ('opcion A: cargar y creacion de archivo');
	writeln ('opcion B: Lectura y listados');
	writeln('opcion c: modificacion del archi');
	writeln('seleccione opcion: '); 
	readln(op); 
	case op of 
		'A' :CreacionDeArchivos(emp);
		'B': LeerArchivo(emp);
		'C': Modificar(emp,texto);
	end;
	
End.

