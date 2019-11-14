library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity Debounce is          
  generic(NUMERO_COUNT: integer := 12500000);
  port(clock: in STD_LOGIC;
       reset_N: in STD_LOGIC;
       key: in STD_LOGIC;
       debkey: out STD_LOGIC);
end Debounce;

architecture Debounce of Debounce is
  type State_type is (S1, S2, S3, S4, S5, S6, S7, S8);
  signal EA, EADiv: State_type;
  signal clockLento: STD_LOGIC;
   
begin
  process(reset_N, clock)
  begin
    if(clock'event and clock='0') then    -- borda de descida do clock da mquina
      if(reset_N='0') then
        EA <= S1;
      else  
        case EA is
             when S1 =>  if(key='0') then   EA <= S2;  end if;
             when S2 =>  EA <= S3;
             when S3 =>  if(clockLento='1') then EA <= S4;  end if;
             when S4 =>  if(clockLento='0') then EA <= S5;  end if;
             when S5 =>  if(clockLento='1') then EA <= S6;  end if;
             when S6 =>  if(clockLento='0') then EA <= S7;  end if;
             when S7 =>  if(clockLento='1') then EA <= S8;  end if;
             when S8 =>  if(clockLento='0') then EA <= S1;  end if;		   
        end case;
      end if;
    end if;
  end process;

-- A tecla debkey tem logica afirmada (comparar com teclas da placa alvo)
    debkey <= '1' when (EA=S2) else '0';

-- Divisor do clock de entrada para gerar um clock lento
  process (reset_N, clock)
  variable count: integer;
  begin
    if(clock'event and clock='1') then    -- borda de subida do clock da maquina
      if(reset_N='0') then
        EADiv <= S1;
        clockLento <= '0';
      else    
        case EADiv is
             when S1 => count := 0;
                        EADiv <= S2;
             when others =>
                  if(count<NUMERO_COUNT) then 
                    count := count + 1; 
                    EADiv <= S2;  
                  else  
                    EADiv <= S1;  
                    clockLento <= NOT(clockLento);
                  end if;
        end case;
      end if;
    end if;
  end process;

end Debounce;
 
