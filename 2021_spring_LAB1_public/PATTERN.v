`define CYCLE_TIME 20.0

module PATTERN(
W_0,V_GS_0,V_DS_0,
W_1,V_GS_1,V_DS_1,
W_2,V_GS_2,V_DS_2,
W_3,V_GS_3,V_DS_3,
W_4,V_GS_4,V_DS_4,
W_5,V_GS_5,V_DS_5,
mode,out_n
  );
  //================================================================
  //   INPUT AND OUTPUT DECLARATION
  //================================================================
  output reg [2:0] W_0,V_GS_0,V_DS_0;
  output reg [2:0] W_1,V_GS_1,V_DS_1;
  output reg [2:0] W_2,V_GS_2,V_DS_2;
  output reg [2:0] W_3,V_GS_3,V_DS_3;
  output reg [2:0] W_4,V_GS_4,V_DS_4;
  output reg [2:0] W_5,V_GS_5,V_DS_5;
  output reg [1:0] mode;
  input  [9:0] out_n;
  //================================================================
  // parameters & integer
  //================================================================
  integer PATNUM = 30000;
  integer seed;
  integer total_latency;
  integer patcount;
  integer i,j;
  //================================================================
  // wire & registers
  //================================================================
  reg [6:0] id[5:0],gm[5:0];
  reg [2:0] v_ov[5:0];
  reg [6:0] temp;
  reg [9:0] out_ans;
  //================================================================
  // clock
  //================================================================
  reg clk;
  real	CYCLE = `CYCLE_TIME;
  always	#(CYCLE/2.0) clk = ~clk;
  initial
    clk = 0;

  //================================================================
  // initial
  //================================================================
  initial
  begin

    W_0 = 3'dx; V_GS_0 = 3'dx; V_DS_0 = 3'dx;
    W_1 = 3'dx; V_GS_1 = 3'dx; V_DS_1 = 3'dx;
    W_2 = 3'dx; V_GS_2 = 3'dx; V_DS_2 = 3'dx;
    W_3 = 3'dx; V_GS_3 = 3'dx; V_DS_3 = 3'dx;
    W_4 = 3'dx; V_GS_4 = 3'dx; V_DS_4 = 3'dx;
    W_5 = 3'dx; V_GS_5 = 3'dx; V_DS_5 = 3'dx;
    total_latency = 0;
    seed = 32;

    for(patcount = 0; patcount < PATNUM; patcount = patcount + 1)
    begin
      gen_data;
      gen_golden;
      repeat(1) @(negedge clk);
      check_ans;
      repeat(3) @(negedge clk);
    end

    display_pass;

    repeat(3) @(negedge clk);
    $finish;
  end

  //================================================================
  // task
  //================================================================
  task gen_data;
    begin
      W_0=$random(seed)%'d7 + 1; V_GS_0=$random(seed)%'d7 + 1; V_DS_0=$random(seed)%'d7 + 1;
      W_1=$random(seed)%'d7 + 1; V_GS_1=$random(seed)%'d7 + 1; V_DS_1=$random(seed)%'d7 + 1;
      W_2=$random(seed)%'d7 + 1; V_GS_2=$random(seed)%'d7 + 1; V_DS_2=$random(seed)%'d7 + 1;
      W_3=$random(seed)%'d7 + 1; V_GS_3=$random(seed)%'d7 + 1; V_DS_3=$random(seed)%'d7 + 1;
      W_4=$random(seed)%'d7 + 1; V_GS_4=$random(seed)%'d7 + 1; V_DS_4=$random(seed)%'d7 + 1;
      W_5=$random(seed)%'d7 + 1; V_GS_5=$random(seed)%'d7 + 1; V_DS_5=$random(seed)%'d7 + 1;
      mode = $random(seed)%'d4;
    end
  endtask


  task gen_golden;
    begin
      id[0] = (V_GS_0 - 1) > V_DS_0 ? (W_0*(2*(V_GS_0 - 1)*V_DS_0 - V_DS_0*V_DS_0))/3 : (W_0*(V_GS_0 - 1)**2)/3;
      gm[0] = (V_GS_0 - 1) > V_DS_0 ? (2*W_0*V_DS_0)/3 : (2*W_0*(V_GS_0 - 1))/3;

      id[1] = (V_GS_1 - 1) > V_DS_1 ? (W_1*(2*(V_GS_1 - 1)*V_DS_1 - V_DS_1*V_DS_1))/3 : (W_1*(V_GS_1 - 1)**2)/3;
      gm[1] = (V_GS_1 - 1) > V_DS_1 ? (2*W_1*V_DS_1)/3 : (2*W_1*(V_GS_1 - 1))/3;

      id[2] = (V_GS_2 - 1) > V_DS_2 ? (W_2*(2*(V_GS_2 - 1)*V_DS_2 - V_DS_2*V_DS_2))/3 : (W_2*(V_GS_2 - 1)**2)/3;
      gm[2] = (V_GS_2 - 1) > V_DS_2 ? (2*W_2*V_DS_2)/3 : (2*W_2*(V_GS_2 - 1))/3;

      id[3] = (V_GS_3 - 1) > V_DS_3 ? (W_3*(2*(V_GS_3 - 1)*V_DS_3 - V_DS_3*V_DS_3))/3 : (W_3*(V_GS_3 - 1)**2)/3;
      gm[3] = (V_GS_3 - 1) > V_DS_3 ? (2*W_3*V_DS_3)/3 : (2*W_3*(V_GS_3 - 1))/3;

      id[4] = (V_GS_4 - 1) > V_DS_4 ? (W_4*(2*(V_GS_4 - 1)*V_DS_4 - V_DS_4*V_DS_4))/3 : (W_4*(V_GS_4 - 1)**2)/3;
      gm[4] = (V_GS_4 - 1) > V_DS_4 ? (2*W_4*V_DS_4)/3 : (2*W_4*(V_GS_4 - 1))/3;

      id[5] = (V_GS_5 - 1) > V_DS_5 ? (W_5*(2*(V_GS_5 - 1)*V_DS_5 - V_DS_5*V_DS_5))/3 : (W_5*(V_GS_5 - 1)**2)/3;
      gm[5] = (V_GS_5 - 1) > V_DS_5 ? (2*W_5*V_DS_5)/3 : (2*W_5*(V_GS_5 - 1))/3;  
      
      $display("id[0]=%d id[1]=%d id[2]=%d id[3]=%d id[4]=%d id[5]=%d",id[0],id[1],id[2],id[3],id[4],id[5]);
      $display("gm[0]=%d gm[1]=%d gm[2]=%d gm[3]=%d gm[4]=%d gm[5]=%d",gm[0],gm[1],gm[2],gm[3],gm[4],gm[5]);

      //sort id
      for(i=0;i<5;i=i+1)
      begin
        for(j=0;j<5-i;j=j+1)
        begin
          if(id[j+1]>id[j])
          begin
            temp=id[j];
            id[j]=id[j+1];
            id[j+1]=temp;
          end
        end
      end
      //sort gm
      for(i=0;i<5;i=i+1)
      begin
        for(j=0;j<5-i;j=j+1)
        begin
          if(gm[j+1]>gm[j])
          begin
            temp=gm[j];
            gm[j]=gm[j+1];
            gm[j+1]=temp;
          end
        end
      end
      //out_ans
      if(mode[0]) begin
        out_ans = mode[1] ? 3*id[0] + 4*id[1] + 5*id[2] : 3*id[3] + 4*id[4] + 5*id[5];
      end
      else begin
        out_ans = mode[1] ? gm[0] + gm[1] + gm[2] : gm[3] + gm[4] + gm[5];
      end
    end
  endtask

  task check_ans;
    begin
      if(out_n!==out_ans)
      begin
        display_fail;
        $display ("-------------------------------------------------------------------");
        $display("*                            PATTERN NO.%4d 	                      ", patcount);
        $display ("             answer should be : %d , your answer is : %d           ", out_ans, out_n);
        $display ("-------------------------------------------------------------------");
        #(100);
        $finish ;
      end
      else
        $display ("             \033[0;32mPass Pattern NO. %d\033[m         ", patcount);
    end
  endtask

  task display_fail;
    begin
      $display("\n");
      $display("\n");
      $display("        ----------------------------               ");
      $display("        --                        --       |\__||  ");
      $display("        --  OOPS!!                --      / X,X  | ");
      $display("        --                        --    /_____   | ");
      $display("        --  \033[0;31mSimulation Failed!!\033[m   --   /^ ^ ^ \\  |");
      $display("        --                        --  |^ ^ ^ ^ |w| ");
      $display("        ----------------------------   \\m___m__|_|");
      $display("\n");
    end
  endtask

  task display_pass;
    begin
      $display("\n");
      $display("\n");
      $display("        ----------------------------               ");
      $display("        --                        --       |\__||  ");
      $display("        --  Congratulations !!    --      / O.O  | ");
      $display("        --                        --    /_____   | ");
      $display("        --  \033[0;32mSimulation PASS!!\033[m     --   /^ ^ ^ \\  |");
      $display("        --                        --  |^ ^ ^ ^ |w| ");
      $display("        ----------------------------   \\m___m__|_|");
      $display("\n");
    end
  endtask

endmodule
