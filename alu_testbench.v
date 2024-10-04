module alu_testbench(); 
  reg[31:0] A, B; 
  reg[2:0] control; 
  
  wire[31:0] result; 
  wire zero, overflow, carry, negative; 
  
  alu test_unit(
    .a(A), 
    .b(B),
    .f(control),
    .result(result),
    .zero(zero),
    .overflow(overflow),
    .carry(carry), 
    .negative(negative)); 
    
  initial begin
    //ADD 0+0
    A <= 0; 
    B <= 0; 
    control <= 0; 
    #100
    //ADD 0+(-1)
    B <= -1; 
    #100
    //ADD 1+(-1)
    A <= 1; 
    #100
    //ADD FF+1
    A <= 2'hFF; 
    B <= 1;
    #100 
    //ADD 7FFFFFFF+1
    A <= 8'h7FFFFFFF; 
    B <= 1;
    #100
    //SUB 0-0
    A <= 0; 
    B <= 0; 
    control <= 001;
    #100 
    //SUB 0-(-1)
    B <= -1;
    #100 
    //SUB 1-1
    A <= 1; 
    B <= 1;
    #100 
    //SUB 100-1
    A <= 100;
    #100 
    //SUB 80000000-1
    A <= 80000000;
    #100  
    //SLT 0,0 
    A <= 0; 
    B <= 0; 
    control <= 101;
    #100 
    //SLT 0,1
    B <= 1; 
    #100
    //SLT 0,-1
    B <= -1;
    #100 
    //SLT 1,0
    A <= 1; 
    B <= 0;
    #100 
    //SLT -1,0
    A <= -1; 
    B <= 0;
    #100
    //AND FFFFFFFF, FFFFFFFF
    A <= 8'hFFFFFFFF; 
    B <= 8'hFFFFFFFF; 
    control <= 010;
    #100 
    //AND FFFFFFFF, 12345678
    B <= 12345678; 
    #100
    //AND 12345678, 87654321
    A <= 12345678; 
    B <= 87654321; 
    #100; 
    //AND 00000000, FFFFFFFF
    A <= 00000000; 
    B <= 8'hFFFFFFFF; 
    #100; 
    //OR FFFFFFFF, FFFFFFFF
    A <= 8'hFFFFFFFF; 
    control <= 011; 
    #100; 
    //OR 12345678, 87654321
    A <= 12345678; 
    B <= 87654321; 
    #100; 
    //OR 00000000, FFFFFFFF; 
    A <= 00000000; 
    B <= 8'hFFFFFFFF; 
    #100; 
    //OR 00000000, 00000000; 
    B <= 00000000; 
  end
endmodule  
