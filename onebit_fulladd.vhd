----------------------------------------------------------------------------------
-- Company: USAFA
-- Engineer: Chris Kiernan
-- 
-- Create Date:    20:20:23 02/09/2014 
-- Design Name: 1 bit fill adder component
-- Module Name:    onebit_fulladd - Behavioral 
-- Project Name: 4 bit adder
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

entity onebit_fulladd is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Ci : in  STD_LOGIC;
           S : out  STD_LOGIC;
           Co : out  STD_LOGIC);
end onebit_fulladd;

architecture Behavioral of onebit_fulladd is

signal A_N, B_N, C_N, D, E, F, G, H, I, J : STD_LOGIC;

begin

A_N <= not A;
B_N <= not B;
C_N <= not Ci;
D <= A_N and B_N and Ci;
E <= A_N and B and C_N;
F <= A and B and Ci;
G <= A and B_N and C_N;
H <= B and Ci;
I <= A and B;
J <= A and Ci;
S <= D or E or F or G;
Co <= H or I or J;

end Behavioral;

