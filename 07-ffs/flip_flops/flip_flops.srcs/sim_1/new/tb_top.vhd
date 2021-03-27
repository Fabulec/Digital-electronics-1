----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.03.2021 10:59:19
-- Design Name: 
-- Module Name: tb_top - Behavioral
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

entity tb_top is

end tb_top;

architecture Behavioral of tb_top is

    --Local signals
    signal s_clk   : std_logic;
    signal s_rst   : std_logic;
    signal s_SW    : std_logic_vector (1 - 1 downto 0);
    signal s_LED   : std_logic_vector (4 - 1 downto 0);

begin

uut_top : entity work.top
        port map(
            BTNU     => s_clk,
            BTNC     => s_rst,
            SW       => s_SW,
            LED      => s_LED
        );
    
    --------------------------------------------------------------------
    -- Reset generation process
    --------------------------------------------------------------------

     p_reset_gen : process
        begin
            s_rst <= '0';
            wait for 12 ns;
            
            -- Reset activated
            s_rst <= '1';
            wait for 13 ns;
    
            --Reset deactivated
            s_rst <= '0';
            
            wait for 87 ns;
            
    
            -- Reset activated
            s_rst <= '1';
            wait for 13 ns;
    
            --Reset deactivated
            s_rst <= '0';
    
            wait;
     end process p_reset_gen;

    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;
        
        s_SW <= "0";
        s_clk <= '0';
        
        wait for 20 ns;
        s_clk <= '1';
        wait for 5 ns;
        s_clk <= '0';
        wait for 5 ns;
        
        -- send '1' to shift register
        s_SW <= "1";
        wait for 5 ns;
        s_clk <= '1';
        wait for 5 ns;
        s_clk <= '0';
        wait for 10 ns;
        
        -- send '0' to shift register
        s_SW <= "0";
        wait for 5 ns;
        s_clk <= '1';
        wait for 5 ns;
        s_clk <= '0';
        wait for 10 ns;
        
        -- send '0' to shift register
        s_SW <= "0";
        wait for 5 ns;
        s_clk <= '1';
        wait for 5 ns;
        s_clk <= '0';
        wait for 10 ns;
        
        -- send '1' to shift register
        s_SW <= "1";
        wait for 5 ns;
        s_clk <= '1';
        wait for 5 ns;
        s_clk <= '0';
        wait for 10 ns;
        
        -- send '1' to shift register
        s_SW <= "1";
        wait for 5 ns;
        s_clk <= '1';
        wait for 5 ns;
        s_clk <= '0';
        wait for 10 ns;
    
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;



end Behavioral;