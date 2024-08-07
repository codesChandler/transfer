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

module INToRecFN_1(
  input         io_signedIn,	// hardfloat/hardfloat/src/main/scala/INToRecFN.scala:45:16
  input  [63:0] io_in,	// hardfloat/hardfloat/src/main/scala/INToRecFN.scala:45:16
  input  [2:0]  io_roundingMode,	// hardfloat/hardfloat/src/main/scala/INToRecFN.scala:45:16
  output [64:0] io_out,	// hardfloat/hardfloat/src/main/scala/INToRecFN.scala:45:16
  output [4:0]  io_exceptionFlags	// hardfloat/hardfloat/src/main/scala/INToRecFN.scala:45:16
);

  wire [4:0]   io_exceptionFlags_0;
  wire [64:0]  io_out_0;
  wire         io_signedIn_0 = io_signedIn;
  wire [63:0]  io_in_0 = io_in;
  wire [2:0]   io_roundingMode_0 = io_roundingMode;
  wire         io_detectTininess = 1'h1;	// hardfloat/hardfloat/src/main/scala/INToRecFN.scala:45:16, :59:15
  wire         intAsRawFloat_isNaN = 1'h0;	// hardfloat/hardfloat/src/main/scala/rawFloatFromIN.scala:52:31, :59:23
  wire         intAsRawFloat_isInf = 1'h0;	// hardfloat/hardfloat/src/main/scala/rawFloatFromIN.scala:52:31, :59:23
  wire         intAsRawFloat_sign = io_signedIn_0 & io_in_0[63];	// hardfloat/hardfloat/src/main/scala/rawFloatFromIN.scala:51:{29,34}
  wire         intAsRawFloat_sign_0 = intAsRawFloat_sign;	// hardfloat/hardfloat/src/main/scala/rawFloatFromIN.scala:51:29, :59:23
  wire [63:0]  intAsRawFloat_absIn = intAsRawFloat_sign ? 64'h0 - io_in_0 : io_in_0;	// hardfloat/hardfloat/src/main/scala/rawFloatFromIN.scala:51:29, :52:{24,31}, :53:44
  wire [63:0]  intAsRawFloat_extAbsIn = intAsRawFloat_absIn;	// hardfloat/hardfloat/src/main/scala/rawFloatFromIN.scala:52:24, :53:53
  wire [5:0]   intAsRawFloat_adjustedNormDist =
    intAsRawFloat_extAbsIn[63]
      ? 6'h0
      : intAsRawFloat_extAbsIn[62]
          ? 6'h1
          : intAsRawFloat_extAbsIn[61]
              ? 6'h2
              : intAsRawFloat_extAbsIn[60]
                  ? 6'h3
                  : intAsRawFloat_extAbsIn[59]
                      ? 6'h4
                      : intAsRawFloat_extAbsIn[58]
                          ? 6'h5
                          : intAsRawFloat_extAbsIn[57]
                              ? 6'h6
                              : intAsRawFloat_extAbsIn[56]
                                  ? 6'h7
                                  : intAsRawFloat_extAbsIn[55]
                                      ? 6'h8
                                      : intAsRawFloat_extAbsIn[54]
                                          ? 6'h9
                                          : intAsRawFloat_extAbsIn[53]
                                              ? 6'hA
                                              : intAsRawFloat_extAbsIn[52]
                                                  ? 6'hB
                                                  : intAsRawFloat_extAbsIn[51]
                                                      ? 6'hC
                                                      : intAsRawFloat_extAbsIn[50]
                                                          ? 6'hD
                                                          : intAsRawFloat_extAbsIn[49]
                                                              ? 6'hE
                                                              : intAsRawFloat_extAbsIn[48]
                                                                  ? 6'hF
                                                                  : intAsRawFloat_extAbsIn[47]
                                                                      ? 6'h10
                                                                      : intAsRawFloat_extAbsIn[46]
                                                                          ? 6'h11
                                                                          : intAsRawFloat_extAbsIn[45]
                                                                              ? 6'h12
                                                                              : intAsRawFloat_extAbsIn[44]
                                                                                  ? 6'h13
                                                                                  : intAsRawFloat_extAbsIn[43]
                                                                                      ? 6'h14
                                                                                      : intAsRawFloat_extAbsIn[42]
                                                                                          ? 6'h15
                                                                                          : intAsRawFloat_extAbsIn[41]
                                                                                              ? 6'h16
                                                                                              : intAsRawFloat_extAbsIn[40]
                                                                                                  ? 6'h17
                                                                                                  : intAsRawFloat_extAbsIn[39]
                                                                                                      ? 6'h18
                                                                                                      : intAsRawFloat_extAbsIn[38]
                                                                                                          ? 6'h19
                                                                                                          : intAsRawFloat_extAbsIn[37]
                                                                                                              ? 6'h1A
                                                                                                              : intAsRawFloat_extAbsIn[36]
                                                                                                                  ? 6'h1B
                                                                                                                  : intAsRawFloat_extAbsIn[35]
                                                                                                                      ? 6'h1C
                                                                                                                      : intAsRawFloat_extAbsIn[34]
                                                                                                                          ? 6'h1D
                                                                                                                          : intAsRawFloat_extAbsIn[33]
                                                                                                                              ? 6'h1E
                                                                                                                              : intAsRawFloat_extAbsIn[32]
                                                                                                                                  ? 6'h1F
                                                                                                                                  : intAsRawFloat_extAbsIn[31]
                                                                                                                                      ? 6'h20
                                                                                                                                      : intAsRawFloat_extAbsIn[30]
                                                                                                                                          ? 6'h21
                                                                                                                                          : intAsRawFloat_extAbsIn[29]
                                                                                                                                              ? 6'h22
                                                                                                                                              : intAsRawFloat_extAbsIn[28]
                                                                                                                                                  ? 6'h23
                                                                                                                                                  : intAsRawFloat_extAbsIn[27]
                                                                                                                                                      ? 6'h24
                                                                                                                                                      : intAsRawFloat_extAbsIn[26]
                                                                                                                                                          ? 6'h25
                                                                                                                                                          : intAsRawFloat_extAbsIn[25]
                                                                                                                                                              ? 6'h26
                                                                                                                                                              : intAsRawFloat_extAbsIn[24]
                                                                                                                                                                  ? 6'h27
                                                                                                                                                                  : intAsRawFloat_extAbsIn[23]
                                                                                                                                                                      ? 6'h28
                                                                                                                                                                      : intAsRawFloat_extAbsIn[22]
                                                                                                                                                                          ? 6'h29
                                                                                                                                                                          : intAsRawFloat_extAbsIn[21]
                                                                                                                                                                              ? 6'h2A
                                                                                                                                                                              : intAsRawFloat_extAbsIn[20]
                                                                                                                                                                                  ? 6'h2B
                                                                                                                                                                                  : intAsRawFloat_extAbsIn[19]
                                                                                                                                                                                      ? 6'h2C
                                                                                                                                                                                      : intAsRawFloat_extAbsIn[18]
                                                                                                                                                                                          ? 6'h2D
                                                                                                                                                                                          : intAsRawFloat_extAbsIn[17]
                                                                                                                                                                                              ? 6'h2E
                                                                                                                                                                                              : intAsRawFloat_extAbsIn[16]
                                                                                                                                                                                                  ? 6'h2F
                                                                                                                                                                                                  : intAsRawFloat_extAbsIn[15]
                                                                                                                                                                                                      ? 6'h30
                                                                                                                                                                                                      : intAsRawFloat_extAbsIn[14]
                                                                                                                                                                                                          ? 6'h31
                                                                                                                                                                                                          : intAsRawFloat_extAbsIn[13]
                                                                                                                                                                                                              ? 6'h32
                                                                                                                                                                                                              : intAsRawFloat_extAbsIn[12]
                                                                                                                                                                                                                  ? 6'h33
                                                                                                                                                                                                                  : intAsRawFloat_extAbsIn[11]
                                                                                                                                                                                                                      ? 6'h34
                                                                                                                                                                                                                      : intAsRawFloat_extAbsIn[10]
                                                                                                                                                                                                                          ? 6'h35
                                                                                                                                                                                                                          : intAsRawFloat_extAbsIn[9]
                                                                                                                                                                                                                              ? 6'h36
                                                                                                                                                                                                                              : intAsRawFloat_extAbsIn[8]
                                                                                                                                                                                                                                  ? 6'h37
                                                                                                                                                                                                                                  : intAsRawFloat_extAbsIn[7]
                                                                                                                                                                                                                                      ? 6'h38
                                                                                                                                                                                                                                      : intAsRawFloat_extAbsIn[6]
                                                                                                                                                                                                                                          ? 6'h39
                                                                                                                                                                                                                                          : intAsRawFloat_extAbsIn[5]
                                                                                                                                                                                                                                              ? 6'h3A
                                                                                                                                                                                                                                              : intAsRawFloat_extAbsIn[4]
                                                                                                                                                                                                                                                  ? 6'h3B
                                                                                                                                                                                                                                                  : intAsRawFloat_extAbsIn[3]
                                                                                                                                                                                                                                                      ? 6'h3C
                                                                                                                                                                                                                                                      : intAsRawFloat_extAbsIn[2]
                                                                                                                                                                                                                                                          ? 6'h3D
                                                                                                                                                                                                                                                          : {5'h1F,
                                                                                                                                                                                                                                                             ~(intAsRawFloat_extAbsIn[1])};	// hardfloat/hardfloat/src/main/scala/primitives.scala:91:52, hardfloat/hardfloat/src/main/scala/rawFloatFromIN.scala:53:53, src/main/scala/chisel3/util/Mux.scala:50:70
  wire [126:0] _intAsRawFloat_sig_T =
    {63'h0, intAsRawFloat_extAbsIn} << intAsRawFloat_adjustedNormDist;	// hardfloat/hardfloat/src/main/scala/rawFloatFromIN.scala:53:53, :56:22, src/main/scala/chisel3/util/Mux.scala:50:70
  wire [63:0]  intAsRawFloat_sig = _intAsRawFloat_sig_T[63:0];	// hardfloat/hardfloat/src/main/scala/rawFloatFromIN.scala:56:{22,41}
  wire         intAsRawFloat_isZero = ~(intAsRawFloat_sig[63]);	// hardfloat/hardfloat/src/main/scala/rawFloatFromIN.scala:56:41, :59:23, :62:{23,28}
  wire [8:0]   intAsRawFloat_sExp = {3'h2, ~intAsRawFloat_adjustedNormDist};	// hardfloat/hardfloat/src/main/scala/rawFloatFromIN.scala:59:23, :64:{36,72}, src/main/scala/chisel3/util/Mux.scala:50:70
  wire [64:0]  intAsRawFloat_sig_0 = {1'h0, intAsRawFloat_sig};	// hardfloat/hardfloat/src/main/scala/rawFloatFromIN.scala:52:31, :56:41, :59:23, :65:20
  RoundAnyRawFNToRecFN_2 roundAnyRawFNToRecFN (	// hardfloat/hardfloat/src/main/scala/INToRecFN.scala:59:15
    .io_in_isZero      (intAsRawFloat_isZero),	// hardfloat/hardfloat/src/main/scala/rawFloatFromIN.scala:59:23
    .io_in_sign        (intAsRawFloat_sign_0),	// hardfloat/hardfloat/src/main/scala/rawFloatFromIN.scala:59:23
    .io_in_sExp        (intAsRawFloat_sExp),	// hardfloat/hardfloat/src/main/scala/rawFloatFromIN.scala:59:23
    .io_in_sig         (intAsRawFloat_sig_0),	// hardfloat/hardfloat/src/main/scala/rawFloatFromIN.scala:59:23
    .io_roundingMode   (io_roundingMode_0),
    .io_out            (io_out_0),
    .io_exceptionFlags (io_exceptionFlags_0)
  );
  assign io_out = io_out_0;
  assign io_exceptionFlags = io_exceptionFlags_0;
endmodule

