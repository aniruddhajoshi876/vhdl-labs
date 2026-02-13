library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity david_huang_MUX_structural is
    Port ( A : in std_logic;
           B : in std_logic;
           S : in std_logic;
           Y : out std_logic);
end AJ_mux_structural;

architecture structural of AJ_mux_structural is
    --signals
    signal nS : std_logic; --NOT S
    signal t0 : std_logic;
    signal t1 : std_logic;

begin

    nS <= not S;
    t0 <= A and nS; -- S=0 and A
    t1 <= B and S;  --S=1 and B
    Y <= t0 or t1;

end structural;
