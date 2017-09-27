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
signal ctr_left:integer:=0;
signal ctr_right:integer:=0;
signal ctr_upper:integer:=0;
signal ctr_lower:integer:=0;
signal hit:std_logic:='0';
signal track_flag_1:integer:=0;
signal hit_array_x:arr_type_2;
signal hit_array_y:arr_type_2;
signal path_dir_array:arr_type_2;
signal path_dir_array2:integer:=0;
signal sample_array: arr_type_1;
signal x_n:integer:=0;
signal y_n:integer:=0;
signal x_n1:integer:=0;
signal y_n1:integer:=0;
signal n:integer:=0;

signal path_dir_array_d0:integer:=0;
signal path_dir_array_d1:integer:=0;
signal path_dir_array_d2:integer:=0;
signal path_dir_array_d3:integer:=0;
signal path_dir_array_d4:integer:=0;
signal path_dir_array_d5:integer:=0;
signal path_dir_array_d6:integer:=0;
signal path_dir_array_d7:integer:=0;
signal path_dir_array_d8:integer:=0;
signal path_dir_array_d9:integer:=0;
signal path_dir_array_d10:integer:=0;
signal path_dir_array_d11:integer:=0;
signal path_dir_array_d12:integer:=0;
signal path_dir_array_d13:integer:=0;
signal path_dir_array_d14:integer:=0;



	signal count : integer := 0;
	signal count_old : integer := 0;
	signal matrix_size : integer := 7;
	signal i : integer := 0; 
	signal j : integer := 0;
	--variable u : integer := hit_array_x(0); 
	--variable v : integer := hit_array_y(0);
begin
--populating the matrix

sample_array(0,0)<='0';
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
path_dir_array2 <= path_dir_array(6);
process(clk)
begin
path_dir_array_d0 <= path_dir_array(0);
path_dir_array_d1 <= path_dir_array(1);
path_dir_array_d2 <= path_dir_array(2);
path_dir_array_d3 <= path_dir_array(3);
path_dir_array_d4 <= path_dir_array(4);
path_dir_array_d5 <= path_dir_array(5);
path_dir_array_d6 <= path_dir_array(6);
path_dir_array_d7 <= path_dir_array(7);
path_dir_array_d8 <= path_dir_array(8);
path_dir_array_d9 <= path_dir_array(9);
path_dir_array_d10 <= path_dir_array(10);
path_dir_array_d11 <= path_dir_array(11);
path_dir_array_d12 <= path_dir_array(12);
path_dir_array_d13 <= path_dir_array(13);
path_dir_array_d14 <= path_dir_array(14);

if hit='0' then
	if left_bound='1' then
		if sample_array(0,ctr_left) = '1' then
			x_n<=0;
			y_n<=ctr_left;
			hit<='1';
		end if;
		ctr_left<=ctr_left+1;

	elsif right_bound='1' then
		if sample_array(7,ctr_right) = '1' then
			x_n<=7;
			y_n<=ctr_right;
			hit<='1';
		end if;
		ctr_right<=ctr_right+1;

	elsif up_bound='1' then
		if sample_array(ctr_upper,7) = '1' then
			y_n<=7;
			x_n<=ctr_upper;
			hit<='1';
		end if;
		ctr_upper<=ctr_upper+1;

	elsif lower_bound='1' then
		if sample_array(ctr_lower,0) = '1' then
			y_n<=0;
			x_n<=ctr_lower;
			hit<='1';
		end if;
		ctr_lower<=ctr_lower+1;	
end if;
end if;	
end process;
process(clk)
begin 
hit_array_x(0) <= x_n;
hit_array_y(0) <= y_n;
 

if hit='1' and track_flag_1=0 then
	  if x_n=0 then
		if y_n=0 then
			 if sample_array(1,0)= '1' then
			 	x_n1<=1;
			 	y_n1<=0;
			 	path_dir_array(0)<=0;
			 	track_flag_1<=1;
			 elsif	sample_array(x_n+1,y_n+1)= '1' then
			 	x_n1<=1;
			 	y_n1<=1;
			 	path_dir_array(0)<=1;
			 	track_flag_1<=1;
			 elsif sample_array(0,1)= '1' then
			 	x_n1<=0;
			 	y_n1<=1;
			 	path_dir_array(0)<=2;
			 	track_flag_1<=1;
			 end if;	
		elsif y_n=7 then
			 if sample_array(0,6)= '1' then
			 	x_n1<=0;
			 	y_n1<=6;
			 	path_dir_array(0)<=3;
			 	track_flag_1<=1;
			 elsif	sample_array(1,6)= '1' then
			 	x_n1<=1;
			 	y_n1<=6;
			 	path_dir_array(0)<=4;
			 	track_flag_1<=1;
			 elsif sample_array(1,7)= '1' then
			 	x_n1<=1;
			 	y_n1<=7;
			 	path_dir_array(0)<=0;
			 	track_flag_1<=1;
			 end if	;
		else 
			 if sample_array(0,hit_array_y(0)+1)='1' then
			  x_n1<=0;
			  y_n1<=hit_array_y(0)+1;
			  path_dir_array(0)<=2;
			  track_flag_1<=1;
			 elsif sample_array(1,hit_array_y(0)+1)='1' then
			  x_n1<=1;
			  y_n1<=hit_array_y(0)+1;
			  path_dir_array(0)<=1;
			  track_flag_1<=1;
			 elsif sample_array(1,hit_array_y(0))='1' then
			  x_n1<=1;
			  y_n1<=hit_array_y(0);
			  path_dir_array(0)<=0; 
			  track_flag_1<=1;
			 elsif sample_array(1,hit_array_y(0)-1)='1' then
			  x_n1<=1;
			  y_n1<=hit_array_y(0)-1;
			  track_flag_1<=1;
			  path_dir_array(0)<=4;
			 elsif sample_array(0,hit_array_y(0)-1)='1' then
			  x_n1<=0;
			  y_n1<=hit_array_y(0)-1;
			  path_dir_array(0)<=3;
			  track_flag_1<=1;
			 end if;
		end if;
	  elsif	 x_n=7 then  
		    if y_n=0 then
				 if sample_array(6,0)= '1' then
				 	x_n1<=6;
				 	y_n1<=0;
				 	path_dir_array(0)<=6;
				 	track_flag_1<=1;
				 elsif	sample_array(6,1)= '1' then
				 	x_n1<=6;
				 	y_n1<=1;
				 	path_dir_array(0)<=7;
				 	track_flag_1<=1;
				 elsif sample_array(7,1)= '1' then
				 	x_n1<=7;
				 	y_n1<=1;
				 	path_dir_array(0)<=2;
				 	track_flag_1<=1;
				 end if;	
		    elsif y_n=7 then
				 if sample_array(7,6)= '1' then
				 	x_n1<=7;
				 	y_n1<=6;
				 	path_dir_array(0)<=3;
				 	track_flag_1<=1;
				 elsif	sample_array(6,6)= '1' then
				 	x_n1<=6;
				 	y_n1<=6;
				 	path_dir_array(0)<=5;
				 	track_flag_1<=1;
				 elsif sample_array(6,7)= '1' then
				 	x_n1<=6;
				 	y_n1<=7;
				 	path_dir_array(0)<=6;
				 	track_flag_1<=1;
				 end if	;
		     else
				 if sample_array(7,hit_array_y(0)+1)='1' then
				  x_n1<=7;
				  y_n1<=hit_array_y(0)+1;
				  path_dir_array(0)<=2;
				  track_flag_1<=1;
				 elsif sample_array(6,hit_array_y(0)+1)='1' then
				  x_n1<=6;
				  y_n1<=hit_array_y(0)+1;
				  path_dir_array(0)<=7;
				  track_flag_1<=1;
				 elsif sample_array(6,hit_array_y(0))='1' then
				  x_n1<=6;
				  y_n1<=hit_array_y(0);
				  path_dir_array(0)<=6; 
				  track_flag_1<=1;
				 elsif sample_array(6,hit_array_y(0)-1)='1' then
				  x_n1<=6;
				  y_n1<=hit_array_y(0)-1;
				  path_dir_array(0)<=5;
				  track_flag_1<=1;
				 elsif sample_array(7,hit_array_y(0)-1)='1' then
				  x_n1<=0;
				  y_n1<=hit_array_y(0)-1;
				  path_dir_array(0)<=3;
				  track_flag_1<=1;
				 end if;
			end if;  				
	end if;
end if;

end process;
end Behavioral;

