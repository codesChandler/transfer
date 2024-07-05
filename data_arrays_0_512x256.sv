// Generated by CIRCT firtool-1.62.0
// Standard header to adapt well known macros for register randomization.
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_MEM_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_MEM_INIT
`endif // not def RANDOMIZE
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_REG_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_REG_INIT
`endif // not def RANDOMIZE

// RANDOM may be set to an expression that produces a 32-bit random unsigned value.
`ifndef RANDOM
  `define RANDOM $random
`endif // not def RANDOM

// Users can define INIT_RANDOM as general code that gets injected into the
// initializer block for modules with registers.
`ifndef INIT_RANDOM
  `define INIT_RANDOM
`endif // not def INIT_RANDOM

// If using random initialization, you can also define RANDOMIZE_DELAY to
// customize the delay used, otherwise 0.002 is used.
`ifndef RANDOMIZE_DELAY
  `define RANDOMIZE_DELAY 0.002
`endif // not def RANDOMIZE_DELAY

// Define INIT_RANDOM_PROLOG_ for use in our modules below.
`ifndef INIT_RANDOM_PROLOG_
  `ifdef RANDOMIZE
    `ifdef VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM
    `else  // VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM #`RANDOMIZE_DELAY begin end
    `endif // VERILATOR
  `else  // RANDOMIZE
    `define INIT_RANDOM_PROLOG_
  `endif // RANDOMIZE
`endif // not def INIT_RANDOM_PROLOG_

// Include register initializers in init blocks unless synthesis is set
`ifndef SYNTHESIS
  `ifndef ENABLE_INITIAL_REG_
    `define ENABLE_INITIAL_REG_
  `endif // not def ENABLE_INITIAL_REG_
`endif // not def SYNTHESIS

// Include rmemory initializers in init blocks unless synthesis is set
`ifndef SYNTHESIS
  `ifndef ENABLE_INITIAL_MEM_
    `define ENABLE_INITIAL_MEM_
  `endif // not def ENABLE_INITIAL_MEM_
`endif // not def SYNTHESIS

// Standard header to adapt well known macros for prints and assertions.

// Users can define 'PRINTF_COND' to add an extra gate to prints.
`ifndef PRINTF_COND_
  `ifdef PRINTF_COND
    `define PRINTF_COND_ (`PRINTF_COND)
  `else  // PRINTF_COND
    `define PRINTF_COND_ 1
  `endif // PRINTF_COND
`endif // not def PRINTF_COND_

// Users can define 'ASSERT_VERBOSE_COND' to add an extra gate to assert error printing.
`ifndef ASSERT_VERBOSE_COND_
  `ifdef ASSERT_VERBOSE_COND
    `define ASSERT_VERBOSE_COND_ (`ASSERT_VERBOSE_COND)
  `else  // ASSERT_VERBOSE_COND
    `define ASSERT_VERBOSE_COND_ 1
  `endif // ASSERT_VERBOSE_COND
`endif // not def ASSERT_VERBOSE_COND_

// Users can define 'STOP_COND' to add an extra gate to stop conditions.
`ifndef STOP_COND_
  `ifdef STOP_COND
    `define STOP_COND_ (`STOP_COND)
  `else  // STOP_COND
    `define STOP_COND_ 1
  `endif // STOP_COND
`endif // not def STOP_COND_

// VCS coverage exclude_file
module data_arrays_0_512x256(	// src/main/scala/util/DescribedSRAM.scala:17:26
  input  [8:0]   RW0_addr,
  input          RW0_en,
                 RW0_clk,
                 RW0_wmode,
  input  [255:0] RW0_wdata,
  output [255:0] RW0_rdata,
  input  [31:0]  RW0_wmask
);

  reg [255:0] Memory[0:511];	// src/main/scala/util/DescribedSRAM.scala:17:26
  reg [8:0]   _RW0_raddr_d0;	// src/main/scala/util/DescribedSRAM.scala:17:26
  reg         _RW0_ren_d0;	// src/main/scala/util/DescribedSRAM.scala:17:26
  reg         _RW0_rmode_d0;	// src/main/scala/util/DescribedSRAM.scala:17:26
  always @(posedge RW0_clk) begin	// src/main/scala/util/DescribedSRAM.scala:17:26
    _RW0_raddr_d0 <= RW0_addr;	// src/main/scala/util/DescribedSRAM.scala:17:26
    _RW0_ren_d0 <= RW0_en;	// src/main/scala/util/DescribedSRAM.scala:17:26
    _RW0_rmode_d0 <= RW0_wmode;	// src/main/scala/util/DescribedSRAM.scala:17:26
    if (RW0_en & RW0_wmask[0] & RW0_wmode)	// src/main/scala/util/DescribedSRAM.scala:17:26
      Memory[RW0_addr][32'h0 +: 8] <= RW0_wdata[7:0];	// src/main/scala/util/DescribedSRAM.scala:17:26
    if (RW0_en & RW0_wmask[1] & RW0_wmode)	// src/main/scala/util/DescribedSRAM.scala:17:26
      Memory[RW0_addr][32'h8 +: 8] <= RW0_wdata[15:8];	// src/main/scala/util/DescribedSRAM.scala:17:26
    if (RW0_en & RW0_wmask[2] & RW0_wmode)	// src/main/scala/util/DescribedSRAM.scala:17:26
      Memory[RW0_addr][32'h10 +: 8] <= RW0_wdata[23:16];	// src/main/scala/util/DescribedSRAM.scala:17:26
    if (RW0_en & RW0_wmask[3] & RW0_wmode)	// src/main/scala/util/DescribedSRAM.scala:17:26
      Memory[RW0_addr][32'h18 +: 8] <= RW0_wdata[31:24];	// src/main/scala/util/DescribedSRAM.scala:17:26
    if (RW0_en & RW0_wmask[4] & RW0_wmode)	// src/main/scala/util/DescribedSRAM.scala:17:26
      Memory[RW0_addr][32'h20 +: 8] <= RW0_wdata[39:32];	// src/main/scala/util/DescribedSRAM.scala:17:26
    if (RW0_en & RW0_wmask[5] & RW0_wmode)	// src/main/scala/util/DescribedSRAM.scala:17:26
      Memory[RW0_addr][32'h28 +: 8] <= RW0_wdata[47:40];	// src/main/scala/util/DescribedSRAM.scala:17:26
    if (RW0_en & RW0_wmask[6] & RW0_wmode)	// src/main/scala/util/DescribedSRAM.scala:17:26
      Memory[RW0_addr][32'h30 +: 8] <= RW0_wdata[55:48];	// src/main/scala/util/DescribedSRAM.scala:17:26
    if (RW0_en & RW0_wmask[7] & RW0_wmode)	// src/main/scala/util/DescribedSRAM.scala:17:26
      Memory[RW0_addr][32'h38 +: 8] <= RW0_wdata[63:56];	// src/main/scala/util/DescribedSRAM.scala:17:26
    if (RW0_en & RW0_wmask[8] & RW0_wmode)	// src/main/scala/util/DescribedSRAM.scala:17:26
      Memory[RW0_addr][32'h40 +: 8] <= RW0_wdata[71:64];	// src/main/scala/util/DescribedSRAM.scala:17:26
    if (RW0_en & RW0_wmask[9] & RW0_wmode)	// src/main/scala/util/DescribedSRAM.scala:17:26
      Memory[RW0_addr][32'h48 +: 8] <= RW0_wdata[79:72];	// src/main/scala/util/DescribedSRAM.scala:17:26
    if (RW0_en & RW0_wmask[10] & RW0_wmode)	// src/main/scala/util/DescribedSRAM.scala:17:26
      Memory[RW0_addr][32'h50 +: 8] <= RW0_wdata[87:80];	// src/main/scala/util/DescribedSRAM.scala:17:26
    if (RW0_en & RW0_wmask[11] & RW0_wmode)	// src/main/scala/util/DescribedSRAM.scala:17:26
      Memory[RW0_addr][32'h58 +: 8] <= RW0_wdata[95:88];	// src/main/scala/util/DescribedSRAM.scala:17:26
    if (RW0_en & RW0_wmask[12] & RW0_wmode)	// src/main/scala/util/DescribedSRAM.scala:17:26
      Memory[RW0_addr][32'h60 +: 8] <= RW0_wdata[103:96];	// src/main/scala/util/DescribedSRAM.scala:17:26
    if (RW0_en & RW0_wmask[13] & RW0_wmode)	// src/main/scala/util/DescribedSRAM.scala:17:26
      Memory[RW0_addr][32'h68 +: 8] <= RW0_wdata[111:104];	// src/main/scala/util/DescribedSRAM.scala:17:26
    if (RW0_en & RW0_wmask[14] & RW0_wmode)	// src/main/scala/util/DescribedSRAM.scala:17:26
      Memory[RW0_addr][32'h70 +: 8] <= RW0_wdata[119:112];	// src/main/scala/util/DescribedSRAM.scala:17:26
    if (RW0_en & RW0_wmask[15] & RW0_wmode)	// src/main/scala/util/DescribedSRAM.scala:17:26
      Memory[RW0_addr][32'h78 +: 8] <= RW0_wdata[127:120];	// src/main/scala/util/DescribedSRAM.scala:17:26
    if (RW0_en & RW0_wmask[16] & RW0_wmode)	// src/main/scala/util/DescribedSRAM.scala:17:26
      Memory[RW0_addr][32'h80 +: 8] <= RW0_wdata[135:128];	// src/main/scala/util/DescribedSRAM.scala:17:26
    if (RW0_en & RW0_wmask[17] & RW0_wmode)	// src/main/scala/util/DescribedSRAM.scala:17:26
      Memory[RW0_addr][32'h88 +: 8] <= RW0_wdata[143:136];	// src/main/scala/util/DescribedSRAM.scala:17:26
    if (RW0_en & RW0_wmask[18] & RW0_wmode)	// src/main/scala/util/DescribedSRAM.scala:17:26
      Memory[RW0_addr][32'h90 +: 8] <= RW0_wdata[151:144];	// src/main/scala/util/DescribedSRAM.scala:17:26
    if (RW0_en & RW0_wmask[19] & RW0_wmode)	// src/main/scala/util/DescribedSRAM.scala:17:26
      Memory[RW0_addr][32'h98 +: 8] <= RW0_wdata[159:152];	// src/main/scala/util/DescribedSRAM.scala:17:26
    if (RW0_en & RW0_wmask[20] & RW0_wmode)	// src/main/scala/util/DescribedSRAM.scala:17:26
      Memory[RW0_addr][32'hA0 +: 8] <= RW0_wdata[167:160];	// src/main/scala/util/DescribedSRAM.scala:17:26
    if (RW0_en & RW0_wmask[21] & RW0_wmode)	// src/main/scala/util/DescribedSRAM.scala:17:26
      Memory[RW0_addr][32'hA8 +: 8] <= RW0_wdata[175:168];	// src/main/scala/util/DescribedSRAM.scala:17:26
    if (RW0_en & RW0_wmask[22] & RW0_wmode)	// src/main/scala/util/DescribedSRAM.scala:17:26
      Memory[RW0_addr][32'hB0 +: 8] <= RW0_wdata[183:176];	// src/main/scala/util/DescribedSRAM.scala:17:26
    if (RW0_en & RW0_wmask[23] & RW0_wmode)	// src/main/scala/util/DescribedSRAM.scala:17:26
      Memory[RW0_addr][32'hB8 +: 8] <= RW0_wdata[191:184];	// src/main/scala/util/DescribedSRAM.scala:17:26
    if (RW0_en & RW0_wmask[24] & RW0_wmode)	// src/main/scala/util/DescribedSRAM.scala:17:26
      Memory[RW0_addr][32'hC0 +: 8] <= RW0_wdata[199:192];	// src/main/scala/util/DescribedSRAM.scala:17:26
    if (RW0_en & RW0_wmask[25] & RW0_wmode)	// src/main/scala/util/DescribedSRAM.scala:17:26
      Memory[RW0_addr][32'hC8 +: 8] <= RW0_wdata[207:200];	// src/main/scala/util/DescribedSRAM.scala:17:26
    if (RW0_en & RW0_wmask[26] & RW0_wmode)	// src/main/scala/util/DescribedSRAM.scala:17:26
      Memory[RW0_addr][32'hD0 +: 8] <= RW0_wdata[215:208];	// src/main/scala/util/DescribedSRAM.scala:17:26
    if (RW0_en & RW0_wmask[27] & RW0_wmode)	// src/main/scala/util/DescribedSRAM.scala:17:26
      Memory[RW0_addr][32'hD8 +: 8] <= RW0_wdata[223:216];	// src/main/scala/util/DescribedSRAM.scala:17:26
    if (RW0_en & RW0_wmask[28] & RW0_wmode)	// src/main/scala/util/DescribedSRAM.scala:17:26
      Memory[RW0_addr][32'hE0 +: 8] <= RW0_wdata[231:224];	// src/main/scala/util/DescribedSRAM.scala:17:26
    if (RW0_en & RW0_wmask[29] & RW0_wmode)	// src/main/scala/util/DescribedSRAM.scala:17:26
      Memory[RW0_addr][32'hE8 +: 8] <= RW0_wdata[239:232];	// src/main/scala/util/DescribedSRAM.scala:17:26
    if (RW0_en & RW0_wmask[30] & RW0_wmode)	// src/main/scala/util/DescribedSRAM.scala:17:26
      Memory[RW0_addr][32'hF0 +: 8] <= RW0_wdata[247:240];	// src/main/scala/util/DescribedSRAM.scala:17:26
    if (RW0_en & RW0_wmask[31] & RW0_wmode)	// src/main/scala/util/DescribedSRAM.scala:17:26
      Memory[RW0_addr][32'hF8 +: 8] <= RW0_wdata[255:248];	// src/main/scala/util/DescribedSRAM.scala:17:26
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_MEM_	// src/main/scala/util/DescribedSRAM.scala:17:26
    `ifdef RANDOMIZE_REG_INIT	// src/main/scala/util/DescribedSRAM.scala:17:26
      reg [31:0] _RANDOM;	// src/main/scala/util/DescribedSRAM.scala:17:26
    `endif // RANDOMIZE_REG_INIT
    reg [255:0] _RANDOM_MEM;	// src/main/scala/util/DescribedSRAM.scala:17:26
    initial begin	// src/main/scala/util/DescribedSRAM.scala:17:26
      `INIT_RANDOM_PROLOG_	// src/main/scala/util/DescribedSRAM.scala:17:26
      `ifdef RANDOMIZE_MEM_INIT	// src/main/scala/util/DescribedSRAM.scala:17:26
        for (logic [9:0] i = 10'h0; i < 10'h200; i += 10'h1) begin
          for (logic [8:0] j = 9'h0; j < 9'h100; j += 9'h20) begin
            _RANDOM_MEM[j +: 32] = `RANDOM;	// src/main/scala/util/DescribedSRAM.scala:17:26
          end	// src/main/scala/util/DescribedSRAM.scala:17:26
          Memory[i[8:0]] = _RANDOM_MEM;	// src/main/scala/util/DescribedSRAM.scala:17:26
        end	// src/main/scala/util/DescribedSRAM.scala:17:26
      `endif // RANDOMIZE_MEM_INIT
      `ifdef RANDOMIZE_REG_INIT	// src/main/scala/util/DescribedSRAM.scala:17:26
        _RANDOM = {`RANDOM};	// src/main/scala/util/DescribedSRAM.scala:17:26
        _RW0_raddr_d0 = _RANDOM[8:0];	// src/main/scala/util/DescribedSRAM.scala:17:26
        _RW0_ren_d0 = _RANDOM[9];	// src/main/scala/util/DescribedSRAM.scala:17:26
        _RW0_rmode_d0 = _RANDOM[10];	// src/main/scala/util/DescribedSRAM.scala:17:26
      `endif // RANDOMIZE_REG_INIT
    end // initial
  `endif // ENABLE_INITIAL_MEM_
  assign RW0_rdata = _RW0_ren_d0 & ~_RW0_rmode_d0 ? Memory[_RW0_raddr_d0] : 256'bx;	// src/main/scala/util/DescribedSRAM.scala:17:26
endmodule

