----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.04.2021 10:06:16
-- Design Name: 
-- Module Name: top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    port(
        CLK100MHZ     : in  std_logic;
        BTNC          : in  std_logic;
        LED16_R       : out std_logic;
        LED16_G       : out std_logic;
        LED16_B       : out std_logic;
        LED17_R       : out std_logic;
        LED17_G       : out std_logic;
        LED17_B       : out std_logic
    );
end top;

------------------------------------------------------------------------
-- Architecture body for top level
------------------------------------------------------------------------
architecture Behavioral of top is

begin
    --------------------------------------------------------------------
    -- Instance (copy) of tlc entity
    tlc : entity work.tlc
        port map(
            clk      => CLK100MHZ,
            reset    => BTNC,
            --- WRITE YOUR CODE HERE
            south_o(0) => LED16_R,
            south_o(1) => LED16_G, 
            south_o(2) => LED16_B, 
            west_o(0)  => LED17_R,
            west_o(1)  => LED17_G, 
            west_o(2)  => LED17_B 
        );

end architecture Behavioral;
