LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Testbench IS 
END Testbench;

ARCHITECTURE behavior OF Testbench IS

    COMPONENT muontracker
     Port ( clk : in STD_LOGIC;
                start : in STD_LOGIC;
                reset : in STD_LOGIC
               );
    END COMPONENT;

   signal clk : std_logic := '0';
   signal start : std_logic := '1';
   signal reset : std_logic := '0';
   constant clk_period : time := 1 ns;


BEGIN

   dut1:muontracker port map (clk=>clk,start=>start,reset=>reset);	       

   -- Clock process definitions( clock with 50% duty cycle is generated here.
   clk_process:process
   begin
        clk <= '0';
        wait for clk_period/2;  --for 0.5 ns signal is '0'.
        clk <= '1';
        wait for clk_period/2;  --for next 0.5 ns signal is '1'.
   end process;

END;
