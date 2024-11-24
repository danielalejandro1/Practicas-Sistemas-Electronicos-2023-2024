library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sistema_tb is
--  Port ( );
end sistema_tb;

architecture Behavioral of sistema_tb is

    component sistema
        port (clk   :  in std_logic;
              ce    :  in std_logic;
              reset :  in std_logic;
              count :  out std_logic_vector (3 downto 0);
              led   :  out std_logic_vector (6 downto 0));
    end component;
    
    signal clk   : std_logic := '0';
    signal ce    : std_logic := '0';
    signal reset : std_logic := '0';
    signal count : std_logic_vector (3 downto 0);
    signal led   : std_logic_vector (6 downto 0);
    
begin

    dut : sistema
    port map    (clk   => clk,
                 ce    => ce,
                 reset => reset,
                 count => count,
                 led   => led);
    
    -- Clock generation
    clk <= not clk after 10ns;
    
    stimulti : process
    begin
        -- EDIT Adapt initialization as needed
        ce <= '0'; reset <= '1';
        wait for 20 ns;
        reset <= '0';
        wait for 20 ns;
        ce <= '1';
        wait for 180 ns;
        reset <= '1';
        wait;
     end process;

end Behavioral;
