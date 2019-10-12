----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2016/01/20 15:05:14
-- Design Name: 
-- Module Name: rs_encode - Behavioral
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
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity man_code is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
			  
           data_uncoded  :  in STD_LOGIC_VECTOR(7 DOWNTO 0);
           data_uncoded_en     : in STD_LOGIC;
			  
           data_coded_en     : out STD_LOGIC;
		     data_coded  : out STD_LOGIC_VECTOR(15 DOWNTO 0)
           );
end man_code;

architecture Behavioral of man_code is

--	signal	increase_data	:	STD_LOGIC_VECTOR(31 downto 0);
--	signal	data_in_delay	:	STD_LOGIC_VECTOR(7 downto 0);
	constant	changshu	:	STD_LOGIC_VECTOR(15 downto 0) := "0101010101010101";
--	signal	rs_data_in	:	STD_LOGIC_VECTOR(7 downto 0);
--    signal  rs_data_en            : std_logic;        
--    signal  rs_data_eop            : std_logic;        
--    signal  rd_int_delay            : std_logic;        
begin

            
    ---- rs in signal: en and signal
	process(clk)
    begin
        if(reset='1') then
            data_coded <= (others=>'0');
            data_coded_en <= '0';
--			increase_data <= (others=>'0');
        elsif(rising_edge(clk)) then
            
					data_coded(15) <= data_uncoded(7) xor changshu(15);
					data_coded(14) <= data_uncoded(7) xor changshu(14);
					data_coded(13) <= data_uncoded(6) xor changshu(13);
					data_coded(12) <= data_uncoded(6) xor changshu(12);
					data_coded(11) <= data_uncoded(5) xor changshu(11);
					data_coded(10) <= data_uncoded(5) xor changshu(10);
					data_coded(9) <= data_uncoded(4) xor changshu(9);
					data_coded(8) <= data_uncoded(4) xor changshu(8);
					data_coded(7) <= data_uncoded(3) xor changshu(7);
					data_coded(6) <= data_uncoded(3) xor changshu(6);
					data_coded(5) <= data_uncoded(2) xor changshu(5);
					data_coded(4) <= data_uncoded(2) xor changshu(4);
					data_coded(3) <= data_uncoded(1) xor changshu(3);
					data_coded(2) <= data_uncoded(1) xor changshu(2);
					data_coded(1) <= data_uncoded(0) xor changshu(1);
					data_coded(0) <= data_uncoded(0) xor changshu(0);

					data_coded_en <= data_uncoded_en;

        end if;
    end process;
    ---- rs in signal: eop
					
    
end Behavioral;
