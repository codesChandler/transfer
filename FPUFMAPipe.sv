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

module FPUFMAPipe(
  input         clock,
                reset,
                io_in_valid,	// src/main/scala/tile/FPU.scala:693:14
                io_in_bits_ldst,	// src/main/scala/tile/FPU.scala:693:14
                io_in_bits_wen,	// src/main/scala/tile/FPU.scala:693:14
                io_in_bits_ren1,	// src/main/scala/tile/FPU.scala:693:14
                io_in_bits_ren2,	// src/main/scala/tile/FPU.scala:693:14
                io_in_bits_ren3,	// src/main/scala/tile/FPU.scala:693:14
                io_in_bits_swap12,	// src/main/scala/tile/FPU.scala:693:14
                io_in_bits_swap23,	// src/main/scala/tile/FPU.scala:693:14
  input  [1:0]  io_in_bits_typeTagIn,	// src/main/scala/tile/FPU.scala:693:14
                io_in_bits_typeTagOut,	// src/main/scala/tile/FPU.scala:693:14
  input         io_in_bits_fromint,	// src/main/scala/tile/FPU.scala:693:14
                io_in_bits_toint,	// src/main/scala/tile/FPU.scala:693:14
                io_in_bits_fastpipe,	// src/main/scala/tile/FPU.scala:693:14
                io_in_bits_fma,	// src/main/scala/tile/FPU.scala:693:14
                io_in_bits_div,	// src/main/scala/tile/FPU.scala:693:14
                io_in_bits_sqrt,	// src/main/scala/tile/FPU.scala:693:14
                io_in_bits_wflags,	// src/main/scala/tile/FPU.scala:693:14
  input  [2:0]  io_in_bits_rm,	// src/main/scala/tile/FPU.scala:693:14
  input  [1:0]  io_in_bits_fmaCmd,	// src/main/scala/tile/FPU.scala:693:14
                io_in_bits_typ,	// src/main/scala/tile/FPU.scala:693:14
                io_in_bits_fmt,	// src/main/scala/tile/FPU.scala:693:14
  input  [64:0] io_in_bits_in1,	// src/main/scala/tile/FPU.scala:693:14
                io_in_bits_in2,	// src/main/scala/tile/FPU.scala:693:14
                io_in_bits_in3,	// src/main/scala/tile/FPU.scala:693:14
  output [64:0] io_out_bits_data,	// src/main/scala/tile/FPU.scala:693:14
  output [4:0]  io_out_bits_exc	// src/main/scala/tile/FPU.scala:693:14
);

  wire [4:0]  res_exc;	// src/main/scala/tile/FPU.scala:719:17
  wire [64:0] res_data;	// src/main/scala/tile/FPU.scala:719:17
  wire [32:0] _fma_io_out;	// src/main/scala/tile/FPU.scala:710:19
  wire        io_in_valid_0 = io_in_valid;
  wire        io_in_bits_ldst_0 = io_in_bits_ldst;
  wire        io_in_bits_wen_0 = io_in_bits_wen;
  wire        io_in_bits_ren1_0 = io_in_bits_ren1;
  wire        io_in_bits_ren2_0 = io_in_bits_ren2;
  wire        io_in_bits_ren3_0 = io_in_bits_ren3;
  wire        io_in_bits_swap12_0 = io_in_bits_swap12;
  wire        io_in_bits_swap23_0 = io_in_bits_swap23;
  wire [1:0]  io_in_bits_typeTagIn_0 = io_in_bits_typeTagIn;
  wire [1:0]  io_in_bits_typeTagOut_0 = io_in_bits_typeTagOut;
  wire        io_in_bits_fromint_0 = io_in_bits_fromint;
  wire        io_in_bits_toint_0 = io_in_bits_toint;
  wire        io_in_bits_fastpipe_0 = io_in_bits_fastpipe;
  wire        io_in_bits_fma_0 = io_in_bits_fma;
  wire        io_in_bits_div_0 = io_in_bits_div;
  wire        io_in_bits_sqrt_0 = io_in_bits_sqrt;
  wire        io_in_bits_wflags_0 = io_in_bits_wflags;
  wire [2:0]  io_in_bits_rm_0 = io_in_bits_rm;
  wire [1:0]  io_in_bits_fmaCmd_0 = io_in_bits_fmaCmd;
  wire [1:0]  io_in_bits_typ_0 = io_in_bits_typ;
  wire [1:0]  io_in_bits_fmt_0 = io_in_bits_fmt;
  wire [64:0] io_in_bits_in1_0 = io_in_bits_in1;
  wire [64:0] io_in_bits_in2_0 = io_in_bits_in2;
  wire [64:0] io_in_bits_in3_0 = io_in_bits_in3;
  wire [31:0] one = 32'h80000000;	// src/main/scala/tile/FPU.scala:701:19
  wire        io_out_out_valid;	// src/main/scala/chisel3/util/Valid.scala:123:21
  wire [64:0] io_out_out_bits_data;	// src/main/scala/chisel3/util/Valid.scala:123:21
  wire [4:0]  io_out_out_bits_exc;	// src/main/scala/chisel3/util/Valid.scala:123:21
  reg         valid;	// src/main/scala/tile/FPU.scala:698:22
  reg         in_ldst;	// src/main/scala/tile/FPU.scala:699:15
  reg         in_wen;	// src/main/scala/tile/FPU.scala:699:15
  reg         in_ren1;	// src/main/scala/tile/FPU.scala:699:15
  reg         in_ren2;	// src/main/scala/tile/FPU.scala:699:15
  reg         in_ren3;	// src/main/scala/tile/FPU.scala:699:15
  reg         in_swap12;	// src/main/scala/tile/FPU.scala:699:15
  reg         in_swap23;	// src/main/scala/tile/FPU.scala:699:15
  reg  [1:0]  in_typeTagIn;	// src/main/scala/tile/FPU.scala:699:15
  reg  [1:0]  in_typeTagOut;	// src/main/scala/tile/FPU.scala:699:15
  reg         in_fromint;	// src/main/scala/tile/FPU.scala:699:15
  reg         in_toint;	// src/main/scala/tile/FPU.scala:699:15
  reg         in_fastpipe;	// src/main/scala/tile/FPU.scala:699:15
  reg         in_fma;	// src/main/scala/tile/FPU.scala:699:15
  reg         in_div;	// src/main/scala/tile/FPU.scala:699:15
  reg         in_sqrt;	// src/main/scala/tile/FPU.scala:699:15
  reg         in_wflags;	// src/main/scala/tile/FPU.scala:699:15
  reg  [2:0]  in_rm;	// src/main/scala/tile/FPU.scala:699:15
  reg  [1:0]  in_fmaCmd;	// src/main/scala/tile/FPU.scala:699:15
  reg  [1:0]  in_typ;	// src/main/scala/tile/FPU.scala:699:15
  reg  [1:0]  in_fmt;	// src/main/scala/tile/FPU.scala:699:15
  reg  [64:0] in_in1;	// src/main/scala/tile/FPU.scala:699:15
  reg  [64:0] in_in2;	// src/main/scala/tile/FPU.scala:699:15
  reg  [64:0] in_in3;	// src/main/scala/tile/FPU.scala:699:15
  wire [64:0] zero =
    {32'h0, (io_in_bits_in1_0[32:0] ^ io_in_bits_in2_0[32:0]) & 33'h100000000};	// src/main/scala/tile/FPU.scala:702:{32,50,57}
  assign io_out_out_bits_data = res_data;	// src/main/scala/chisel3/util/Valid.scala:123:21, src/main/scala/tile/FPU.scala:719:17
  assign io_out_out_bits_exc = res_exc;	// src/main/scala/chisel3/util/Valid.scala:123:21, src/main/scala/tile/FPU.scala:719:17
  assign res_data = {32'h0, _fma_io_out};	// src/main/scala/tile/FPU.scala:702:50, :710:19, :719:17, :720:12
  wire        io_out_valid = io_out_out_valid;	// src/main/scala/chisel3/util/Valid.scala:123:21
  wire [64:0] io_out_bits_data_0 = io_out_out_bits_data;	// src/main/scala/chisel3/util/Valid.scala:123:21
  wire [4:0]  io_out_bits_exc_0 = io_out_out_bits_exc;	// src/main/scala/chisel3/util/Valid.scala:123:21
  always @(posedge clock) begin
    valid <= io_in_valid_0;	// src/main/scala/tile/FPU.scala:698:22
    if (io_in_valid_0) begin
      in_ldst <= io_in_bits_ldst_0;	// src/main/scala/tile/FPU.scala:699:15
      in_wen <= io_in_bits_wen_0;	// src/main/scala/tile/FPU.scala:699:15
      in_ren1 <= io_in_bits_ren1_0;	// src/main/scala/tile/FPU.scala:699:15
      in_ren2 <= io_in_bits_ren2_0;	// src/main/scala/tile/FPU.scala:699:15
      in_ren3 <= io_in_bits_ren3_0;	// src/main/scala/tile/FPU.scala:699:15
      in_swap12 <= io_in_bits_swap12_0;	// src/main/scala/tile/FPU.scala:699:15
      in_swap23 <= io_in_bits_swap23_0;	// src/main/scala/tile/FPU.scala:699:15
      in_typeTagIn <= io_in_bits_typeTagIn_0;	// src/main/scala/tile/FPU.scala:699:15
      in_typeTagOut <= io_in_bits_typeTagOut_0;	// src/main/scala/tile/FPU.scala:699:15
      in_fromint <= io_in_bits_fromint_0;	// src/main/scala/tile/FPU.scala:699:15
      in_toint <= io_in_bits_toint_0;	// src/main/scala/tile/FPU.scala:699:15
      in_fastpipe <= io_in_bits_fastpipe_0;	// src/main/scala/tile/FPU.scala:699:15
      in_fma <= io_in_bits_fma_0;	// src/main/scala/tile/FPU.scala:699:15
      in_div <= io_in_bits_div_0;	// src/main/scala/tile/FPU.scala:699:15
      in_sqrt <= io_in_bits_sqrt_0;	// src/main/scala/tile/FPU.scala:699:15
      in_wflags <= io_in_bits_wflags_0;	// src/main/scala/tile/FPU.scala:699:15
      in_rm <= io_in_bits_rm_0;	// src/main/scala/tile/FPU.scala:699:15
      in_fmaCmd <= io_in_bits_fmaCmd_0;	// src/main/scala/tile/FPU.scala:699:15
      in_typ <= io_in_bits_typ_0;	// src/main/scala/tile/FPU.scala:699:15
      in_fmt <= io_in_bits_fmt_0;	// src/main/scala/tile/FPU.scala:699:15
      in_in1 <= io_in_bits_in1_0;	// src/main/scala/tile/FPU.scala:699:15
      in_in2 <= io_in_bits_swap23_0 ? 65'h80000000 : io_in_bits_in2_0;	// src/main/scala/tile/FPU.scala:699:15, :705:8, :706:{23,32}
      in_in3 <= io_in_bits_ren3_0 | io_in_bits_swap23_0 ? io_in_bits_in3_0 : zero;	// src/main/scala/tile/FPU.scala:699:15, :702:50, :705:8, :707:{21,37,46}
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin
      automatic logic [31:0] _RANDOM[0:6];
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [2:0] i = 3'h0; i < 3'h7; i += 3'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        valid = _RANDOM[3'h0][0];	// src/main/scala/tile/FPU.scala:698:22
        in_ldst = _RANDOM[3'h0][1];	// src/main/scala/tile/FPU.scala:698:22, :699:15
        in_wen = _RANDOM[3'h0][2];	// src/main/scala/tile/FPU.scala:698:22, :699:15
        in_ren1 = _RANDOM[3'h0][3];	// src/main/scala/tile/FPU.scala:698:22, :699:15
        in_ren2 = _RANDOM[3'h0][4];	// src/main/scala/tile/FPU.scala:698:22, :699:15
        in_ren3 = _RANDOM[3'h0][5];	// src/main/scala/tile/FPU.scala:698:22, :699:15
        in_swap12 = _RANDOM[3'h0][6];	// src/main/scala/tile/FPU.scala:698:22, :699:15
        in_swap23 = _RANDOM[3'h0][7];	// src/main/scala/tile/FPU.scala:698:22, :699:15
        in_typeTagIn = _RANDOM[3'h0][9:8];	// src/main/scala/tile/FPU.scala:698:22, :699:15
        in_typeTagOut = _RANDOM[3'h0][11:10];	// src/main/scala/tile/FPU.scala:698:22, :699:15
        in_fromint = _RANDOM[3'h0][12];	// src/main/scala/tile/FPU.scala:698:22, :699:15
        in_toint = _RANDOM[3'h0][13];	// src/main/scala/tile/FPU.scala:698:22, :699:15
        in_fastpipe = _RANDOM[3'h0][14];	// src/main/scala/tile/FPU.scala:698:22, :699:15
        in_fma = _RANDOM[3'h0][15];	// src/main/scala/tile/FPU.scala:698:22, :699:15
        in_div = _RANDOM[3'h0][16];	// src/main/scala/tile/FPU.scala:698:22, :699:15
        in_sqrt = _RANDOM[3'h0][17];	// src/main/scala/tile/FPU.scala:698:22, :699:15
        in_wflags = _RANDOM[3'h0][18];	// src/main/scala/tile/FPU.scala:698:22, :699:15
        in_rm = _RANDOM[3'h0][21:19];	// src/main/scala/tile/FPU.scala:698:22, :699:15
        in_fmaCmd = _RANDOM[3'h0][23:22];	// src/main/scala/tile/FPU.scala:698:22, :699:15
        in_typ = _RANDOM[3'h0][25:24];	// src/main/scala/tile/FPU.scala:698:22, :699:15
        in_fmt = _RANDOM[3'h0][27:26];	// src/main/scala/tile/FPU.scala:698:22, :699:15
        in_in1 = {_RANDOM[3'h0][31:28], _RANDOM[3'h1], _RANDOM[3'h2][28:0]};	// src/main/scala/tile/FPU.scala:698:22, :699:15
        in_in2 = {_RANDOM[3'h2][31:29], _RANDOM[3'h3], _RANDOM[3'h4][29:0]};	// src/main/scala/tile/FPU.scala:699:15
        in_in3 = {_RANDOM[3'h4][31:30], _RANDOM[3'h5], _RANDOM[3'h6][30:0]};	// src/main/scala/tile/FPU.scala:699:15
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  MulAddRecFNPipe fma (	// src/main/scala/tile/FPU.scala:710:19
    .clock             (clock),
    .reset             (reset),
    .io_validin        (valid),	// src/main/scala/tile/FPU.scala:698:22
    .io_op             (in_fmaCmd),	// src/main/scala/tile/FPU.scala:699:15
    .io_a              (in_in1[32:0]),	// src/main/scala/tile/FPU.scala:699:15, :715:12
    .io_b              (in_in2[32:0]),	// src/main/scala/tile/FPU.scala:699:15, :716:12
    .io_c              (in_in3[32:0]),	// src/main/scala/tile/FPU.scala:699:15, :717:12
    .io_roundingMode   (in_rm),	// src/main/scala/tile/FPU.scala:699:15
    .io_out            (_fma_io_out),
    .io_exceptionFlags (res_exc),
    .io_validout       (io_out_out_valid)
  );
  assign io_out_bits_data = io_out_bits_data_0;
  assign io_out_bits_exc = io_out_bits_exc_0;
endmodule

