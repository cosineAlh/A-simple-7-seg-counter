Library ieee;  
use ieee.std_logic_1164.all;  
use ieee.std_logic_arith.all;  
use ieee.std_logic_unsigned.all;  

entity counter23 is  
port  
  (RST,CE,CLK :in std_logic;  
  Q:out std_logic_vector(5 downto 0);
  F:out std_logic
  );  
end entity;  

architecture rtl of counter23 is  
signal tmp  :std_logic_vector(5 downto 0);  
begin 
  process(clk)  
    begin
      if(clk'event and clk='1') then  
        if(rst='0')then  
          tmp<="000000";
          f<='0';  
        elsif(ce='1') then  
          if(tmp="010111")then  
            tmp<="000000";  
          else  
            tmp<=unsigned(tmp)+'1';
          end if;
        end if;  
      end if;  
      q<=tmp;   
      if(tmp="010111")then f<='1';
      elsif(tmp="000000")then f<='0';
      end if;
  end process;  
end rtl;