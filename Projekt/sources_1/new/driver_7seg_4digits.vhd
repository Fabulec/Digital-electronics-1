------------------------------------------------------------------------
--
-- Driver for 4-digit 7-segment display.
-- Nexys A7-50T, Vivado v2020.1.1, EDA Playground
--
-- Copyright (c) 2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno University of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

------------------------------------------------------------------------
-- Entity declaration for display driver
------------------------------------------------------------------------
entity driver_7seg_4digits is
    port(
        clk     : in  std_logic;                        -- main clock
        reset   : in  std_logic;                        -- synchronous reset
        dp_i    : in  std_logic_vector(4 - 1 downto 0); -- 4 bit value input for decimal point

        decimal : in integer range 0 to 9999;           -- number to display

        dp_o    : out std_logic;                        -- decimal point for specific digit
        seg_o   : out std_logic_vector(7 - 1 downto 0); -- cathode output for individual segments
        dig_o   : out std_logic_vector(4 - 1 downto 0)  -- common anode signals output to individual displays
    );
end entity driver_7seg_4digits;

------------------------------------------------------------------------
-- Architecture with signals declaration
------------------------------------------------------------------------
architecture Behavioral of driver_7seg_4digits is

    signal s_en  : std_logic; -- internal clock enable
    signal s_cnt : std_logic_vector(2 - 1 downto 0); -- internal 2-bit counter for multiplexing 4 digits

    signal s_hex : integer range 0 to 9999; -- internal integer value for 7 segment decoder
    signal s_decimal : integer range 0 to 9999; -- internal integer value for displaying digits
    
    signal buff     : integer:=0;
    signal buff2    : integer:=0;
    signal thousands : integer:=0; -- 
    signal hundreds : integer:=0;
    signal decimals : integer:=0;
    signal ones     : integer:=0;
    
    signal s_data0_i : integer range 0 to 9999;
    signal s_data1_i : integer range 0 to 9999;
    signal s_data2_i : integer range 0 to 9999;
    signal s_data3_i : integer range 0 to 9999;

begin

    s_decimal <= decimal;
    
    -- instance copy of clock_enable entity
    clk_en0 : entity work.clock_enable
        generic map(
            g_MAX => 4
        )
        port map(
            clk   => clk,
            reset => reset,
            ce_o  => s_en
        );

    -- instance copy of hex_7seg entity
    hex2seg : entity work.hex_7seg
        port map(
            hex_i => s_hex,
            seg_o => seg_o
        );
        
    -- instance copy of cnt_up_down entity
    bin_cnt0 : entity work.cnt_up_down
        generic map(
            g_CNT_WIDTH => 2
       )
        port map(
            clk  => clk,
            reset  => reset,
            en_i  => s_en,
            cnt_up_i  => '0',
            cnt_o  => s_cnt
        );

------------------------------------------------------------------------
-- Process p_mux_dec:
-- s_decimal integer number split to digits
-- writing digits to s_data and display them on 7 segment display using hex_7seg
------------------------------------------------------------------------
    p_mux_dec : process(clk, s_decimal)    
    begin
        if(buff2 /= s_decimal) then
            buff2 <= s_decimal;
            buff <= 0;
        end if;

        if(s_decimal >= (buff + 1000)) then
            buff <= buff + 1000;
            thousands <= thousands + 1;
        elsif(s_decimal >= (buff + 100)) then 
            buff <= buff + 100;
            hundreds <= hundreds + 1;
        elsif(s_decimal >= (buff + 10)) then 
            buff <= buff + 10;
            decimals <= decimals + 1;
        elsif(s_decimal >= (buff + 1)) then 
            buff <= buff + 1;
            ones <= ones + 1;
        end if;


        
        if(s_decimal = buff) then
            -- write numbers to s_data
            s_data3_i <= thousands;
            s_data2_i <= hundreds;
            s_data1_i <= decimals;
            s_data0_i <= ones;
            
            -- clear buffer and digits
            buff <= 0;
            
            thousands <= 0;
            hundreds <= 0;
            decimals <= 0;
            ones <= 0;
        end if;
        
    end process p_mux_dec;
    
--------------------------------------------------------------------
-- Process p_mux:
-- A combinational process that implements a multiplexer for
-- selecting data for a single digit, a decimal point signal, and 
-- switches the common anodes of each display.
--------------------------------------------------------------------
    p_mux : process(s_cnt, dp_i)
    begin
        case s_cnt is
            when "11" =>
                s_hex <= s_data3_i;
                dp_o  <= dp_i(3);
                dig_o <= "0111";

            when "10" =>
                s_hex <= s_data2_i;
                dp_o  <= dp_i(2);
                dig_o <= "1011";

            when "01" =>
                s_hex <= s_data1_i;
                dp_o  <= dp_i(1);
                dig_o <= "1101";

            when others =>
                s_hex <= s_data0_i;
                dp_o  <= dp_i(0);
                dig_o <= "1110";
        end case;
    end process p_mux;

end architecture Behavioral;
