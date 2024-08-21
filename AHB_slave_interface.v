module AHB_slave_interface (
    Hclk,
    Hresetn,
    Hwrite,
    Hreadyin,
    Htrans,
    Haddr,
    Hwdata,
    valid,
    Haddr1,
    Haddr2,
    Hwdata1,
    Hwdata2,
    Hwritereg,
    tempselx,
    Hresp,
    Hrdata,
    Prdata
);

  input Hclk, Hresetn, Hwrite, Hreadyin;
  input [1:0] Htrans;
  input [31:0] Haddr, Hwdata, Prdata;
  output reg valid;
  output reg [31:0] Haddr1, Haddr2, Hwdata1, Hwdata2;
  output reg Hwritereg;
  output reg [2:0] tempselx;
  output [1:0] Hresp;
  output [31:0] Hrdata;


  always @(*) begin
    valid = 1'b0;
    if (Hreadyin && (Htrans == 2'b10 || Htrans == 2'b11) && (Haddr >= 32'h8000_0000 && Haddr < 32'h8C00_0000)) begin
      valid = 1;
    end
  end

  always @(*) begin
    if (Haddr >= 32'h8000_0000 && Haddr < 32'h8400_0000) begin
      tempselx = 3'b001;
    end else if (Haddr >= 32'h8400_0000 && Haddr < 32'h8800_0000) begin
      tempselx = 3'b010;
    end else if (Haddr >= 32'h8800_0000 && Haddr < 32'h8C00_0000) begin
      tempselx = 3'b100;
    end else begin
      tempselx = 3'b000;
    end
  end

  always @(posedge Hclk or negedge Hresetn) begin
    if (~Hresetn) begin
      Haddr1 <= 32'b0;
      Haddr2 <= 32'b0;
    end else begin
      Haddr1 <= Haddr;
      Haddr2 <= Haddr1;
    end
  end

  always @(posedge Hclk or negedge Hresetn) begin
    if (~Hresetn) begin
      Hwritereg <= 1'b0;
    end else begin
      Hwritereg <= Hwrite;
    end
  end

  always @(posedge Hclk or negedge Hresetn) begin
    if (~Hresetn) begin
      Hwdata1 <= 32'b0;
      Hwdata2 <= 32'b0;
    end else begin
      Hwdata1 <= Hwdata;
      Hwdata2 <= Hwdata1;
    end
  end

  assign Hresp  = 2'b00;
  assign Hrdata = Prdata;

endmodule

