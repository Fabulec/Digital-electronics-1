----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.03.2021 13:59:02
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
    
           CLK100MHZ   : in STD_LOGIC;
           BTN0        : in STD_LOGIC;
           BTN1        : in STD_LOGIC;
           BTN2        : in STD_LOGIC;
           hall        : in STD_LOGIC;
           
           CA          : out STD_LOGIC;
           CB          : out STD_LOGIC;
           CC          : out STD_LOGIC;
           CD          : out STD_LOGIC;
           CE          : out STD_LOGIC;
           CF          : out STD_LOGIC;
           CG          : out STD_LOGIC;
           
           DP          : out STD_LOGIC;
           
           AN          : out STD_LOGIC_VECTOR (4 - 1 downto 0)
           
    );
end top;

architecture Behavioral of top is

    signal s_decimal : integer;

begin        
    driver_seg_4 : entity work.driver_7seg_4digits
        port map(
            clk        => CLK100MHZ,
            reset      => BTN2,

            decimal => s_decimal,

            dp_i => "1110",
            dp_o => DP,
            
            seg_o(6) => CA,
            seg_o(5) => CB,
            seg_o(4) => CC,
            seg_o(3) => CD,
            seg_o(2) => CE,
            seg_o(1) => CF,
            seg_o(0) => CG,
            
            dig_o => AN(4 - 1 downto 0)
        );
        
    hall_sensor : entity work.hall
        port map(
            clk            => CLK100MHZ,
            hall_sensor    => hall,
            wheel_circuit  => 2200,
            mode_BTN       => BTN0,
            reset_BTN      => BTN1,
            

            number         => s_decimal
        );

end architecture Behavioral;
