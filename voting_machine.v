`timescale 1ns / 1ps
module voting_machine(input clk,reset,BJP,CONG,NOTA,BJP_FIG,CONG_FIG,NOTA_FIG,output reg BJP_CONF,CONG_CONF,NOTA_CONF,output [0:6] seg,output [3:0] digit);

reg [9:0] BJP_COUNT=0,NOTA_COUNT=0,CONG_COUNT=0;
wire [3:0]ones,tens,hundreds,thousands;

digits digits_1(clk,reset,BJP_FIG,CONG_FIG,NOTA_FIG,BJP_COUNT,NOTA_COUNT,CONG_COUNT,ones,tens,hundreds,thousands);
seven_seg seven_seg_1(clk,reset,ones,tens,hundreds,thousands,seg,digit);

reg [31:0] count = 0;

always @(posedge clk)
begin
    if(reset)
    begin
        BJP_COUNT  <= 0;
        CONG_COUNT <= 0;
        NOTA_COUNT <= 0;
    end
    else
    begin
            if(BJP)
                begin
                if(count < 50_000_000)
                    count <= count + 1;
                else
                  begin
                      if(BJP && count==50_000_000)
                        begin
                        BJP_CONF  <= 1'b1;
                        count     <= count+1;
                        BJP_COUNT <= BJP_COUNT + 1;
                        end
                      else
                        begin
                        BJP_CONF  <= 1'b1;
                        count     <= count+1;
                        BJP_COUNT <= BJP_COUNT;
                       
                        end
                  end
                end  
             else if (CONG )
             begin
                  if(count < 50_000_000)
                      count <= count + 1;
                  else
                  begin
                      if(CONG && count==50_000_000)
                        begin
                        CONG_CONF <= 1'b1;
                        count    <= count+1;
                        CONG_COUNT <= CONG_COUNT + 1;
                        end
                      else
                        begin
                        CONG_CONF <= 1'b1;
                        count    <= count+1;
                        CONG_COUNT <= CONG_COUNT;
                        end
                  end
               end
             else if (NOTA)
             begin
                  if(count < 50_000_000)
                       count <= count + 1;
                  else
                  begin
                      if(NOTA && count==50_000_000)
                        begin
                        NOTA_CONF  <= 1'b1;
                        count      <= count+1;
                        NOTA_COUNT <= NOTA_COUNT + 1;
                        end
                      else
                        begin
                        NOTA_CONF <= 1'b1;
                        count    <= count+1;
                        NOTA_COUNT <= NOTA_COUNT;
                        end
                  end
            end
			else begin
				count<=0;
				BJP_CONF<=0;
				NOTA_CONF<=0;
				CONG_CONF<=0;
			end
        end
  end          
endmodule