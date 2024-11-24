library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity contador is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           ce : in STD_LOGIC;
           count : out STD_LOGIC_VECTOR (3 downto 0));
end contador;

architecture Behavioral of contador is

    component ffD_reset
        port (clk   : in std_logic;
              ce    : in std_logic;
              reset : in std_logic;
              d     : in std_logic;
              q     : out std_logic);
    end component;
    component ffT_preset
        port (clk   : in std_logic;
              ce    : in std_logic;
              preset : in std_logic;
              t     : in std_logic;
              q     : out std_logic);
    end component;
    component ffT_reset
        port (clk   : in std_logic;
              ce    : in std_logic;
              reset : in std_logic;
              t     : in std_logic;
              q     : out std_logic);
    end component;
    signal qa, qb, qc, qd: std_logic;
    signal da, tb, tc, dd: std_logic;
    
begin

    unitA : ffD_reset
        port map    (clk  => clk,
                    ce    => ce,
                    reset => reset,
                    d     => da,
                    q     => qa);
    unitB : ffT_preset
        port map    (clk  => clk,
                    ce    => ce,
                    preset => reset,
                    t     => tb,
                    q     => qb);
    unitC : ffT_reset
        port map    (clk  => clk,
                    ce    => ce,
                    reset => reset,
                    t     => tc,
                    q     => qc);
    unitD : ffD_reset
        port map    (clk  => clk,
                    ce    => ce,
                    reset => reset,
                    d     => dd,
                    q     => qd);
                    
    dd <= (qc or qd or not qb) and (qd or not qa) and (not qc or not qd or not qb) and (qc or not qd or qa or qb);
    tc <= (not qb) and (qc or not qd);
    tb <= (not qa and not qc and not qd) or (not qa and qb and qc) or (qa);
    da <= (not qa and not qb and qd);
    
    count <= qa & qb & qc & qd; -- concatenación
--  count(0) <= qd;
--  count(1) <= qc;
--  count(2) <= qb;
--  count(3) <= qa;

end Behavioral;