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

module RecFNToIN_1(
  input  [64:0] io_in,	// hardfloat/hardfloat/src/main/scala/RecFNToIN.scala:48:16
  input  [2:0]  io_roundingMode,	// hardfloat/hardfloat/src/main/scala/RecFNToIN.scala:48:16
  input         io_signedOut,	// hardfloat/hardfloat/src/main/scala/RecFNToIN.scala:48:16
  output [2:0]  io_intExceptionFlags	// hardfloat/hardfloat/src/main/scala/RecFNToIN.scala:48:16
);

  wire [64:0] io_in_0 = io_in;
  wire [2:0]  io_roundingMode_0 = io_roundingMode;
  wire        io_signedOut_0 = io_signedOut;
  wire [11:0] rawIn_exp = io_in_0[63:52];	// hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:51:21
  wire        rawIn_isZero = rawIn_exp[11:9] == 3'h0;	// hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:51:21, :52:{28,53}
  wire        rawIn_isZero_0 = rawIn_isZero;	// hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:52:53, :55:23
  wire        rawIn_isSpecial = &(rawIn_exp[11:10]);	// hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:51:21, :53:{28,53}
  wire        rawIn_isNaN = rawIn_isSpecial & rawIn_exp[9];	// hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:51:21, :53:53, :55:23, :56:{33,41}
  wire        rawIn_isInf = rawIn_isSpecial & ~(rawIn_exp[9]);	// hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:51:21, :53:53, :55:23, :56:41, :57:{33,36}
  wire        rawIn_sign = io_in_0[64];	// hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23, :59:25
  wire [12:0] rawIn_sExp = {1'h0, rawIn_exp};	// hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:51:21, :52:53, :55:23, :60:27
  wire [53:0] rawIn_sig = {1'h0, ~rawIn_isZero, io_in_0[51:0]};	// hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:52:53, :55:23, :61:{35,44,49}
  wire        magGeOne = rawIn_sExp[11];	// hardfloat/hardfloat/src/main/scala/RecFNToIN.scala:60:30, hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire [10:0] posExp = rawIn_sExp[10:0];	// hardfloat/hardfloat/src/main/scala/RecFNToIN.scala:61:28, hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire        magJustBelowOne = ~magGeOne & (&posExp);	// hardfloat/hardfloat/src/main/scala/RecFNToIN.scala:60:30, :61:28, :62:{27,37,47}
  wire        roundingMode_near_even = io_roundingMode_0 == 3'h0;	// hardfloat/hardfloat/src/main/scala/RecFNToIN.scala:66:53, hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:52:53
  wire        roundingMode_minMag = io_roundingMode_0 == 3'h1;	// hardfloat/hardfloat/src/main/scala/RecFNToIN.scala:67:53
  wire        roundingMode_min = io_roundingMode_0 == 3'h2;	// hardfloat/hardfloat/src/main/scala/RecFNToIN.scala:68:53
  wire        roundingMode_max = io_roundingMode_0 == 3'h3;	// hardfloat/hardfloat/src/main/scala/RecFNToIN.scala:69:53
  wire        roundingMode_near_maxMag = io_roundingMode_0 == 3'h4;	// hardfloat/hardfloat/src/main/scala/RecFNToIN.scala:70:53
  wire        roundingMode_odd = io_roundingMode_0 == 3'h6;	// hardfloat/hardfloat/src/main/scala/RecFNToIN.scala:71:53
  wire [83:0] shiftedSig =
    {31'h0, magGeOne, rawIn_sig[51:0]} << (magGeOne ? rawIn_sExp[4:0] : 5'h0);	// hardfloat/hardfloat/src/main/scala/RecFNToIN.scala:60:30, :82:{31,49}, :83:16, :84:27, :142:12, hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire [33:0] alignedSig = {shiftedSig[83:51], |(shiftedSig[50:0])};	// hardfloat/hardfloat/src/main/scala/RecFNToIN.scala:82:49, :88:{20,38,51,69}
  wire [31:0] unroundedInt = alignedSig[33:2];	// hardfloat/hardfloat/src/main/scala/RecFNToIN.scala:88:38, :89:{40,52}
  wire        common_inexact = magGeOne ? (|(alignedSig[1:0])) : ~rawIn_isZero_0;	// hardfloat/hardfloat/src/main/scala/RecFNToIN.scala:60:30, :88:38, :91:{29,50,57,62}, hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire        roundIncr_near_even =
    magGeOne & ((&(alignedSig[2:1])) | (&(alignedSig[1:0]))) | magJustBelowOne
    & (|(alignedSig[1:0]));	// hardfloat/hardfloat/src/main/scala/RecFNToIN.scala:60:30, :62:37, :88:38, :91:50, :93:{25,39,46,51,71,78}, :94:{26,46}
  wire        roundIncr_near_maxMag = magGeOne & alignedSig[1] | magJustBelowOne;	// hardfloat/hardfloat/src/main/scala/RecFNToIN.scala:60:30, :62:37, :88:38, :95:{43,56,61}
  wire        roundIncr =
    roundingMode_near_even & roundIncr_near_even | roundingMode_near_maxMag
    & roundIncr_near_maxMag | (roundingMode_min | roundingMode_odd) & rawIn_sign
    & common_inexact | roundingMode_max & ~rawIn_sign & common_inexact;	// hardfloat/hardfloat/src/main/scala/RecFNToIN.scala:66:53, :68:53, :69:53, :70:53, :71:53, :91:29, :93:78, :95:61, :97:35, :98:35, :99:{28,49}, :100:46, :101:{27,31}, hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire [31:0] complUnroundedInt = {32{rawIn_sign}} ^ unroundedInt;	// hardfloat/hardfloat/src/main/scala/RecFNToIN.scala:89:40, :102:32, hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire [31:0] _roundedInt_T_3 =
    roundIncr ^ rawIn_sign ? complUnroundedInt + 32'h1 : complUnroundedInt;	// hardfloat/hardfloat/src/main/scala/RecFNToIN.scala:100:46, :102:32, :104:{12,23}, :105:31, hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire [31:0] roundedInt =
    {_roundedInt_T_3[31:1], _roundedInt_T_3[0] | roundingMode_odd & common_inexact};	// hardfloat/hardfloat/src/main/scala/RecFNToIN.scala:71:53, :91:29, :104:12, :107:{11,31}
  wire        magGeOne_atOverflowEdge = posExp == 11'h1F;	// hardfloat/hardfloat/src/main/scala/RecFNToIN.scala:61:28, :109:43
  wire        roundCarryBut2 = (&(unroundedInt[29:0])) & roundIncr;	// hardfloat/hardfloat/src/main/scala/RecFNToIN.scala:89:40, :100:46, :112:{38,56,61}
  wire        common_overflow =
    magGeOne
      ? (|(posExp[10:5]))
        | (io_signedOut_0
             ? (rawIn_sign
                  ? magGeOne_atOverflowEdge & ((|(unroundedInt[30:0])) | roundIncr)
                  : magGeOne_atOverflowEdge | posExp == 11'h1E & roundCarryBut2)
             : rawIn_sign | magGeOne_atOverflowEdge & unroundedInt[30] & roundCarryBut2)
      : ~io_signedOut_0 & rawIn_sign & roundIncr;	// hardfloat/hardfloat/src/main/scala/RecFNToIN.scala:60:30, :61:28, :89:40, :100:46, :109:43, :112:61, :114:12, :115:{21,36}, :116:20, :117:24, :118:49, :119:{42,60,64}, :120:49, :121:{38,60}, :123:32, :125:{42,57}, :127:{13,41}, hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire        invalidExc = rawIn_isNaN | rawIn_isInf;	// hardfloat/hardfloat/src/main/scala/RecFNToIN.scala:132:34, hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire        overflow = ~invalidExc & common_overflow;	// hardfloat/hardfloat/src/main/scala/RecFNToIN.scala:114:12, :132:34, :133:{20,32}
  wire        inexact = ~invalidExc & ~common_overflow & common_inexact;	// hardfloat/hardfloat/src/main/scala/RecFNToIN.scala:91:29, :114:12, :132:34, :133:20, :134:{35,52}
  wire        excSign = ~rawIn_isNaN & rawIn_sign;	// hardfloat/hardfloat/src/main/scala/RecFNToIN.scala:136:{19,32}, hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire [31:0] excOut = {io_signedOut_0 == excSign, {31{~excSign}}};	// hardfloat/hardfloat/src/main/scala/RecFNToIN.scala:136:32, :138:27, :141:11, :142:{12,13}
  wire [31:0] io_out = invalidExc | common_overflow ? excOut : roundedInt;	// hardfloat/hardfloat/src/main/scala/RecFNToIN.scala:107:11, :114:12, :132:34, :141:11, :144:{18,30}
  wire [2:0]  io_intExceptionFlags_0 = {invalidExc, overflow, inexact};	// hardfloat/hardfloat/src/main/scala/RecFNToIN.scala:132:34, :133:32, :134:52, :145:52
  assign io_intExceptionFlags = io_intExceptionFlags_0;
endmodule

