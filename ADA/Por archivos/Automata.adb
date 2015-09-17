with Text_IO,Sequential_IO,Direct_IO;
use Text_IO;
with Automata;

package body Automata is
procedure Proceso(T:Integer;B:Integer) is
   --Declaracion de tipos
   --T:Integer;
   --Tipos de estados y los objetos asociados a este--
   type Estado is array(1..3) of Integer;
   Cero:Estado:=(0,0,0);
   Uno:Estado:=(0,0,1);
   Dos:Estado:=(0,1,0);
   Tres:Estado:=(0,1,1);
   Cuatro:Estado:=(1,0,0);
   Cinco:Estado:=(1,0,1);
   Seis:Estado:=(1,1,0);
   Siete:Estado:=(1,1,1);
    Trio:Estado:=(0,0,0);--Variable donde estarán los vecinos. Por ende es un estado cambiante
   --Tipo valor. Y las variables que lo usa. Es decir Estado_Actual y Cambio
   type Valores is array (1..T) of Integer;
   Estado_Actual:Valores;
   Cambio:Valores;
   --Variables para realizar la conversión de decimal a binario--
   Binario: array(1..8) of Integer:=(0,0,0,0,0,0,0,0);
   X:Integer:=B;
   V:Integer:=8;
  --Enteros para los ciclos.Funcionan como indices--
   I:Integer;
   M:Integer;
   N:Integer;
   P:Integer;
      --Imagen--
      Imagen:File_Type;
     Guardar:String:=Integer'Image(0);
   --Funciones que utiliza el programa--
   --Recibe una tripleta, que son los valores de los vecinos
   --y busca una similitud con los array de estados--
   --Cuando encuentra el que es, revisa en el array del binario si corresponde a dicho campo
   --de ser así, retorna un uno. Si la posicion seleccionada no es un valor devuelve un 0
   function Comparar_Vecinos(A:Estado) return Integer is
   begin

      if (A=Cero) then
         if (Binario(8) = 1) then
         return 1;
         end if;
      end if;
      if (A=Uno) then
         if (Binario(7) = 1) then
         return 1;
         end if;
      end if;
      if (A=Dos) then
         if (Binario(6) = 1) then
         return 1;
         end if;
      end if;
      if (A=Tres) then
         if (Binario(5) = 1) then
         return 1;
         end if;
      end if;
      if (A=Cuatro) then
         if (Binario(4) = 1) then
         return 1;
         end if;
      end if;
      if (A=Cinco) then
         if (Binario(3) = 1) then
         return 1;
         end if;
      end if;
      if (A=Seis) then
         if (Binario(2) = 1) then
         return 1;
         end if;
      end if;
      if (A=Siete) then
         if (Binario(1) = 1) then
         return 1;
         end if;
         end if;
   return 0;

  end Comparar_Vecinos;
   --Utilizando X= Valor ingresado por el usuario
   --Utilizando V= V es el número 8, que es la extención del array de binario
   --Hasta que X=0, va a realizar un ciclo donde va a sacar el residuo de X y lo va a asignar a la
   --posicion de binario que corresponde. Luego divide el numero entre dos para obtener el entero.
   --Finalmente resta 1 a V para poder asignar la siguiente posición
   --Cuando termina el ciclo, le asigna a binario el cociente de x, ya se 0 o 1
   function ConvertDecimal return Integer is
   begin
      while X>1 loop
      Binario(V):= X mod 2;
      X:= X/2;
      V:=V-1;
   end loop;

      Binario(V):=X;
      return x;


   end ConvertDecimal;
begin

   P:=ConvertDecimal;
      --Abre variable para la imagen--
      Create (Imagen,out_File,"Automata.pnm");
      Put(Imagen,"P1");
      Put(Imagen,ASCII.LF);
      Put(Imagen,"# feep.pbm");
      Put(Imagen,ASCII.LF);
      Put(Imagen,Integer'Image(T) & Integer'Image(T/2));
      Put(Imagen,ASCII.LF);


   --Inicializa los ciclos de 1 a T con 0.
   for P in 1..T loop
      Estado_Actual(P):=0;
      Cambio(P):=0;
   end loop;
   --A la mitad del arreglo más uno le agrega un 1
   Estado_Actual((T/2)+1):=1;
   --Imprime el estado actual;
      for I in 1..T loop
      Guardar:=Integer'Image(Estado_Actual(I));
      Put(Imagen,Guardar);
   end loop;
   --Realiza el ciclo la cantidad de veces ingresadas por el usuario
   for M in 1..(T/2) loop
      --Toma los dos últimos valores del array y el primer valor. Esto para poder completar los vecinos y
      --Simular una cinta infinita
   Trio(3):=Estado_Actual(1);
   Trio(2):=Estado_Actual(T);
   Trio(1):=Estado_Actual(T-1);
   Cambio(T):=Comparar_Vecinos(Trio);
      --Toma los dos primeros valores del array y el ultimo valor. Esto para poder completar los vecinos y
      --Simular una cinta infinita
   Trio(3):=Estado_Actual(2);
   Trio(2):=Estado_Actual(1);
   Trio(1):=Estado_Actual(T);
   Cambio(1):=Comparar_Vecinos(Trio);
      --Ciclo para asignar los valores del resto de los vecinos
      --Inicia en la posición dos, porque ya se evaluo la uno y termina en la posicion T-1 porque ya se evaluo el final
   for I in 2..(T-1) loop
         Trio(1):=Estado_Actual(I-1);
         Trio(2):=Estado_Actual(I);
         Trio(3):=Estado_Actual(I+1);
      Cambio(I):=Comparar_Vecinos(Trio);
   end loop;

   --Muestra el nuevo array
    Put(Imagen,ASCII.LF);
      for I in 1..T loop
      Put(Imagen,Integer'Image(Cambio(I)));
    end loop;
      --Reemplazo Estado_Actual por cambio
      --Y reinicio cambio;
            Estado_Actual:=Cambio;
               For P in 1..T loop
                 Cambio(P):=0;
            end loop;
   end loop;

end Proceso;
end Automata;




