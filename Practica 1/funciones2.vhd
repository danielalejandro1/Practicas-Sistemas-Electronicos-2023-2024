library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity funciones2 is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           c : in STD_LOGIC;
           d : in STD_LOGIC;
           f1 : out STD_LOGIC;
           f2 : out STD_LOGIC);
           
end funciones2;

architecture Behavioral of funciones2 is

begin

    f1 <= (not c and not d) or (not a and not d) or (a and not b and not c) or (a and b and c);
    f2 <= (not a and b and c) or (not a and not b and d) or (a and not b and not c and not d) or (a and b and not c and d);

end Behavioral;