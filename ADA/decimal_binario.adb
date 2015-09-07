--Conversor de Decimal a Binario--
with Gnat.IO;use GNAT.IO;

procedure Decimal_Binario is
   A:array(1..8) of Integer:=(0,0,0,0,0,0,0,0);

   I:Integer:=8;
   N:Integer:=30;
   K:Integer;

begin

   while N>0 loop
      A(I):= N mod 2;
      N:= N/2;
      I:=I-1;
   end loop;

   A(I):=N;

   for K in 1..8 loop
      Put(A(K));
    end loop;

end Decimal_Binario;
