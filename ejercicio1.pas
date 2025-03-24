Program ejercicio1;
type
	ArchivoDeEnteros= file of Integer;
procedure CargarArchivos ( var Enteros:ArchivoDeEnteros; var num:integer);
begin 
	writeln ('ingrese un numero');
	read (num);
	while (num <> 3000) do begin	
		write(Enteros, num);
		read(num);
	end; 
	writeln('estoy por aca');
	fileSize(Enteros);
end;

var 
	num:integer;
	Enteros:ArchivoDeEnteros;
	NombreFisico: string[20];
begin
	writeln ('ingrese nombre disico');
	readln(NombreFisico);
	assign (Enteros,NombreFisico);
	rewrite(Enteros);
	CargarArchivos(Enteros,num);
	Filesize(Enteros);
	while Not eof(Enteros) do begin 
		write (Enteros,num); 
		writeln (num);
	end;
	close(Enteros); 
End.
