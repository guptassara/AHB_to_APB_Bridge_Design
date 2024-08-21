module Bridge_Top (
    Hclk,
    Hresetn,
    Hwrite,
    Hreadyin,
    Hreadyout,
    Hwdata,
    Haddr,
    Htrans,
    Prdata,
    Penable,
    Pwrite,
    Pselx,
    Paddr,
    Pwdata,
    Hreadyout,
    Hresp,
    Hrdata
);

  input Hclk, Hresetn, Hwrite, Hreadyin;
  input [31:0] Hwdata, Haddr, Prdata;
  input [1:0] Htrans;
  output Penable, Pwrite, Hreadyout;
  output [1:0] Hresp;
  output [2:0] Pselx;
  output [31:0] Paddr, Pwdata;
  output [31:0] Hrdata;

  ///////////////////////////////////////////////////////////////INTERMEDIATE SIGNALS

  wire valid;
  wire [31:0] Haddr1, Haddr2;
  wire Hwritereg;
  wire [2:0] tempselx;

  /////////////////////////////////////////////////////////////// MODULE INSTANTIATIONS

AHB_slave_interface AHB_slave_interface_inst (
    .Hclk(Hclk), 
    .Hresetn(Hresetn), 
    .Hwrite(Hwrite), 
    .Hreadyin(Hreadyin), 
    .Htrans(Htrans), 
    .Haddr(Haddr), 
    .Hwdata(Hwdata), 
    .Prdata(Prdata), 
    .Haddr1(Haddr1), 
    .Haddr2(Haddr2), 
    .Hwdata1(Hwdata1), 
    .Hwdata2(Hwdata2), 
    .Hwritereg(Hwritereg), 
    .tempselx(tempselx), 
    .Hresp(Hresp), 
    .Hrdata(Hrdata), 
    .valid(valid)
    );

  APB_controller APB_controller_inst (
    .Hclk(Hclk), 
    .Hresetn(Hresetn), 
    .valid(valid), 
    .Haddr1(Haddr1), 
    .Haddr2(Haddr2), 
    .Hwdata1(Hwdata1), 
    .Hwdata2(Hwdata2), 
    .Prdata(Prdata), 
    .Hwrite(Hwrite), 
    .Haddr(Haddr), 
    .Hwdata(Hwdata), 
    .Hwritereg(Hwritereg), 
    .tempselx(tempselx), 
    .Pwrite(Pwrite), 
    .Penable(Penable), 
    .Pselx(Pselx), 
    .Paddr(Paddr), 
    .Pwdata(Pwdata), 
    .Hreadyout(Hreadyout)
    );
endmodule
