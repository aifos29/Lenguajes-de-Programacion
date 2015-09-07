with Gnat.IO;use GNAT.IO;


procedure hello is
   T:Integer:=31;
   --Lista donde estarán los valores--
   type Prueba is array(1..3) of Integer;
      --Lista con los estados--
   type Valores is array (1..T) of Integer;
   Cero:Prueba:=(0,0,0);
   Uno:Prueba:=(0,0,1);
   Dos:Prueba:=(0,1,0);
   Tres:Prueba:=(0,1,1);
   Cuatro:Prueba:=(1,0,0);
   Cinco:Prueba:=(1,0,1);
   Seis:Prueba:=(1,1,0);
   Siete:Prueba:=(1,1,1);
   Binario: array(1..8) of Integer:=(0,0,0,1,1,1,1,0);


   function Comparar_Vecinos(A:Prueba;B:Integer) return Integer is
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



   Estado_Actual:Valores;
   Cambio:Valores;

   P:Integer;


   --Enteró para los ciclos--
   I:Integer;
M:Integer;

   N:Integer:=3;
   Trio:Prueba:=(0,0,1);
begin
     for P in 1..T loop
      Estado_Actual(P):=0;
      Cambio(P):=0;
   end loop;

   Estado_Actual((T/2)+1):=1;
   for I in 1..T loop
      Put(Estado_Actual(I));
   end loop;

   for M in 1..(T/2) loop
   Trio(3):=Estado_Actual(T);
   Trio(2):=Estado_Actual(T);
   Trio(1):=Estado_Actual(T-1);
   Cambio(T):=Comparar_Vecinos(Trio,3);



   Trio(3):=Estado_Actual(2);
   Trio(2):=Estado_Actual(1);
   Trio(1):=Estado_Actual(T);
   Cambio(1):=Comparar_Vecinos(Trio,3);

   for I in 2..(T-1) loop
         Trio(1):=Estado_Actual(I-1);
         Trio(2):=Estado_Actual(I);
         Trio(3):=Estado_Actual(I+1);
      Cambio(I):=Comparar_Vecinos(Trio,3);
   end loop;

   --Ada.Text_IO.Put_Line(" ");
    New_Line;
      for I in 1..T loop
      Put(Cambio(I));
    end loop;

            Estado_Actual:=Cambio;
               For P in 1..T loop
                 Cambio(P):=0;
            end loop;
   end loop;


end hello;




