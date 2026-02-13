library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity AJ_barrel_shifter_structural is
	Port (X 		: in std_logic_vector (3 downto 0);
			sel 	: in std_logic_vector (1 downto 0);
			Y		: out std_logic_vector (3 downto 0));
end AJ_barrel_shifter_structural;

architecture structural of AJ_barrel_shifter_structural is

    component MUX_structural
        port(
            I0  : in  std_logic;
            I1  : in  std_logic;
            SEL : in  std_logic;
            Z   : out std_logic
        );
    end component;

    signal temp : std_logic_vector(3 downto 0);

begin

    m1_0 : MUX_structural port map (I0 => data_in(0), I1 => data_in(2), SEL => control(1), Z => temp(0));
    m1_1 : MUX_structural port map (I0 => data_in(1), I1 => data_in(3), SEL => control(1), Z => temp(1));
    m1_2 : MUX_structural port map (I0 => data_in(2), I1 => data_in(0), SEL => control(1), Z => temp(2));
    m1_3 : MUX_structural port map (I0 => data_in(3), I1 => data_in(1), SEL => control(1), Z => temp(3));

    m2_0 : MUX_structural port map (I0 => temp(0), I1 => temp(3), SEL => control(0), Z => data_out(0));
    m2_1 : MUX_structural port map (I0 => temp(1), I1 => temp(0), SEL => control(0), Z => data_out(1));
    m2_2 : MUX_structural port map (I0 => temp(2), I1 => temp(1), SEL => control(0), Z => data_out(2));
    m2_3 : MUX_structural port map (I0 => temp(3), I1 => temp(2), SEL => control(0), Z => data_out(3));

end structural;
