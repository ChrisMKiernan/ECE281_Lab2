--------------------------------------------------------------------------------
-- Company: USAFA
-- Engineer:  Chris Kiernan
--
-- Create Date:   20:30:12 02/09/2014
-- Design Name:   1 bit full adder
-- Module Name:   C:/Users/C16Christopher.Kiern/Documents/ECE 281/Labs/Lab2/Lab2_Kiernan/onebit_fulladd_testbench.vhd
-- Project Name:  Lab2_Kiernan
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: onebit_fulladd
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY onebit_fulladd_testbench IS
END onebit_fulladd_testbench;
 
ARCHITECTURE behavior OF onebit_fulladd_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT onebit_fulladd
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         Ci : IN  std_logic;
         S : OUT  std_logic;
         Co : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal Ci : std_logic := '0';

 	--Outputs
   signal S : std_logic;
   signal Co : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 --  constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: onebit_fulladd PORT MAP (
          A => A,
          B => B,
          Ci => Ci,
          S => S,
          Co => Co
        );

   -- Clock process definitions
 --  <clock>_process :process
 --  begin
	--	<clock> <= '0';
	--	wait for <clock>_period/2;
	--	<clock> <= '1';
	--	wait for <clock>_period/2;
 --  end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		A <= '0';
		B <= '0';
		Ci <= '0';
		wait for 100 ns;
		assert S='0' report "Sum Fail" severity error;
		assert Co='0' report "Carry Fail" severity error;
		
		
		A <= '0';
		B <= '0';
		Ci <= '1';
		wait for 100 ns;
		assert S='1' report "Sum Fail" severity error;
		assert Co='0' report "Carry Fail" severity error;
		

		A <= '0';
		B <= '1';
		Ci <= '0';
		wait for 100 ns;
		assert S='1' report "Sum Fail" severity error;
		assert Co='0' report "Carry Fail" severity error;
		

		A <= '0';
		B <= '1';
		Ci <= '1';
		wait for 100 ns;
		assert S='0' report "Sum Fail" severity error;
		assert Co='1' report "Carry Fail" severity error;
		

		A <= '1';
		B <= '0';
		Ci <= '0';
		wait for 100 ns;
		assert S='1' report "Sum Fail" severity error;
		assert Co='0' report "Carry Fail" severity error;
		

		A <= '1';
		B <= '0';
		Ci <= '1';
		wait for 100 ns;
		assert S='0' report "Sum Fail" severity error;
		assert Co='1' report "Carry Fail" severity error;
		

		A <= '1';
		B <= '1';
		Ci <= '0';
		wait for 100 ns;
		assert S='0' report "Sum Fail" severity error;
		assert Co='1' report "Carry Fail" severity error;
		

		A <= '1';
		B <= '1';
		Ci <= '1';
		wait for 100 ns;
		assert S='1' report "Sum Fail" severity error;
		assert Co='1' report "Carry Fail" severity error;
		


      wait;
   end process;

END;
