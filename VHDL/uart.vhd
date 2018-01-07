
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY uart IS
Port ( clk : in STD_LOGIC;
                start : in STD_LOGIC;
					 rx: in STD_LOGIC;
					 tx: out STD_LOGIC;
					 ledout : out STD_LOGIC_VECTOR (9 downto 0)
               
               );
END uart;
ARCHITECTURE behavior OF uart IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT uart_mod
    PORT(
        I_clk : IN  std_logic;
        I_clk_baud_count : in STD_LOGIC_VECTOR (15 downto 0);
        I_reset : IN  std_logic;
        I_txData : IN  std_logic_vector(7 downto 0);
        I_txSig : IN  std_logic;
        O_txRdy : OUT  std_logic;
        O_tx : OUT  std_logic;
        I_rx : in STD_LOGIC;
        I_rxCont: in STD_LOGIC;
        O_rxData : out STD_LOGIC_VECTOR (7 downto 0);
        O_rxSig : out STD_LOGIC;
        O_rxFrameError : out STD_LOGIC
        );
    END COMPONENT;
    

   --Inputs
   signal I_txData : std_logic_vector(7 downto 0) := (others => '0');
   signal I_txSig : std_logic := '0';
	signal I_reset :std_LOGIC:='0';
	signal I_rx : std_logic := '0';
   signal I_rxCont : std_logic := '0';
  --Outputs
   signal O_txRdy : std_logic;
	signal O_rxData : std_logic_vector(7 downto 0) := (others => '0');
   signal O_rxFrameError : std_logic;
signal O_rxSig:std_logic :='0';
   -- Clock period definitions
   constant I_clk_period : time := 20 ns;
 signal last_msg_valid:std_LOGIC:='0';
 signal new_message:std_LOGIC:='0';
 signal last_msg:std_logic_vector(7 downto 0) := (others => '0');
BEGIN
 
  -- Instantiate the Unit Under Test (UUT)
    uut: uart_mod PORT MAP (
        I_clk => clk,
        I_clk_baud_count => X"1458", -- 9600bps @ 50MHz I_clk
        I_reset => I_reset,
        I_txData => I_txData,
        I_txSig => I_txSig,
        O_txRdy => O_txRdy,
        O_tx => tx,
        I_rx => rx,
        I_rxCont => '1',
		  O_rxData => O_rxData,
          O_rxSig => O_rxSig,
        O_rxFrameError => O_rxFrameError
		  
    );

 loopback: process(clk, O_rxSig)
begin
  if rising_edge(clk) then
    if O_rxSig = '1' and last_msg_valid ='0' and new_message = '1' then
      last_msg <= O_rxData;
      last_msg_valid <= '1';
      new_message <= '0';
    elsif O_txRdy = '1' and I_txSig = '0' and last_msg_valid = '1' then
      I_txData <= last_msg;
      I_txSig <= '1';
    elsif I_txSig = '1' and O_txRdy = '0' and last_msg_valid = '1' then
      I_txSig <= '0';
      last_msg_valid <= '0';
    elsif O_rxSig = '0' then
      new_message <= '1';
    end if; 
  end if;
end process;
END;