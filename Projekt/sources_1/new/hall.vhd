----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.04.2021 18:07:26
-- Design Name: 
-- Module Name: hall - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity hall is
    port(
            clk            : in std_logic;
            hall_sensor    : in std_logic;
            wheel_circuit  : in integer;
            
            mode_BTN       : in std_logic;
            reset_BTN      : in std_logic;
            
            number  : out integer
        );
end hall;

architecture Behavioral of hall is

    signal s_reset  : std_logic;
    signal s_run    : std_logic;
    signal s_mode   : std_logic:='0';
    
    signal s_runtime  : integer;
    signal speed      : integer:=0;
    signal distance   : integer:=0;

begin

    time_stop : entity work.time_enable
        port map(
            runtime => s_runtime,
            clk     => clk,
            reset   => s_reset,
            run     => s_run
        );
        
    speed_calc : process(clk)
    begin
    
        if (s_reset = '1') then 
            s_reset <= '0';
        end if;
    
        if (rising_edge(hall_sensor)) then
            speed <= (wheel_circuit*1000) / (s_runtime + 1); 
                 
            s_reset <= '1';
        end if;
        
    end process;
    
    dist_calc : process(clk, hall_sensor)
    begin
    
        if (rising_edge(hall_sensor)) then
        
            distance <= distance + (wheel_circuit / 100);
            
        end if;
        
        if (rising_edge(reset_BTN)) then
            distance <= 0;
        end if;
        
    end process;
    
    view : process(clk)
    begin
    
        if (rising_edge(mode_BTN)) then
            s_mode <= not(s_mode);
        end if;
        
        case s_mode is
            when '0' =>
                number <= speed;
            when '1' =>
                number <= distance;
            when others =>
                number <= speed;
        end case;
        
    end process;

end Behavioral;
