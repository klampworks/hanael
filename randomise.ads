with Ada.Strings.Bounded;

package Randomise is

  package R_String is new Ada.Strings.Bounded.Generic_Bounded_Length(80);
  procedure Randomise_String(S : in out R_String.Bounded_String);

end Randomise;
