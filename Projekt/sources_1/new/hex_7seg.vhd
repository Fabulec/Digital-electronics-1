------------------------------------------------------------------------
--
-- Example of 2-bit binary comparator using the when/else assignment.
-- EDA Playground
--
-- Copyright (c) 2020-2021 Tomas Fryza
-- Dept. of Radio Electronics, Brno University of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------
-- Entity declaration for 2-bit binary comparator
------------------------------------------------------------------------
entity hex_7seg is
    port
    (
        
        hex_i         : in  integer range 0 to 9999;
        seg_o         : out std_logic_vector(7 - 1 downto 0)
        
    );
end entity hex_7seg;

------------------------------------------------------------------------
-- Architecture body for 2-bit binary comparator
------------------------------------------------------------------------
architecture Behavioral of hex_7seg is
begin

    --------------------------------------------------------------------
    -- p_7seg_decoder:
    -- A combinational process for 7-segment display decoder. 
    -- Any time "hex_i" is changed, the process is "executed".
    -- Output pin seg_o(6) corresponds to segment A, seg_o(5) to B, etc.
    --------------------------------------------------------------------
    p_7seg_decoder : process(hex_i)
    begin
    
        case hex_i is
            when 0 =>
                seg_o <= "0000001";     -- 0
            when 1 =>
                seg_o <= "1001111";     -- 1
            when 2 =>
                seg_o <= "0010010";     -- 2
            when 3 =>
                seg_o <= "0000110";     -- 3
            when 4 =>
                seg_o <= "1001100";     -- 4 
            when 5 =>
                seg_o <= "0100100";     -- 5
            when 6 =>
                seg_o <= "0100000";     -- 6 
            when 7 =>
                seg_o <= "0001111";     -- 7
            when 8 =>
                seg_o <= "0000000";     -- 8
            when 9 =>
                seg_o <= "0000100";     -- 9
            when others =>
                seg_o <= "1111111";
        end case;
        
    end process p_7seg_decoder;

end architecture Behavioral;
