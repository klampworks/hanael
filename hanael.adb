with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;
with Randomise; use Randomise;

procedure Main is

  C : Character;
  S : R_String.Bounded_String;
  Are_Inside_Tag : Boolean := False;

begin

  Ada.Text_IO.Put_Line("Fuck you");

  while not End_Of_File loop

    Get_Immediate(C);

    if Are_Inside_Tag then
      if C in '<'|'"' then
        Are_Inside_Tag := False;

        Randomise_String(S);
        Put(R_String.To_String(S));
        S := R_String.To_Bounded_String("");

       Put(C);
      else
        R_String.Append(S, C);
      end if;

    elsif C in '>'|'"' then
      Are_Inside_Tag := True;
      S := R_String.To_Bounded_String("");
       Put(C);
    else
      Put(C);
    end if;

  end loop;

end Main;
