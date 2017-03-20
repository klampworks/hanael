with Ada.Characters.Handling; use Ada.Characters.Handling;
with Ada.Numerics.Discrete_Random;

package body Randomise is

  -- '0' to '9'
  subtype Numeric_Rand_Range is Integer range 48..57;
  package Numeric_Rand is new Ada.Numerics.Discrete_Random(Numeric_Rand_Range);
  Numeric_Gen : Numeric_Rand.Generator;
  Numeric_I : Numeric_Rand_Range;

  -- 'a' to 'z'
  subtype Alphabetic_Rand_Range is Integer range 97..122;
  package Alphabetic_Rand is new Ada.Numerics.Discrete_Random(
    Alphabetic_Rand_Range);
  Alphabetic_Gen : Alphabetic_Rand.Generator;
  Alphabetic_I : Alphabetic_Rand_Range;

  New_Char : Character;

  procedure Randomise_String(S : in out R_String.Bounded_String) is
  begin
    for C in R_String.To_String(S)'Range loop
      case R_String.Element(S, C) is
      when '0'..'9' =>
        Numeric_I := Numeric_Rand.Random(Numeric_Gen);
        New_Char := Character'Val(Numeric_I);
        R_String.Replace_Element(S, C, New_Char);
      when 'a'..'z' =>
        Alphabetic_I := Alphabetic_Rand.Random(Alphabetic_Gen);
        New_Char := Character'Val(Alphabetic_I);
        R_String.Replace_Element(S, C, New_Char);
      when 'A'..'Z' =>
        Alphabetic_I := Alphabetic_Rand.Random(Alphabetic_Gen);
        New_Char := To_Upper(Character'Val(Alphabetic_I));
        R_String.Replace_Element(S, C, New_Char);
      when others =>
        null;
      end case;
    end loop;
  end Randomise_String;

begin
  Numeric_Rand.Reset(Numeric_Gen);
  Alphabetic_Rand.Reset(Alphabetic_Gen);
end Randomise;
