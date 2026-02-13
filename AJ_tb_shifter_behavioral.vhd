library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AJ_tb_shifter_behavioral is
end tb_mux_behavioral;

architecture tb of tb_mux_behavioral is

    component firstname_lastname_MUX_behavioral
        port(
            A : in  std_logic;
            B : in  std_logic;
            S : in  std_logic;
            Y : out std_logic
        );
    end component;

    signal A_sig, B_sig, S_sig, Y_sig : std_logic;

begin

    DUT: firstname_lastname_MUX_behavioral
        port map (
            A => A_sig,
            B => B_sig,
            S => S_sig,
            Y => Y_sig
        );

    process
    begin
        A_sig <= '0'; B_sig <= '0'; S_sig <= '0'; wait for 10 ns;
        assert (Y_sig = '0') report "Fail: S=0 A=0 B=0" severity error;

        A_sig <= '1'; B_sig <= '0'; S_sig <= '0'; wait for 10 ns;
        assert (Y_sig = '1') report "Fail: S=0 A=1 B=0" severity error;

        A_sig <= '0'; B_sig <= '1'; S_sig <= '1'; wait for 10 ns;
        assert (Y_sig = '1') report "Fail: S=1 A=0 B=1" severity error;

        A_sig <= '1'; B_sig <= '0'; S_sig <= '1'; wait for 10 ns;
        assert (Y_sig = '0') report "Fail: S=1 A=1 B=0" severity error;

        assert false report "Test completed." severity note;
        wait;
    end process;

end tb;
