----------------------------------------------------------------------------------
-- Company: USAFA
-- Engineer: Chris Kiernan
-- 
-- Create Date:    10:58:06 02/10/2014 
-- Design Name: 4-bit adder
-- Module Name:    Fourbit-adder - Structural 
-- Project Name: Lab 2
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Fourbit_adder is
    Port ( Ain : in  STD_LOGIC_VECTOR (3 downto 0);
           Bin : in  STD_LOGIC_VECTOR (3 downto 0);
			  Sub : in STD_LOGIC;
           Sum : out  STD_LOGIC_VECTOR (3 downto 0);
			  Over : out STD_LOGIC);
end Fourbit_adder;

architecture Structural of Fourbit_adder is

	component onebit_fulladd is
		port( A : in STD_LOGIC;
				B : in STD_LOGIC;
				Ci : in STD_LOGIC;
				S : out STD_LOGIC;
				Co : out STD_LOGIC);
		end component;
		signal C1, C2, C3, Cout : STD_LOGIC;
		signal B_N, B_Use : STD_LOGIC_VECTOR (3 downto 0);

begin

	B_N <= not Bin;

	With Sub Select
	B_Use <= Bin when '0',
				B_N when '1',
				Bin when others;
				
	Bit0: onebit_fulladd PORT MAP(Ain(0),B_Use(0),Sub,Sum(0),C1);
	Bit1: onebit_fulladd PORT MAP(Ain(1),B_Use(1),C1,Sum(1),C2);
	Bit2: onebit_fulladd PORT MAP(Ain(2),B_Use(2),C2,Sum(2),C3);
	Bit3: onebit_fulladd PORT MAP(Ain(3),B_Use(3),C3,Sum(3),Cout);
	
	Over <= Cout XOR C3;


end Structural;

