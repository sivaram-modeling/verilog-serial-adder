// Code your design here
module serial_adder(
  input clk,rst,
  input a,b,
  output reg z
);
  reg ps,ns;
  parameter ZERO=0, ONE=1;
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        ps<=0;
      else
        ps<=ns;
    end
  always@(*)
    begin
      case(ps)
        ZERO:
          begin
            case({a,b})
              2'b00: begin z=ZERO; ns=ZERO; end
              2'b01: begin z=ONE; ns=ZERO; end
              2'b10: begin z=ONE; ns=ZERO; end
              2'b11: begin z=ZERO; ns=ZERO; end
            endcase
          end
        ONE: 
          begin
            case({a,b})
              2'b00: begin z=1'b1; ns=ZERO; end
              2'b01: begin z=1'b0; ns=ONE; end
              2'b10: begin z=1'b0; ns=ONE; end
              2'b11: begin z=1'b1; ns=ONE; end
            endcase
          end
      endcase
    end
endmodule
