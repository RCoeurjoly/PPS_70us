`ifndef VERILATOR
module testbench;
  reg [4095:0] vcdfile;
  reg clock;
`else
module testbench(input clock, output reg genclock);
  initial genclock = 1;
`endif
  reg genclock = 1;
  reg [31:0] cycle = 0;
  reg [4:0] PI_i_bullet_x;
  reg [0:0] PI_i_clk_25MHz;
  reg [0:0] PI_i_reset;
  reg [3:0] PI_i_bullet_y;
  invaders UUT (
    .i_bullet_x(PI_i_bullet_x),
    .i_clk_25MHz(PI_i_clk_25MHz),
    .i_reset(PI_i_reset),
    .i_bullet_y(PI_i_bullet_y)
  );
`ifndef VERILATOR
  initial begin
    if ($value$plusargs("vcd=%s", vcdfile)) begin
      $dumpfile(vcdfile);
      $dumpvars(0, testbench);
    end
    #5 clock = 0;
    while (genclock) begin
      #5 clock = 0;
      #5 clock = 1;
    end
  end
`endif
  initial begin
`ifndef VERILATOR
    #1;
`endif
    UUT.direction = 1'b0;
    UUT.o_hit = 1'b0;
    UUT.o_invaders_array = 20'b00000000000111111111;
    UUT.o_invaders_row = 4'b0000;
    UUT.speed_timer1.count = 32'b00000000000000000000000000000000;
    UUT.speed_timer1.o_q = 1'b0;

    // state 0
    PI_i_bullet_x = 5'b00011;
    PI_i_clk_25MHz = 1'b0;
    PI_i_reset = 1'b0;
    PI_i_bullet_y = 4'b0001;
  end
  always @(posedge clock) begin
    // state 1
    if (cycle == 0) begin
      PI_i_bullet_x <= 5'b00101;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 2
    if (cycle == 1) begin
      PI_i_bullet_x <= 5'b00010;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 3
    if (cycle == 2) begin
      PI_i_bullet_x <= 5'b00001;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b1;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 4
    if (cycle == 3) begin
      PI_i_bullet_x <= 5'b00110;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 5
    if (cycle == 4) begin
      PI_i_bullet_x <= 5'b10000;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 6
    if (cycle == 5) begin
      PI_i_bullet_x <= 5'b00001;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0101;
    end

    // state 7
    if (cycle == 6) begin
      PI_i_bullet_x <= 5'b00010;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 8
    if (cycle == 7) begin
      PI_i_bullet_x <= 5'b01000;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 9
    if (cycle == 8) begin
      PI_i_bullet_x <= 5'b00000;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 10
    if (cycle == 9) begin
      PI_i_bullet_x <= 5'b00000;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0000;
    end

    // state 11
    if (cycle == 10) begin
      PI_i_bullet_x <= 5'b00111;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 12
    if (cycle == 11) begin
      PI_i_bullet_x <= 5'b00001;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b1;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 13
    if (cycle == 12) begin
      PI_i_bullet_x <= 5'b00011;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b1;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 14
    if (cycle == 13) begin
      PI_i_bullet_x <= 5'b00000;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b1;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 15
    if (cycle == 14) begin
      PI_i_bullet_x <= 5'b00110;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b1;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 16
    if (cycle == 15) begin
      PI_i_bullet_x <= 5'b01001;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b1;
      PI_i_bullet_y <= 4'b0000;
    end

    // state 17
    if (cycle == 16) begin
      PI_i_bullet_x <= 5'b01000;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b1;
      PI_i_bullet_y <= 4'b0011;
    end

    // state 18
    if (cycle == 17) begin
      PI_i_bullet_x <= 5'b00000;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b1;
      PI_i_bullet_y <= 4'b1001;
    end

    // state 19
    if (cycle == 18) begin
      PI_i_bullet_x <= 5'b00000;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b1;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 20
    if (cycle == 19) begin
      PI_i_bullet_x <= 5'b00010;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b1;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 21
    if (cycle == 20) begin
      PI_i_bullet_x <= 5'b01000;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 22
    if (cycle == 21) begin
      PI_i_bullet_x <= 5'b00101;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 23
    if (cycle == 22) begin
      PI_i_bullet_x <= 5'b00100;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 24
    if (cycle == 23) begin
      PI_i_bullet_x <= 5'b00001;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 25
    if (cycle == 24) begin
      PI_i_bullet_x <= 5'b00010;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b1;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 26
    if (cycle == 25) begin
      PI_i_bullet_x <= 5'b00000;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b1;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 27
    if (cycle == 26) begin
      PI_i_bullet_x <= 5'b00100;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b1;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 28
    if (cycle == 27) begin
      PI_i_bullet_x <= 5'b00001;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b1;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 29
    if (cycle == 28) begin
      PI_i_bullet_x <= 5'b00001;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b1;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 30
    if (cycle == 29) begin
      PI_i_bullet_x <= 5'b00110;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b1;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 31
    if (cycle == 30) begin
      PI_i_bullet_x <= 5'b00001;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b1;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 32
    if (cycle == 31) begin
      PI_i_bullet_x <= 5'b00000;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b1;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 33
    if (cycle == 32) begin
      PI_i_bullet_x <= 5'b00000;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 34
    if (cycle == 33) begin
      PI_i_bullet_x <= 5'b00100;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 35
    if (cycle == 34) begin
      PI_i_bullet_x <= 5'b00010;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 36
    if (cycle == 35) begin
      PI_i_bullet_x <= 5'b01000;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 37
    if (cycle == 36) begin
      PI_i_bullet_x <= 5'b00101;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 38
    if (cycle == 37) begin
      PI_i_bullet_x <= 5'b01000;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0000;
    end

    // state 39
    if (cycle == 38) begin
      PI_i_bullet_x <= 5'b00001;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 40
    if (cycle == 39) begin
      PI_i_bullet_x <= 5'b00010;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0000;
    end

    // state 41
    if (cycle == 40) begin
      PI_i_bullet_x <= 5'b00110;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b1;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 42
    if (cycle == 41) begin
      PI_i_bullet_x <= 5'b00101;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b1;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 43
    if (cycle == 42) begin
      PI_i_bullet_x <= 5'b01000;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b1;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 44
    if (cycle == 43) begin
      PI_i_bullet_x <= 5'b00100;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b1;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 45
    if (cycle == 44) begin
      PI_i_bullet_x <= 5'b00000;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b1;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 46
    if (cycle == 45) begin
      PI_i_bullet_x <= 5'b00000;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 47
    if (cycle == 46) begin
      PI_i_bullet_x <= 5'b00100;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b1;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 48
    if (cycle == 47) begin
      PI_i_bullet_x <= 5'b00100;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b1;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 49
    if (cycle == 48) begin
      PI_i_bullet_x <= 5'b00101;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 50
    if (cycle == 49) begin
      PI_i_bullet_x <= 5'b00001;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 51
    if (cycle == 50) begin
      PI_i_bullet_x <= 5'b00111;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 52
    if (cycle == 51) begin
      PI_i_bullet_x <= 5'b00011;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 53
    if (cycle == 52) begin
      PI_i_bullet_x <= 5'b00000;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 54
    if (cycle == 53) begin
      PI_i_bullet_x <= 5'b00101;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b1;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 55
    if (cycle == 54) begin
      PI_i_bullet_x <= 5'b00010;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 56
    if (cycle == 55) begin
      PI_i_bullet_x <= 5'b01111;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b1;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 57
    if (cycle == 56) begin
      PI_i_bullet_x <= 5'b00000;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b1;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 58
    if (cycle == 57) begin
      PI_i_bullet_x <= 5'b00100;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b1;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 59
    if (cycle == 58) begin
      PI_i_bullet_x <= 5'b01000;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 60
    if (cycle == 59) begin
      PI_i_bullet_x <= 5'b00111;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 61
    if (cycle == 60) begin
      PI_i_bullet_x <= 5'b00001;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 62
    if (cycle == 61) begin
      PI_i_bullet_x <= 5'b00011;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 63
    if (cycle == 62) begin
      PI_i_bullet_x <= 5'b00101;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b1;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 64
    if (cycle == 63) begin
      PI_i_bullet_x <= 5'b00101;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 65
    if (cycle == 64) begin
      PI_i_bullet_x <= 5'b00000;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 66
    if (cycle == 65) begin
      PI_i_bullet_x <= 5'b00001;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b1;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 67
    if (cycle == 66) begin
      PI_i_bullet_x <= 5'b00010;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 68
    if (cycle == 67) begin
      PI_i_bullet_x <= 5'b00001;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 69
    if (cycle == 68) begin
      PI_i_bullet_x <= 5'b00100;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 70
    if (cycle == 69) begin
      PI_i_bullet_x <= 5'b00000;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 71
    if (cycle == 70) begin
      PI_i_bullet_x <= 5'b00011;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 72
    if (cycle == 71) begin
      PI_i_bullet_x <= 5'b00000;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b1;
      PI_i_bullet_y <= 4'b0000;
    end

    // state 73
    if (cycle == 72) begin
      PI_i_bullet_x <= 5'b00100;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 74
    if (cycle == 73) begin
      PI_i_bullet_x <= 5'b01000;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 75
    if (cycle == 74) begin
      PI_i_bullet_x <= 5'b00000;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 76
    if (cycle == 75) begin
      PI_i_bullet_x <= 5'b00000;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b1;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 77
    if (cycle == 76) begin
      PI_i_bullet_x <= 5'b00000;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 78
    if (cycle == 77) begin
      PI_i_bullet_x <= 5'b00110;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 79
    if (cycle == 78) begin
      PI_i_bullet_x <= 5'b00100;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 80
    if (cycle == 79) begin
      PI_i_bullet_x <= 5'b00010;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 81
    if (cycle == 80) begin
      PI_i_bullet_x <= 5'b00000;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 82
    if (cycle == 81) begin
      PI_i_bullet_x <= 5'b01000;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b1;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 83
    if (cycle == 82) begin
      PI_i_bullet_x <= 5'b00011;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 84
    if (cycle == 83) begin
      PI_i_bullet_x <= 5'b00000;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0000;
    end

    // state 85
    if (cycle == 84) begin
      PI_i_bullet_x <= 5'b00000;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b1;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 86
    if (cycle == 85) begin
      PI_i_bullet_x <= 5'b00000;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b1;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 87
    if (cycle == 86) begin
      PI_i_bullet_x <= 5'b00000;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 88
    if (cycle == 87) begin
      PI_i_bullet_x <= 5'b01110;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b1;
      PI_i_bullet_y <= 4'b0000;
    end

    // state 89
    if (cycle == 88) begin
      PI_i_bullet_x <= 5'b00111;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b1;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 90
    if (cycle == 89) begin
      PI_i_bullet_x <= 5'b00101;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b1;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 91
    if (cycle == 90) begin
      PI_i_bullet_x <= 5'b00100;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b1;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 92
    if (cycle == 91) begin
      PI_i_bullet_x <= 5'b00101;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 93
    if (cycle == 92) begin
      PI_i_bullet_x <= 5'b00100;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 94
    if (cycle == 93) begin
      PI_i_bullet_x <= 5'b00001;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b1;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 95
    if (cycle == 94) begin
      PI_i_bullet_x <= 5'b00000;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 96
    if (cycle == 95) begin
      PI_i_bullet_x <= 5'b00101;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b1;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 97
    if (cycle == 96) begin
      PI_i_bullet_x <= 5'b01000;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 98
    if (cycle == 97) begin
      PI_i_bullet_x <= 5'b00000;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 99
    if (cycle == 98) begin
      PI_i_bullet_x <= 5'b00100;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    // state 100
    if (cycle == 99) begin
      PI_i_bullet_x <= 5'b00000;
      PI_i_clk_25MHz <= 1'b0;
      PI_i_reset <= 1'b0;
      PI_i_bullet_y <= 4'b0001;
    end

    genclock <= cycle < 100;
    cycle <= cycle + 1;
  end
endmodule
