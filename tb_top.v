module top_tb ();
  reg Hclk, Hresetn;
  wire Hreadyout, Penable, Pwrite;
  wire [31:0] Hrdata;
  wire [ 1:0] Hresp;
  wire Hwrite, Hreadyin;
  wire [1:0] Htrans;
  wire [31:0] Hwdata, Haddr, Prdata;
  wire [2:0] Pselx;
  wire [31:0] Paddr, Pwdata;
  wire Pwriteout, Penableout;
  wire [2:0] Pselxout;
  wire [31:0]    Pwdataout, Paddrout;

  AHB_Master master (
    .Hclk(Hclk), 
    .Hresetn(Hresetn), 
    .Hresp(Hresp), 
    .Hrdata(Hrdata), 
    .Hwrite(Hwrite), 
    .Hreadyin(Hreadyin), 
    .Hreadyout(Hreadyout), 
    .Htrans(Htrans), 
    .Hwdata(Hwdata), 
    .Haddr(Haddr)
    );
     
  Bridge_Top bridge (
    .Hclk(Hclk), 
    .Hresetn(Hresetn), 
    .Hwrite(Hwrite), 
    .Hreadyin(Hreadyin), 
    .Hreadyout(Hreadyout), 
    .Hwdata(Hwdata), 
    .Haddr(Haddr), 
    .Htrans(Htrans), 
    .Prdata(Prdata), 
    .Penable(Penable), 
    .Pwrite(Pwrite), 
    .Pselx(Pselx), 
    .Paddr(Paddr), 
    .Pwdata(Pwdata),
    .Hresp(Hresp), 
    .Hrdata(Hrdata)
    );
     
     APB_Interface peripherals (
    .Pwrite(Pwrite), 
    .Pselx(Pselx), 
    .Penable(Penable), 
    .Paddr(Paddr), 
    .Pwdata(Pwdata), 
    .Pwriteout(Pwriteout), 
    .Pselxout(Pselxout), 
    .Penableout(Penableout), 
    .Paddrout(Paddrout), 
    .Pwdataout(Pwdataout), 
    .Prdata(Prdata)
    );

  initial begin
    Hclk = 1'b0;
    forever #10 Hclk = ~Hclk;
  end

  task reset;
    begin
      @(negedge Hclk);
      Hresetn = 1'b1;
      @(negedge Hclk);
      Hresetn = 1'b0;
    end
  endtask
  
  initial begin
    reset;

    //master.single_read();
    master.single_write();
    #100 $finish;
  end
endmodule
