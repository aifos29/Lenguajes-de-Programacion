with Gnat.IO;use GNAT.IO;
with  Automata;use Automata;

procedure Texto is

   N:Integer:=257;
   T:Integer;




begin
    Put("Bienvenido a su automata celular");
   New_Line;
      --Ciclo para evitar que el n�mero ingresado sea mayor que 256--
   while N>255 loop
      Put("Podr�a ingresar el n�mero que desea");
      Get(N);
   end loop;

   --Solicitud de tiempo--
   Put("Ingrese el tiempo: ");
   Get(T);
   --Toma el tiempo, lo multiplica por dos para obtener el tama�o y le suma uno para realizar los calculos de manera mas exacta
   T:=(T*2)+1;

   Proceso(T,N);

   New_Line;
   Put("Para poder visualizar su automata le recomendamos usar Gimp el cual es compatible con Windows, Linux y MacOS. Si desea m�s opciones puede visitar el siguiente sitio web http://www.filetips.org/how-to-open/pnm.html");


end
Texto;
