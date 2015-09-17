with Gnat.IO;use GNAT.IO;
with  Automata;use Automata;

procedure Texto is

   N:Integer:=257;
   T:Integer;




begin
    Put("Bienvenido a su automata celular");
   New_Line;
      --Ciclo para evitar que el número ingresado sea mayor que 256--
   while N>255 loop
      Put("Podría ingresar el número que desea");
      Get(N);
   end loop;

   --Solicitud de tiempo--
   Put("Ingrese el tiempo: ");
   Get(T);
   --Toma el tiempo, lo multiplica por dos para obtener el tamaño y le suma uno para realizar los calculos de manera mas exacta
   T:=(T*2)+1;

   Proceso(T,N);

   New_Line;
   Put("Para poder visualizar su automata le recomendamos usar Gimp el cual es compatible con Windows, Linux y MacOS. Si desea más opciones puede visitar el siguiente sitio web http://www.filetips.org/how-to-open/pnm.html");


end
Texto;
