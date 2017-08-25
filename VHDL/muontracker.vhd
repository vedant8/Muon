library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity muontracker is
     Port ( clk : in STD_LOGIC;
                start : in STD_LOGIC;
                reset : in STD_LOGIC
               );
end muontracker;
architecture Behavioral of muontracker is

type arr_type_1 is array (0 to 7, 0 to 7) of std_logic;
type arr_type_2 is array (0 to 31) of integer range 0 to 7;
signal left_bound:std_logic;
signal right_bound:std_logic;
signal up_bound:std_logic;
signal lower_bound:std_logic;
signal ctr_left:integer:=8;
signal ctr_right:integer:=8;
signal ctr_up:integer:=8;
signal ctr_lower:integer:=8;
signal hit_array_x:arr_type_2;
signal hit_array_y:arr_type_2;
signal sample_array: arr_type_1;
begin
--populating the matrix
sample_array(0,0)<='1';
sample_array(0,1)<='0';
sample_array(0,2)<='0';
sample_array(0,3)<='0';
sample_array(0,4)<='0';
sample_array(0,5)<='0';
sample_array(0,6)<='0';
sample_array(0,7)<='0';
	sample_array(1,0)<='0';
	sample_array(1,1)<='1';
	sample_array(1,2)<='0';
	sample_array(1,3)<='0';
	sample_array(1,4)<='0';
	sample_array(1,5)<='0';
	sample_array(1,6)<='0';
	sample_array(1,7)<='0';
sample_array(2,0)<='0';
sample_array(2,1)<='0';
sample_array(2,2)<='1';
sample_array(2,3)<='0';
sample_array(2,4)<='0';
sample_array(2,5)<='0';
sample_array(2,6)<='0';
sample_array(2,7)<='0';
	sample_array(3,0)<='0';
	sample_array(3,1)<='0';
	sample_array(3,2)<='0';
	sample_array(3,3)<='1';
	sample_array(3,4)<='0';
	sample_array(3,5)<='0';
	sample_array(3,6)<='0';
	sample_array(3,7)<='0';
sample_array(4,0)<='0';
sample_array(4,1)<='0';
sample_array(4,2)<='0';
sample_array(4,3)<='0';
sample_array(4,4)<='1';
sample_array(4,5)<='0';
sample_array(4,6)<='0';
sample_array(4,7)<='0';
	sample_array(5,0)<='0';
	sample_array(5,1)<='0';
	sample_array(5,2)<='0';
	sample_array(5,3)<='0';
	sample_array(5,4)<='0';
	sample_array(5,5)<='1';
	sample_array(5,6)<='0';
	sample_array(5,7)<='0';
sample_array(6,0)<='0';
sample_array(6,1)<='0';
sample_array(6,2)<='0';
sample_array(6,3)<='0';
sample_array(6,4)<='0';
sample_array(6,5)<='0';
sample_array(6,6)<='1';
sample_array(6,7)<='0';
	sample_array(7,0)<='0';
	sample_array(7,1)<='0';
	sample_array(7,2)<='0';
	sample_array(7,3)<='0';
	sample_array(7,4)<='0';
	sample_array(7,5)<='0';
	sample_array(7,6)<='0';
	sample_array(7,7)<='1';



left_bound<= sample_array(0,0) or sample_array(0,1) or sample_array(0,2) or sample_array(0,3) or sample_array(0,4) or sample_array(0,5) or sample_array(0,6) or sample_array(0,7);

right_bound<= sample_array(7,0) or sample_array(7,1) or sample_array(7,2) or sample_array(7,3) or sample_array(7,4) or sample_array(7,5) or sample_array(7,6) or sample_array(7,7);

lower_bound<= sample_array(0,0) or sample_array(1,0) or sample_array(2,0) or sample_array(3,0) or sample_array(4,0) or sample_array(5,0) or sample_array(6,0) or sample_array(7,0);

up_bound<= sample_array(7,7) or sample_array(6,7) or sample_array(5,7) or sample_array(4,7) or sample_array(3,7) or sample_array(2,7) or sample_array(1,7) or sample_array(0,7);
--first hit on left border
process(clk)
begin
if left_bound='1' then
	if sample_array(0,ctr_left) = '1' then
		hit_array_x(0)<=0;
		hit_array_y(0)<=ctr_left;
	end if;
	ctr_left<=ctr_left+1;

elsif right_bound='1' then
	if sample_array(7,ctr_right) = '1' then
		hit_array_x(0)<=7;
		hit_array_y(0)<=ctr_right;
	end if;
	ctr_right<=ctr_right+1;

elsif upper_bound='1' then
	if sample_array(ctr_upper,7) = '1' then
		hit_array_y(0)<=7;
		hit_array_x(0)<=ctr_upper;
	end if;
	ctr_upper<=ctr_upper+1;

elsif lower_bound='1' then
	if sample_array(ctr_lower,0) = '1' then
		hit_array_y(0)<=0;
		hit_array_x(0)<=ctr_lower;
	end if;
	ctr_lower<=ctr_lower+1;	
end process


end Behavioral;
