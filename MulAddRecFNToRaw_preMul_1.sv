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

module MulAddRecFNToRaw_preMul_1(
  input  [1:0]   io_op,	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:73:16
  input  [64:0]  io_a,	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:73:16
                 io_b,	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:73:16
                 io_c,	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:73:16
  output [52:0]  io_mulAddA,	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:73:16
                 io_mulAddB,	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:73:16
  output [105:0] io_mulAddC,	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:73:16
  output         io_toPostMul_isSigNaNAny,	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:73:16
                 io_toPostMul_isNaNAOrB,	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:73:16
                 io_toPostMul_isInfA,	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:73:16
                 io_toPostMul_isZeroA,	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:73:16
                 io_toPostMul_isInfB,	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:73:16
                 io_toPostMul_isZeroB,	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:73:16
                 io_toPostMul_signProd,	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:73:16
                 io_toPostMul_isNaNC,	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:73:16
                 io_toPostMul_isInfC,	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:73:16
                 io_toPostMul_isZeroC,	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:73:16
  output [12:0]  io_toPostMul_sExpSum,	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:73:16
  output         io_toPostMul_doSubMags,	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:73:16
                 io_toPostMul_CIsDominant,	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:73:16
  output [5:0]   io_toPostMul_CDom_CAlignDist,	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:73:16
  output [54:0]  io_toPostMul_highAlignedSigC,	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:73:16
  output         io_toPostMul_bit0AlignedSigC	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:73:16
);

  wire [1:0]   io_op_0 = io_op;
  wire [64:0]  io_a_0 = io_a;
  wire [64:0]  io_b_0 = io_b;
  wire [64:0]  io_c_0 = io_c;
  wire         rawA_isInf;	// hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire         rawA_isZero;	// hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire         rawB_isInf;	// hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire         rawB_isZero;	// hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire         signProd;	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:96:42
  wire         rawC_isNaN;	// hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire         rawC_isInf;	// hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire         rawC_isZero;	// hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire         doSubMags;	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:101:42
  wire         CIsDominant;	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:109:23
  wire [11:0]  rawA_exp = io_a_0[63:52];	// hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:51:21
  wire         rawA_isZero_0 = rawA_exp[11:9] == 3'h0;	// hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:51:21, :52:{28,53}
  assign rawA_isZero = rawA_isZero_0;	// hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:52:53, :55:23
  wire         rawA_isSpecial = &(rawA_exp[11:10]);	// hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:51:21, :53:{28,53}
  wire         io_toPostMul_isInfA_0 = rawA_isInf;	// hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire         io_toPostMul_isZeroA_0 = rawA_isZero;	// hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire         rawA_isNaN = rawA_isSpecial & rawA_exp[9];	// hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:51:21, :53:53, :55:23, :56:{33,41}
  assign rawA_isInf = rawA_isSpecial & ~(rawA_exp[9]);	// hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:51:21, :53:53, :55:23, :56:41, :57:{33,36}
  wire         rawA_sign = io_a_0[64];	// hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23, :59:25
  wire [12:0]  rawA_sExp = {1'h0, rawA_exp};	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:107:69, hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:51:21, :55:23, :60:27
  wire [53:0]  rawA_sig = {1'h0, ~rawA_isZero_0, io_a_0[51:0]};	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:107:69, hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:52:53, :55:23, :61:{35,44,49}
  wire [11:0]  rawB_exp = io_b_0[63:52];	// hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:51:21
  wire         rawB_isZero_0 = rawB_exp[11:9] == 3'h0;	// hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:51:21, :52:{28,53}
  assign rawB_isZero = rawB_isZero_0;	// hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:52:53, :55:23
  wire         rawB_isSpecial = &(rawB_exp[11:10]);	// hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:51:21, :53:{28,53}
  wire         io_toPostMul_isInfB_0 = rawB_isInf;	// hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire         io_toPostMul_isZeroB_0 = rawB_isZero;	// hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire         rawB_isNaN = rawB_isSpecial & rawB_exp[9];	// hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:51:21, :53:53, :55:23, :56:{33,41}
  assign rawB_isInf = rawB_isSpecial & ~(rawB_exp[9]);	// hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:51:21, :53:53, :55:23, :56:41, :57:{33,36}
  wire         rawB_sign = io_b_0[64];	// hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23, :59:25
  wire [12:0]  rawB_sExp = {1'h0, rawB_exp};	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:107:69, hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:51:21, :55:23, :60:27
  wire [53:0]  rawB_sig = {1'h0, ~rawB_isZero_0, io_b_0[51:0]};	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:107:69, hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:52:53, :55:23, :61:{35,44,49}
  wire [11:0]  rawC_exp = io_c_0[63:52];	// hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:51:21
  wire         rawC_isZero_0 = rawC_exp[11:9] == 3'h0;	// hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:51:21, :52:{28,53}
  assign rawC_isZero = rawC_isZero_0;	// hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:52:53, :55:23
  wire         rawC_isSpecial = &(rawC_exp[11:10]);	// hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:51:21, :53:{28,53}
  wire         io_toPostMul_isNaNC_0 = rawC_isNaN;	// hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire         io_toPostMul_isInfC_0 = rawC_isInf;	// hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire         io_toPostMul_isZeroC_0 = rawC_isZero;	// hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  assign rawC_isNaN = rawC_isSpecial & rawC_exp[9];	// hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:51:21, :53:53, :55:23, :56:{33,41}
  assign rawC_isInf = rawC_isSpecial & ~(rawC_exp[9]);	// hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:51:21, :53:53, :55:23, :56:41, :57:{33,36}
  wire         rawC_sign = io_c_0[64];	// hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23, :59:25
  wire [12:0]  rawC_sExp = {1'h0, rawC_exp};	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:107:69, hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:51:21, :55:23, :60:27
  wire [53:0]  rawC_sig = {1'h0, ~rawC_isZero_0, io_c_0[51:0]};	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:107:69, hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:52:53, :55:23, :61:{35,44,49}
  assign signProd = rawA_sign ^ rawB_sign ^ io_op_0[1];	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:96:{42,49}, hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire         io_toPostMul_signProd_0 = signProd;	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:96:42
  wire [13:0]  sExpAlignedProd =
    {rawA_sExp[12], rawA_sExp} + {rawB_sExp[12], rawB_sExp} - 14'h7C8;	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:99:{19,32}, hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  assign doSubMags = signProd ^ rawC_sign ^ io_op_0[0];	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:96:42, :101:{42,49}, hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire         io_toPostMul_doSubMags_0 = doSubMags;	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:101:42
  wire [13:0]  sNatCAlignDist = sExpAlignedProd - {rawC_sExp[12], rawC_sExp};	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:99:32, :105:42, hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire [12:0]  posNatCAlignDist = sNatCAlignDist[12:0];	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:105:42, :106:42
  wire         isMinCAlign = rawA_isZero | rawB_isZero | $signed(sNatCAlignDist) < 14'sh0;	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:105:42, :107:{50,69}, hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  assign CIsDominant = ~rawC_isZero & (isMinCAlign | posNatCAlignDist < 13'h36);	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:106:42, :107:50, :109:{9,23,39,60}, hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire         io_toPostMul_CIsDominant_0 = CIsDominant;	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:109:23
  wire [7:0]   CAlignDist =
    isMinCAlign ? 8'h0 : posNatCAlignDist < 13'hA1 ? posNatCAlignDist[7:0] : 8'hA1;	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:106:42, :107:50, :111:12, :113:{16,34}, :114:33
  wire [164:0] mainAlignedSigC =
    $signed($signed({{54{doSubMags}} ^ rawC_sig, {111{doSubMags}}}) >>> CAlignDist);	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:101:42, :111:12, :119:{13,46,53,100}, hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire         reduced4CExtra_reducedVec_0 = |(rawC_sig[3:0]);	// hardfloat/hardfloat/src/main/scala/primitives.scala:118:30, :120:{33,54}, hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire         reduced4CExtra_reducedVec_1 = |(rawC_sig[7:4]);	// hardfloat/hardfloat/src/main/scala/primitives.scala:118:30, :120:{33,54}, hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire         reduced4CExtra_reducedVec_2 = |(rawC_sig[11:8]);	// hardfloat/hardfloat/src/main/scala/primitives.scala:118:30, :120:{33,54}, hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire         reduced4CExtra_reducedVec_3 = |(rawC_sig[15:12]);	// hardfloat/hardfloat/src/main/scala/primitives.scala:118:30, :120:{33,54}, hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire         reduced4CExtra_reducedVec_4 = |(rawC_sig[19:16]);	// hardfloat/hardfloat/src/main/scala/primitives.scala:118:30, :120:{33,54}, hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire         reduced4CExtra_reducedVec_5 = |(rawC_sig[23:20]);	// hardfloat/hardfloat/src/main/scala/primitives.scala:118:30, :120:{33,54}, hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire         reduced4CExtra_reducedVec_6 = |(rawC_sig[27:24]);	// hardfloat/hardfloat/src/main/scala/primitives.scala:118:30, :120:{33,54}, hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire         reduced4CExtra_reducedVec_7 = |(rawC_sig[31:28]);	// hardfloat/hardfloat/src/main/scala/primitives.scala:118:30, :120:{33,54}, hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire         reduced4CExtra_reducedVec_8 = |(rawC_sig[35:32]);	// hardfloat/hardfloat/src/main/scala/primitives.scala:118:30, :120:{33,54}, hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire         reduced4CExtra_reducedVec_9 = |(rawC_sig[39:36]);	// hardfloat/hardfloat/src/main/scala/primitives.scala:118:30, :120:{33,54}, hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire         reduced4CExtra_reducedVec_10 = |(rawC_sig[43:40]);	// hardfloat/hardfloat/src/main/scala/primitives.scala:118:30, :120:{33,54}, hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire         reduced4CExtra_reducedVec_11 = |(rawC_sig[47:44]);	// hardfloat/hardfloat/src/main/scala/primitives.scala:118:30, :120:{33,54}, hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire         reduced4CExtra_reducedVec_12 = |(rawC_sig[51:48]);	// hardfloat/hardfloat/src/main/scala/primitives.scala:118:30, :120:{33,54}, hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire         reduced4CExtra_reducedVec_13 = |(rawC_sig[53:52]);	// hardfloat/hardfloat/src/main/scala/primitives.scala:118:30, :123:{15,57}, hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire [1:0]   reduced4CExtra_lo_lo_hi =
    {reduced4CExtra_reducedVec_2, reduced4CExtra_reducedVec_1};	// hardfloat/hardfloat/src/main/scala/primitives.scala:118:30, :124:20
  wire [2:0]   reduced4CExtra_lo_lo =
    {reduced4CExtra_lo_lo_hi, reduced4CExtra_reducedVec_0};	// hardfloat/hardfloat/src/main/scala/primitives.scala:118:30, :124:20
  wire [1:0]   reduced4CExtra_lo_hi_lo =
    {reduced4CExtra_reducedVec_4, reduced4CExtra_reducedVec_3};	// hardfloat/hardfloat/src/main/scala/primitives.scala:118:30, :124:20
  wire [1:0]   reduced4CExtra_lo_hi_hi =
    {reduced4CExtra_reducedVec_6, reduced4CExtra_reducedVec_5};	// hardfloat/hardfloat/src/main/scala/primitives.scala:118:30, :124:20
  wire [3:0]   reduced4CExtra_lo_hi = {reduced4CExtra_lo_hi_hi, reduced4CExtra_lo_hi_lo};	// hardfloat/hardfloat/src/main/scala/primitives.scala:124:20
  wire [6:0]   reduced4CExtra_lo = {reduced4CExtra_lo_hi, reduced4CExtra_lo_lo};	// hardfloat/hardfloat/src/main/scala/primitives.scala:124:20
  wire [1:0]   reduced4CExtra_hi_lo_hi =
    {reduced4CExtra_reducedVec_9, reduced4CExtra_reducedVec_8};	// hardfloat/hardfloat/src/main/scala/primitives.scala:118:30, :124:20
  wire [2:0]   reduced4CExtra_hi_lo =
    {reduced4CExtra_hi_lo_hi, reduced4CExtra_reducedVec_7};	// hardfloat/hardfloat/src/main/scala/primitives.scala:118:30, :124:20
  wire [1:0]   reduced4CExtra_hi_hi_lo =
    {reduced4CExtra_reducedVec_11, reduced4CExtra_reducedVec_10};	// hardfloat/hardfloat/src/main/scala/primitives.scala:118:30, :124:20
  wire [1:0]   reduced4CExtra_hi_hi_hi =
    {reduced4CExtra_reducedVec_13, reduced4CExtra_reducedVec_12};	// hardfloat/hardfloat/src/main/scala/primitives.scala:118:30, :124:20
  wire [3:0]   reduced4CExtra_hi_hi = {reduced4CExtra_hi_hi_hi, reduced4CExtra_hi_hi_lo};	// hardfloat/hardfloat/src/main/scala/primitives.scala:124:20
  wire [6:0]   reduced4CExtra_hi = {reduced4CExtra_hi_hi, reduced4CExtra_hi_lo};	// hardfloat/hardfloat/src/main/scala/primitives.scala:124:20
  wire [64:0]  reduced4CExtra_shift = $signed(65'sh10000000000000000 >>> CAlignDist[7:2]);	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:111:12, :123:28, hardfloat/hardfloat/src/main/scala/primitives.scala:76:56
  wire         reduced4CExtra =
    |({reduced4CExtra_hi[5:0], reduced4CExtra_lo}
      & {reduced4CExtra_shift[24],
         reduced4CExtra_shift[25],
         reduced4CExtra_shift[26],
         reduced4CExtra_shift[27],
         reduced4CExtra_shift[28],
         reduced4CExtra_shift[29],
         reduced4CExtra_shift[30],
         reduced4CExtra_shift[31],
         reduced4CExtra_shift[32],
         reduced4CExtra_shift[33],
         reduced4CExtra_shift[34],
         reduced4CExtra_shift[35],
         reduced4CExtra_shift[36]});	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:121:68, :129:11, hardfloat/hardfloat/src/main/scala/primitives.scala:76:56, :77:20, :78:22, :124:20
  wire [161:0] alignedSigC_hi = mainAlignedSigC[164:3];	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:119:100, :131:{12,28}
  wire [162:0] alignedSigC =
    {alignedSigC_hi,
     doSubMags
       ? (&(mainAlignedSigC[2:0])) & ~reduced4CExtra
       : (|(mainAlignedSigC[2:0])) | reduced4CExtra};	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:101:42, :119:100, :129:11, :131:12, :132:16, :133:{32,39,44,47}, :134:{39,44}
  wire [52:0]  io_mulAddA_0 = rawA_sig[52:0];	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:140:16, hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire [52:0]  io_mulAddB_0 = rawB_sig[52:0];	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:141:16, hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire [105:0] io_mulAddC_0 = alignedSigC[106:1];	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:131:12, :142:30
  wire         io_toPostMul_isSigNaNAny_0 =
    rawA_isNaN & ~(rawA_sig[51]) | rawB_isNaN & ~(rawB_sig[51]) | rawC_isNaN
    & ~(rawC_sig[51]);	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:145:58, hardfloat/hardfloat/src/main/scala/common.scala:82:{46,49,56}, hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire         io_toPostMul_isNaNAOrB_0 = rawA_isNaN | rawB_isNaN;	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:147:42, hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire [12:0]  io_toPostMul_sExpSum_0 =
    CIsDominant ? rawC_sExp : sExpAlignedProd[12:0] - 13'h35;	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:99:32, :109:23, :157:{12,53}, hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:55:23
  wire [5:0]   io_toPostMul_CDom_CAlignDist_0 = CAlignDist[5:0];	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:111:12, :160:47
  wire [54:0]  io_toPostMul_highAlignedSigC_0 = alignedSigC[161:107];	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:131:12, :162:20
  wire         io_toPostMul_bit0AlignedSigC_0 = alignedSigC[0];	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:131:12, :163:48
  assign io_mulAddA = io_mulAddA_0;
  assign io_mulAddB = io_mulAddB_0;
  assign io_mulAddC = io_mulAddC_0;
  assign io_toPostMul_isSigNaNAny = io_toPostMul_isSigNaNAny_0;
  assign io_toPostMul_isNaNAOrB = io_toPostMul_isNaNAOrB_0;
  assign io_toPostMul_isInfA = io_toPostMul_isInfA_0;
  assign io_toPostMul_isZeroA = io_toPostMul_isZeroA_0;
  assign io_toPostMul_isInfB = io_toPostMul_isInfB_0;
  assign io_toPostMul_isZeroB = io_toPostMul_isZeroB_0;
  assign io_toPostMul_signProd = io_toPostMul_signProd_0;
  assign io_toPostMul_isNaNC = io_toPostMul_isNaNC_0;
  assign io_toPostMul_isInfC = io_toPostMul_isInfC_0;
  assign io_toPostMul_isZeroC = io_toPostMul_isZeroC_0;
  assign io_toPostMul_sExpSum = io_toPostMul_sExpSum_0;
  assign io_toPostMul_doSubMags = io_toPostMul_doSubMags_0;
  assign io_toPostMul_CIsDominant = io_toPostMul_CIsDominant_0;
  assign io_toPostMul_CDom_CAlignDist = io_toPostMul_CDom_CAlignDist_0;
  assign io_toPostMul_highAlignedSigC = io_toPostMul_highAlignedSigC_0;
  assign io_toPostMul_bit0AlignedSigC = io_toPostMul_bit0AlignedSigC_0;
endmodule

