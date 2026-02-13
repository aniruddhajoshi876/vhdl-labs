library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity AJ_barrel_shifter_behavioral is
    Port (
        A : in  std_logic;
        B : in  std_logic;
        S : in  std_logic;
        Y : out std_logic
    );
end AJ_barrel_shifter_behavioral;

architecture behavioral of AJ_barrel_shifter_behavioral is
begin

    with S select
        Y <= A when '0',
             B when '1',
             '0' when others;

end behavioral;
