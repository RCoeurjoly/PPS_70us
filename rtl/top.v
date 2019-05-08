// Copyright (c) 2017-2018 Roland Coeurjoly
// This program is GPL Licensed. See LICENSE for the full license.

module top(
			     input wire  i_clk_12MHz, //input clock: 12MHz
			     output wire o_LED,
           output wire o_PPS //o_blue vga output
			     );

   wire                clk_25MHz;
   wire                o_PPS;
   wire                o_LED;

   assign o_LED = o_PPS;

   clk_25MHz_generator clk_25MHz_generator1(
					                                  .i_clk_12MHz(i_clk_12MHz),
					                                  .o_clk_25MHz(clk_25MHz)
					                                  );
   timer_1us timer_1us1(
				                          .i_clk_25MHz(clk_25MHz),
				                          .o_q(o_PPS)
				                          );
endmodule
