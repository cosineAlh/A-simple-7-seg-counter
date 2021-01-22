library ieee;  
use ieee.std_logic_1164.all;  

entity counter is   
end counter;  

architecture rtl of counter is  
  component counter23  
    port(  
      RST,CE,CLK :in std_logic;  
      Q:out std_logic_vector(5 downto 0);
      F:out std_logic
      );  
  end component;  
  signal rst  :std_logic:='0';  
  signal ce   :std_logic:='0';  
  signal clk  :std_logic:='0';  
  signal f    :std_logic:='0';
  signal  q   :std_logic_vector(5 downto 0);  
      constant clk_period :time :=20 ns;   
  begin  
    instant:counter23 port map  
    (  
      clk=>clk,ce=>ce,rst=>rst,q=>q,f=>f
      );  
        
  clk_gen:process  
  begin      
    wait for clk_period/2;  
    clk<='1';   
    wait for clk_period/2;  
    clk<='0';  
  end process;  

  rst_gen:process  
  begin  
    rst<='0';  
    wait for 50 ns;  
    rst<='1';  
    wait;  
  end process;  
  
  ce_gen:process  
  begin  
    ce<='0';  
    wait for 30ns;  
    ce<='1';  
    wait;  
  end process;  
end rtl; 