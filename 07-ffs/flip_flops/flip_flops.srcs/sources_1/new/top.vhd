----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.03.2021 10:58:45
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
    Port ( 
        BTNU : in  STD_LOGIC;
        BTNC : in  STD_LOGIC;
        SW   : in  STD_LOGIC_VECTOR (1 - 1 downto 0);
        LED  : out STD_LOGIC_VECTOR (4 - 1 downto 0)
    );
end top;

------------------------------------------------------------------------
-- Architecture body for top level
------------------------------------------------------------------------
architecture Behavioral of top is

    -- Internal signals between flip-flops
    -- WRITE YOUR CODE HERE
    signal s_qa  : std_logic;
    signal s_qb  : std_logic;
    signal s_qc  : std_logic;

begin

    --------------------------------------------------------------------
    -- Four instances (copies) of D type FF entity
    d_ff_0 : entity work.d_ff_rst
        port map(
            clk   => BTNU,
            rst   => BTNC,
            -- WRITE YOUR CODE HERE
            d     => SW(0),
            q     => s_qa 
        );
        
        LED(3) <= s_qa;

    d_ff_1 : entity work.d_ff_rst
        port map(
            clk   => BTNU,
            rst   => BTNC,
            -- WRITE YOUR CODE HERE
            d     => s_qa,
            q     => s_qb 
        );
        
        LED(2) <= s_qb;

    -- WRITE YOUR CODE HERE
    
    d_ff_2 : entity work.d_ff_rst
        port map(
            clk   => BTNU,
            rst   => BTNC,
            -- WRITE YOUR CODE HERE
            d     => s_qb,
            q     => s_qc 
        );
        
        LED(1) <= s_qc;
        
    d_ff_3 : entity work.d_ff_rst
        port map(
            clk   => BTNU,
            rst   => BTNC,
            -- WRITE YOUR CODE HERE
            d     => s_qc,
            q     => LED(0) 
        );
        

end architecture Behavioral;