 program ejercio2;
 type
	ArchivoDeEnteros= file of integer;
procedure RecorrerArchivo(var Enteros:ArchivoDeEnteros; var menores,suma,cant:integer);
var num:integer;
begin 
	while not eof(Enteros) do begin 
		read(Enteros,num);
		if(num < 1500)then  menores:=menores+1;
		suma:=suma + num;
		cant:= cant +1;
	end;
end;
var 
	Enteros: ArchivoDeEnteros; NomFisico:string[20];
	suma,menores,cant:integer;  prom:real;
begin
	writeln ('ingrese nombre fisico');
	readln(NomFisico);
	assign (Enteros,NomFisico);
	reset(Enteros);
	menores:=0; suma:=0; prom:= 0; 
	RecorrerArchivo(Enteros,menores,suma,cant);
	writeln('la cantidad de numeros menores a 1500: ', menores);
	prom:= suma div cant;
	writeln('el promedio de los numero del archiso: ', prom); 
end.
