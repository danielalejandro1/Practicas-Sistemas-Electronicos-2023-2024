library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity funciones2_tb is
--  Port ( );
end funciones2_tb;

architecture tb of funciones2_tb is

    component    funciones2
        port (a  : in std_logic;
              b  : in std_logic;
              c  : in std_logic;
              d  : in std_logic;
              f1 : out std_logic;
              f2 : out std_logic);
     
     end component;
     
     signal a   : std_logic := '0';
     signal b   : std_logic := '0';
     signal c   : std_logic := '0';
     signal d   : std_logic := '0';
     signal f1  : std_logic;
     signal f2  : std_logic;
    
     
     constant Tb_semiPeriod : time := 10ns;
     
     signal TbSimEnded : std_logic := '0';
     
begin

    dut : funciones2
    port map (a  => a,
              b  => b,
              c  => c,
              d  => d,
              f1 => f1,
              f2 => f2);
             
              
d <= not d after Tb_semiPeriod  when TbSimEnded /= '1' else '0';
c <= not c after Tb_semiPeriod  when TbSimEnded /= '1' else '0';
b <= not b after Tb_semiPeriod  when TbSimEnded /= '1' else '0';
a <= not a after Tb_semiPeriod  when TbSimEnded /= '1' else '0';

    TbSimEnded <= '1' after 16 * Tb_semiPeriod;

end tb;