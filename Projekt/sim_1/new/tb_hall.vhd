----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.04.2021 20:40:46
-- Design Name: 
-- Module Name: tb_hall - Behavioral
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

entity tb_hall is
--  Port ( );
end tb_hall;

architecture Behavioral of tb_hall is

    -- Local constants
    constant c_CLK_100MHZ_PERIOD : time    := 10 ns;

    --Local signals
    signal s_clk_100MHz : std_logic;
    --- WRITE YOUR CODE HERE
            
    signal s_hall      : std_logic;

begin

    uut_hall : entity work.hall
        port map(
            clk => s_clk_100MHz,
            
            hall_sensor => s_hall,
            wheel_circuit => 2200
        );
        
        
        

    p_clk_gen : process
    begin
        while now < 2000 ms loop         -- 75 periods of 100MHz clock
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;


        
    
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;

        s_hall <= '0';
        wait for 10 ns;

        while(now < 50 ms) loop
            
            s_hall <= '1';
            wait for 30 ns;
            s_hall <= '0';
            wait for 3 ms;
            
        end loop; 
        
        while(now < 100 ms) loop
            
            s_hall <= '1';
            wait for 30 ns;
            s_hall <= '0';
            wait for 6 ms;
            
        end loop; 
        
        while(now < 150 ms) loop
            
            s_hall <= '1';
            wait for 30 ns;
            s_hall <= '0';
            wait for 5 ms;
            
        end loop;
        
        while(now < 200 ms) loop
            
            s_hall <= '1';
            wait for 30 ns;
            s_hall <= '0';
            wait for 4 ms;
            
        end loop;
        
        s_hall <= '1';
        wait for 30 ns;
        s_hall <= '0';
        wait for 10 ms;
            
        report "Stimulus process finished" severity note;
    end process p_stimulus;

end Behavioral;
