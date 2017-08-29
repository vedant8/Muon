ghdl -i muontracker.vhd
ghdl -i Testbench.vhd
ghdl -m Testbench
./testbench --vcd=out.vcd
