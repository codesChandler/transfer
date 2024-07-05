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

module MulAddRecFNToRaw_postMul(
  input         io_fromPreMul_isSigNaNAny,	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16
                io_fromPreMul_isNaNAOrB,	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16
                io_fromPreMul_isInfA,	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16
                io_fromPreMul_isZeroA,	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16
                io_fromPreMul_isInfB,	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16
                io_fromPreMul_isZeroB,	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16
                io_fromPreMul_signProd,	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16
                io_fromPreMul_isNaNC,	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16
                io_fromPreMul_isInfC,	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16
                io_fromPreMul_isZeroC,	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16
  input  [9:0]  io_fromPreMul_sExpSum,	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16
  input         io_fromPreMul_doSubMags,	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16
                io_fromPreMul_CIsDominant,	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16
  input  [4:0]  io_fromPreMul_CDom_CAlignDist,	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16
  input  [25:0] io_fromPreMul_highAlignedSigC,	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16
  input         io_fromPreMul_bit0AlignedSigC,	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16
  input  [48:0] io_mulAddResult,	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16
  input  [2:0]  io_roundingMode,	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16
  output        io_invalidExc,	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16
                io_rawOut_isNaN,	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16
                io_rawOut_isInf,	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16
                io_rawOut_isZero,	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16
                io_rawOut_sign,	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16
  output [9:0]  io_rawOut_sExp,	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16
  output [26:0] io_rawOut_sig	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16
);

  wire         io_fromPreMul_isSigNaNAny_0 = io_fromPreMul_isSigNaNAny;
  wire         io_fromPreMul_isNaNAOrB_0 = io_fromPreMul_isNaNAOrB;
  wire         io_fromPreMul_isInfA_0 = io_fromPreMul_isInfA;
  wire         io_fromPreMul_isZeroA_0 = io_fromPreMul_isZeroA;
  wire         io_fromPreMul_isInfB_0 = io_fromPreMul_isInfB;
  wire         io_fromPreMul_isZeroB_0 = io_fromPreMul_isZeroB;
  wire         io_fromPreMul_signProd_0 = io_fromPreMul_signProd;
  wire         io_fromPreMul_isNaNC_0 = io_fromPreMul_isNaNC;
  wire         io_fromPreMul_isInfC_0 = io_fromPreMul_isInfC;
  wire         io_fromPreMul_isZeroC_0 = io_fromPreMul_isZeroC;
  wire [9:0]   io_fromPreMul_sExpSum_0 = io_fromPreMul_sExpSum;
  wire         io_fromPreMul_doSubMags_0 = io_fromPreMul_doSubMags;
  wire         io_fromPreMul_CIsDominant_0 = io_fromPreMul_CIsDominant;
  wire [4:0]   io_fromPreMul_CDom_CAlignDist_0 = io_fromPreMul_CDom_CAlignDist;
  wire [25:0]  io_fromPreMul_highAlignedSigC_0 = io_fromPreMul_highAlignedSigC;
  wire         io_fromPreMul_bit0AlignedSigC_0 = io_fromPreMul_bit0AlignedSigC;
  wire [48:0]  io_mulAddResult_0 = io_mulAddResult;
  wire [2:0]   io_roundingMode_0 = io_roundingMode;
  wire         notNaN_isInfOut;	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:263:44
  wire         roundingMode_min = io_roundingMode_0 == 3'h2;	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:184:45
  wire         opSignC = io_fromPreMul_signProd_0 ^ io_fromPreMul_doSubMags_0;	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:188:42
  wire [73:0]  sigSum_hi =
    {io_mulAddResult_0[48]
       ? io_fromPreMul_highAlignedSigC_0 + 26'h1
       : io_fromPreMul_highAlignedSigC_0,
     io_mulAddResult_0[47:0]};	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:190:{12,16,32}, :191:47, :194:28
  wire [74:0]  sigSum = {sigSum_hi, io_fromPreMul_bit0AlignedSigC_0};	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:190:12
  wire [9:0]   CDom_sExp = io_fromPreMul_sExpSum_0 - {9'h0, io_fromPreMul_doSubMags_0};	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:201:43
  wire [49:0]  CDom_absSigSum =
    io_fromPreMul_doSubMags_0
      ? ~(sigSum[74:25])
      : {1'h0, io_fromPreMul_highAlignedSigC_0[25:24], sigSum[72:26]};	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:190:12, :203:12, :204:{13,20}, :205:22, :207:{46,71}, :208:23
  wire         CDom_absSigSumExtra =
    io_fromPreMul_doSubMags_0 ? sigSum[24:1] != 24'hFFFFFF : (|(sigSum[25:1]));	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:190:12, :212:12, :213:{14,21,36}, :214:{19,37}
  wire [80:0]  _CDom_mainSig_T =
    {31'h0, CDom_absSigSum} << io_fromPreMul_CDom_CAlignDist_0;	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:203:12, :217:24
  wire [28:0]  CDom_mainSig = _CDom_mainSig_T[49:21];	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:217:{24,56}
  wire         CDom_reduced4SigExtra_reducedVec_0 = CDom_absSigSum[0];	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:203:12, hardfloat/hardfloat/src/main/scala/primitives.scala:118:30, :120:33
  wire         CDom_reduced4SigExtra_reducedVec_1 = |(CDom_absSigSum[4:1]);	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:203:12, hardfloat/hardfloat/src/main/scala/primitives.scala:118:30, :120:{33,54}
  wire         CDom_reduced4SigExtra_reducedVec_2 = |(CDom_absSigSum[8:5]);	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:203:12, hardfloat/hardfloat/src/main/scala/primitives.scala:118:30, :120:{33,54}
  wire         CDom_reduced4SigExtra_reducedVec_3 = |(CDom_absSigSum[12:9]);	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:203:12, hardfloat/hardfloat/src/main/scala/primitives.scala:118:30, :120:{33,54}
  wire         CDom_reduced4SigExtra_reducedVec_4 = |(CDom_absSigSum[16:13]);	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:203:12, hardfloat/hardfloat/src/main/scala/primitives.scala:118:30, :120:{33,54}
  wire         CDom_reduced4SigExtra_reducedVec_5 = |(CDom_absSigSum[20:17]);	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:203:12, hardfloat/hardfloat/src/main/scala/primitives.scala:118:30, :120:{33,54}
  wire         CDom_reduced4SigExtra_reducedVec_6 = |(CDom_absSigSum[23:21]);	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:203:12, hardfloat/hardfloat/src/main/scala/primitives.scala:118:30, :123:{15,57}
  wire [1:0]   CDom_reduced4SigExtra_lo_hi =
    {CDom_reduced4SigExtra_reducedVec_2, CDom_reduced4SigExtra_reducedVec_1};	// hardfloat/hardfloat/src/main/scala/primitives.scala:118:30, :124:20
  wire [2:0]   CDom_reduced4SigExtra_lo =
    {CDom_reduced4SigExtra_lo_hi, CDom_reduced4SigExtra_reducedVec_0};	// hardfloat/hardfloat/src/main/scala/primitives.scala:118:30, :124:20
  wire [1:0]   CDom_reduced4SigExtra_hi_lo =
    {CDom_reduced4SigExtra_reducedVec_4, CDom_reduced4SigExtra_reducedVec_3};	// hardfloat/hardfloat/src/main/scala/primitives.scala:118:30, :124:20
  wire [1:0]   CDom_reduced4SigExtra_hi_hi =
    {CDom_reduced4SigExtra_reducedVec_6, CDom_reduced4SigExtra_reducedVec_5};	// hardfloat/hardfloat/src/main/scala/primitives.scala:118:30, :124:20
  wire [3:0]   CDom_reduced4SigExtra_hi =
    {CDom_reduced4SigExtra_hi_hi, CDom_reduced4SigExtra_hi_lo};	// hardfloat/hardfloat/src/main/scala/primitives.scala:124:20
  wire [8:0]   CDom_reduced4SigExtra_shift =
    $signed(9'sh100 >>> ~(io_fromPreMul_CDom_CAlignDist_0[4:2]));	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:221:51, hardfloat/hardfloat/src/main/scala/primitives.scala:52:21, :76:56
  wire         CDom_reduced4SigExtra =
    |({CDom_reduced4SigExtra_hi[2:0], CDom_reduced4SigExtra_lo}
      & {CDom_reduced4SigExtra_shift[1],
         CDom_reduced4SigExtra_shift[2],
         CDom_reduced4SigExtra_shift[3],
         CDom_reduced4SigExtra_shift[4],
         CDom_reduced4SigExtra_shift[5],
         CDom_reduced4SigExtra_shift[6]});	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:220:72, :221:73, hardfloat/hardfloat/src/main/scala/primitives.scala:76:56, :77:20, :78:22, :124:20
  wire [26:0]  CDom_sig =
    {CDom_mainSig[28:3],
     (|(CDom_mainSig[2:0])) | CDom_reduced4SigExtra | CDom_absSigSumExtra};	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:212:12, :217:56, :221:73, :223:{12,25}, :224:{25,32,61}
  wire         notCDom_signSigSum = sigSum[51];	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:190:12, :230:36
  wire [50:0]  notCDom_absSigSum =
    notCDom_signSigSum
      ? ~(sigSum[50:0])
      : sigSum[50:0] + {50'h0, io_fromPreMul_doSubMags_0};	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:190:12, :230:36, :232:12, :233:{13,20}, :234:41
  wire         notCDom_reduced2AbsSigSum_reducedVec_0 = |(notCDom_absSigSum[1:0]);	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:232:12, hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :103:{33,54}
  wire         notCDom_reduced2AbsSigSum_reducedVec_1 = |(notCDom_absSigSum[3:2]);	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:232:12, hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :103:{33,54}
  wire         notCDom_reduced2AbsSigSum_reducedVec_2 = |(notCDom_absSigSum[5:4]);	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:232:12, hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :103:{33,54}
  wire         notCDom_reduced2AbsSigSum_reducedVec_3 = |(notCDom_absSigSum[7:6]);	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:232:12, hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :103:{33,54}
  wire         notCDom_reduced2AbsSigSum_reducedVec_4 = |(notCDom_absSigSum[9:8]);	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:232:12, hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :103:{33,54}
  wire         notCDom_reduced2AbsSigSum_reducedVec_5 = |(notCDom_absSigSum[11:10]);	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:232:12, hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :103:{33,54}
  wire         notCDom_reduced2AbsSigSum_reducedVec_6 = |(notCDom_absSigSum[13:12]);	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:232:12, hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :103:{33,54}
  wire         notCDom_reduced2AbsSigSum_reducedVec_7 = |(notCDom_absSigSum[15:14]);	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:232:12, hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :103:{33,54}
  wire         notCDom_reduced2AbsSigSum_reducedVec_8 = |(notCDom_absSigSum[17:16]);	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:232:12, hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :103:{33,54}
  wire         notCDom_reduced2AbsSigSum_reducedVec_9 = |(notCDom_absSigSum[19:18]);	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:232:12, hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :103:{33,54}
  wire         notCDom_reduced2AbsSigSum_reducedVec_10 = |(notCDom_absSigSum[21:20]);	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:232:12, hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :103:{33,54}
  wire         notCDom_reduced2AbsSigSum_reducedVec_11 = |(notCDom_absSigSum[23:22]);	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:232:12, hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :103:{33,54}
  wire         notCDom_reduced2AbsSigSum_reducedVec_12 = |(notCDom_absSigSum[25:24]);	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:232:12, hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :103:{33,54}
  wire         notCDom_reduced2AbsSigSum_reducedVec_13 = |(notCDom_absSigSum[27:26]);	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:232:12, hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :103:{33,54}
  wire         notCDom_reduced2AbsSigSum_reducedVec_14 = |(notCDom_absSigSum[29:28]);	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:232:12, hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :103:{33,54}
  wire         notCDom_reduced2AbsSigSum_reducedVec_15 = |(notCDom_absSigSum[31:30]);	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:232:12, hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :103:{33,54}
  wire         notCDom_reduced2AbsSigSum_reducedVec_16 = |(notCDom_absSigSum[33:32]);	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:232:12, hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :103:{33,54}
  wire         notCDom_reduced2AbsSigSum_reducedVec_17 = |(notCDom_absSigSum[35:34]);	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:232:12, hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :103:{33,54}
  wire         notCDom_reduced2AbsSigSum_reducedVec_18 = |(notCDom_absSigSum[37:36]);	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:232:12, hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :103:{33,54}
  wire         notCDom_reduced2AbsSigSum_reducedVec_19 = |(notCDom_absSigSum[39:38]);	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:232:12, hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :103:{33,54}
  wire         notCDom_reduced2AbsSigSum_reducedVec_20 = |(notCDom_absSigSum[41:40]);	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:232:12, hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :103:{33,54}
  wire         notCDom_reduced2AbsSigSum_reducedVec_21 = |(notCDom_absSigSum[43:42]);	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:232:12, hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :103:{33,54}
  wire         notCDom_reduced2AbsSigSum_reducedVec_22 = |(notCDom_absSigSum[45:44]);	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:232:12, hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :103:{33,54}
  wire         notCDom_reduced2AbsSigSum_reducedVec_23 = |(notCDom_absSigSum[47:46]);	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:232:12, hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :103:{33,54}
  wire         notCDom_reduced2AbsSigSum_reducedVec_24 = |(notCDom_absSigSum[49:48]);	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:232:12, hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :103:{33,54}
  wire         notCDom_reduced2AbsSigSum_reducedVec_25 = notCDom_absSigSum[50];	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:232:12, hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :106:15
  wire [1:0]   notCDom_reduced2AbsSigSum_lo_lo_lo_hi =
    {notCDom_reduced2AbsSigSum_reducedVec_2, notCDom_reduced2AbsSigSum_reducedVec_1};	// hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :107:20
  wire [2:0]   notCDom_reduced2AbsSigSum_lo_lo_lo =
    {notCDom_reduced2AbsSigSum_lo_lo_lo_hi, notCDom_reduced2AbsSigSum_reducedVec_0};	// hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :107:20
  wire [1:0]   notCDom_reduced2AbsSigSum_lo_lo_hi_hi =
    {notCDom_reduced2AbsSigSum_reducedVec_5, notCDom_reduced2AbsSigSum_reducedVec_4};	// hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :107:20
  wire [2:0]   notCDom_reduced2AbsSigSum_lo_lo_hi =
    {notCDom_reduced2AbsSigSum_lo_lo_hi_hi, notCDom_reduced2AbsSigSum_reducedVec_3};	// hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :107:20
  wire [5:0]   notCDom_reduced2AbsSigSum_lo_lo =
    {notCDom_reduced2AbsSigSum_lo_lo_hi, notCDom_reduced2AbsSigSum_lo_lo_lo};	// hardfloat/hardfloat/src/main/scala/primitives.scala:107:20
  wire [1:0]   notCDom_reduced2AbsSigSum_lo_hi_lo_hi =
    {notCDom_reduced2AbsSigSum_reducedVec_8, notCDom_reduced2AbsSigSum_reducedVec_7};	// hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :107:20
  wire [2:0]   notCDom_reduced2AbsSigSum_lo_hi_lo =
    {notCDom_reduced2AbsSigSum_lo_hi_lo_hi, notCDom_reduced2AbsSigSum_reducedVec_6};	// hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :107:20
  wire [1:0]   notCDom_reduced2AbsSigSum_lo_hi_hi_lo =
    {notCDom_reduced2AbsSigSum_reducedVec_10, notCDom_reduced2AbsSigSum_reducedVec_9};	// hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :107:20
  wire [1:0]   notCDom_reduced2AbsSigSum_lo_hi_hi_hi =
    {notCDom_reduced2AbsSigSum_reducedVec_12, notCDom_reduced2AbsSigSum_reducedVec_11};	// hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :107:20
  wire [3:0]   notCDom_reduced2AbsSigSum_lo_hi_hi =
    {notCDom_reduced2AbsSigSum_lo_hi_hi_hi, notCDom_reduced2AbsSigSum_lo_hi_hi_lo};	// hardfloat/hardfloat/src/main/scala/primitives.scala:107:20
  wire [6:0]   notCDom_reduced2AbsSigSum_lo_hi =
    {notCDom_reduced2AbsSigSum_lo_hi_hi, notCDom_reduced2AbsSigSum_lo_hi_lo};	// hardfloat/hardfloat/src/main/scala/primitives.scala:107:20
  wire [12:0]  notCDom_reduced2AbsSigSum_lo =
    {notCDom_reduced2AbsSigSum_lo_hi, notCDom_reduced2AbsSigSum_lo_lo};	// hardfloat/hardfloat/src/main/scala/primitives.scala:107:20
  wire [1:0]   notCDom_reduced2AbsSigSum_hi_lo_lo_hi =
    {notCDom_reduced2AbsSigSum_reducedVec_15, notCDom_reduced2AbsSigSum_reducedVec_14};	// hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :107:20
  wire [2:0]   notCDom_reduced2AbsSigSum_hi_lo_lo =
    {notCDom_reduced2AbsSigSum_hi_lo_lo_hi, notCDom_reduced2AbsSigSum_reducedVec_13};	// hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :107:20
  wire [1:0]   notCDom_reduced2AbsSigSum_hi_lo_hi_hi =
    {notCDom_reduced2AbsSigSum_reducedVec_18, notCDom_reduced2AbsSigSum_reducedVec_17};	// hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :107:20
  wire [2:0]   notCDom_reduced2AbsSigSum_hi_lo_hi =
    {notCDom_reduced2AbsSigSum_hi_lo_hi_hi, notCDom_reduced2AbsSigSum_reducedVec_16};	// hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :107:20
  wire [5:0]   notCDom_reduced2AbsSigSum_hi_lo =
    {notCDom_reduced2AbsSigSum_hi_lo_hi, notCDom_reduced2AbsSigSum_hi_lo_lo};	// hardfloat/hardfloat/src/main/scala/primitives.scala:107:20
  wire [1:0]   notCDom_reduced2AbsSigSum_hi_hi_lo_hi =
    {notCDom_reduced2AbsSigSum_reducedVec_21, notCDom_reduced2AbsSigSum_reducedVec_20};	// hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :107:20
  wire [2:0]   notCDom_reduced2AbsSigSum_hi_hi_lo =
    {notCDom_reduced2AbsSigSum_hi_hi_lo_hi, notCDom_reduced2AbsSigSum_reducedVec_19};	// hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :107:20
  wire [1:0]   notCDom_reduced2AbsSigSum_hi_hi_hi_lo =
    {notCDom_reduced2AbsSigSum_reducedVec_23, notCDom_reduced2AbsSigSum_reducedVec_22};	// hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :107:20
  wire [1:0]   notCDom_reduced2AbsSigSum_hi_hi_hi_hi =
    {notCDom_reduced2AbsSigSum_reducedVec_25, notCDom_reduced2AbsSigSum_reducedVec_24};	// hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :107:20
  wire [3:0]   notCDom_reduced2AbsSigSum_hi_hi_hi =
    {notCDom_reduced2AbsSigSum_hi_hi_hi_hi, notCDom_reduced2AbsSigSum_hi_hi_hi_lo};	// hardfloat/hardfloat/src/main/scala/primitives.scala:107:20
  wire [6:0]   notCDom_reduced2AbsSigSum_hi_hi =
    {notCDom_reduced2AbsSigSum_hi_hi_hi, notCDom_reduced2AbsSigSum_hi_hi_lo};	// hardfloat/hardfloat/src/main/scala/primitives.scala:107:20
  wire [12:0]  notCDom_reduced2AbsSigSum_hi =
    {notCDom_reduced2AbsSigSum_hi_hi, notCDom_reduced2AbsSigSum_hi_lo};	// hardfloat/hardfloat/src/main/scala/primitives.scala:107:20
  wire [25:0]  notCDom_reduced2AbsSigSum =
    {notCDom_reduced2AbsSigSum_hi, notCDom_reduced2AbsSigSum_lo};	// hardfloat/hardfloat/src/main/scala/primitives.scala:107:20
  wire [4:0]   notCDom_normDistReduced2 =
    notCDom_reduced2AbsSigSum[25]
      ? 5'h0
      : notCDom_reduced2AbsSigSum[24]
          ? 5'h1
          : notCDom_reduced2AbsSigSum[23]
              ? 5'h2
              : notCDom_reduced2AbsSigSum[22]
                  ? 5'h3
                  : notCDom_reduced2AbsSigSum[21]
                      ? 5'h4
                      : notCDom_reduced2AbsSigSum[20]
                          ? 5'h5
                          : notCDom_reduced2AbsSigSum[19]
                              ? 5'h6
                              : notCDom_reduced2AbsSigSum[18]
                                  ? 5'h7
                                  : notCDom_reduced2AbsSigSum[17]
                                      ? 5'h8
                                      : notCDom_reduced2AbsSigSum[16]
                                          ? 5'h9
                                          : notCDom_reduced2AbsSigSum[15]
                                              ? 5'hA
                                              : notCDom_reduced2AbsSigSum[14]
                                                  ? 5'hB
                                                  : notCDom_reduced2AbsSigSum[13]
                                                      ? 5'hC
                                                      : notCDom_reduced2AbsSigSum[12]
                                                          ? 5'hD
                                                          : notCDom_reduced2AbsSigSum[11]
                                                              ? 5'hE
                                                              : notCDom_reduced2AbsSigSum[10]
                                                                  ? 5'hF
                                                                  : notCDom_reduced2AbsSigSum[9]
                                                                      ? 5'h10
                                                                      : notCDom_reduced2AbsSigSum[8]
                                                                          ? 5'h11
                                                                          : notCDom_reduced2AbsSigSum[7]
                                                                              ? 5'h12
                                                                              : notCDom_reduced2AbsSigSum[6]
                                                                                  ? 5'h13
                                                                                  : notCDom_reduced2AbsSigSum[5]
                                                                                      ? 5'h14
                                                                                      : notCDom_reduced2AbsSigSum[4]
                                                                                          ? 5'h15
                                                                                          : notCDom_reduced2AbsSigSum[3]
                                                                                              ? 5'h16
                                                                                              : notCDom_reduced2AbsSigSum[2]
                                                                                                  ? 5'h17
                                                                                                  : {4'hC,
                                                                                                     ~(notCDom_reduced2AbsSigSum[1])};	// hardfloat/hardfloat/src/main/scala/primitives.scala:91:52, :107:20, src/main/scala/chisel3/util/Mux.scala:50:70
  wire [5:0]   notCDom_nearNormDist = {notCDom_normDistReduced2, 1'h0};	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:205:22, :238:56, src/main/scala/chisel3/util/Mux.scala:50:70
  wire [9:0]   notCDom_sExp = io_fromPreMul_sExpSum_0 - {4'h0, notCDom_nearNormDist};	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:238:56, :239:46, hardfloat/hardfloat/src/main/scala/primitives.scala:120:54
  wire [113:0] _notCDom_mainSig_T = {63'h0, notCDom_absSigSum} << notCDom_nearNormDist;	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:232:12, :238:56, :241:27
  wire [28:0]  notCDom_mainSig = _notCDom_mainSig_T[51:23];	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:241:{27,50}
  wire         notCDom_reduced4SigExtra_reducedVec_0 = |(notCDom_reduced2AbsSigSum[1:0]);	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:245:39, hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :103:{33,54}, :107:20
  wire         notCDom_reduced4SigExtra_reducedVec_1 = |(notCDom_reduced2AbsSigSum[3:2]);	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:245:39, hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :103:{33,54}, :107:20
  wire         notCDom_reduced4SigExtra_reducedVec_2 = |(notCDom_reduced2AbsSigSum[5:4]);	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:245:39, hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :103:{33,54}, :107:20
  wire         notCDom_reduced4SigExtra_reducedVec_3 = |(notCDom_reduced2AbsSigSum[7:6]);	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:245:39, hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :103:{33,54}, :107:20
  wire         notCDom_reduced4SigExtra_reducedVec_4 = |(notCDom_reduced2AbsSigSum[9:8]);	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:245:39, hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :103:{33,54}, :107:20
  wire         notCDom_reduced4SigExtra_reducedVec_5 =
    |(notCDom_reduced2AbsSigSum[11:10]);	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:245:39, hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :103:{33,54}, :107:20
  wire         notCDom_reduced4SigExtra_reducedVec_6 = notCDom_reduced2AbsSigSum[12];	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:245:39, hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :106:15, :107:20
  wire [1:0]   notCDom_reduced4SigExtra_lo_hi =
    {notCDom_reduced4SigExtra_reducedVec_2, notCDom_reduced4SigExtra_reducedVec_1};	// hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :107:20
  wire [2:0]   notCDom_reduced4SigExtra_lo =
    {notCDom_reduced4SigExtra_lo_hi, notCDom_reduced4SigExtra_reducedVec_0};	// hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :107:20
  wire [1:0]   notCDom_reduced4SigExtra_hi_lo =
    {notCDom_reduced4SigExtra_reducedVec_4, notCDom_reduced4SigExtra_reducedVec_3};	// hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :107:20
  wire [1:0]   notCDom_reduced4SigExtra_hi_hi =
    {notCDom_reduced4SigExtra_reducedVec_6, notCDom_reduced4SigExtra_reducedVec_5};	// hardfloat/hardfloat/src/main/scala/primitives.scala:101:30, :107:20
  wire [3:0]   notCDom_reduced4SigExtra_hi =
    {notCDom_reduced4SigExtra_hi_hi, notCDom_reduced4SigExtra_hi_lo};	// hardfloat/hardfloat/src/main/scala/primitives.scala:107:20
  wire [16:0]  notCDom_reduced4SigExtra_shift =
    $signed(17'sh10000 >>> ~(notCDom_normDistReduced2[4:1]));	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:246:46, hardfloat/hardfloat/src/main/scala/primitives.scala:52:21, :76:56, src/main/scala/chisel3/util/Mux.scala:50:70
  wire         notCDom_reduced4SigExtra =
    |({notCDom_reduced4SigExtra_hi[2:0], notCDom_reduced4SigExtra_lo}
      & {notCDom_reduced4SigExtra_shift[1],
         notCDom_reduced4SigExtra_shift[2],
         notCDom_reduced4SigExtra_shift[3],
         notCDom_reduced4SigExtra_shift[4],
         notCDom_reduced4SigExtra_shift[5],
         notCDom_reduced4SigExtra_shift[6]});	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:245:78, :247:11, hardfloat/hardfloat/src/main/scala/primitives.scala:76:56, :77:20, :78:22, :107:20
  wire [26:0]  notCDom_sig =
    {notCDom_mainSig[28:3], (|(notCDom_mainSig[2:0])) | notCDom_reduced4SigExtra};	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:241:50, :247:11, :249:{12,28}, :250:{28,35,39}
  wire         notCDom_completeCancellation = notCDom_sig[26:25] == 2'h0;	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:249:12, :253:{21,50}, hardfloat/hardfloat/src/main/scala/primitives.scala:103:54
  wire         notCDom_sign =
    notCDom_completeCancellation
      ? roundingMode_min
      : io_fromPreMul_signProd_0 ^ notCDom_signSigSum;	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:184:45, :230:36, :253:50, :255:12, :257:36
  wire         notNaN_isInfProd = io_fromPreMul_isInfA_0 | io_fromPreMul_isInfB_0;	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:262:49
  assign notNaN_isInfOut = notNaN_isInfProd | io_fromPreMul_isInfC_0;	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:262:49, :263:44
  wire         io_rawOut_isInf_0 = notNaN_isInfOut;	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:263:44
  wire         notNaN_addZeros =
    (io_fromPreMul_isZeroA_0 | io_fromPreMul_isZeroB_0) & io_fromPreMul_isZeroC_0;	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:265:{32,58}
  wire         io_invalidExc_0 =
    io_fromPreMul_isSigNaNAny_0 | io_fromPreMul_isInfA_0 & io_fromPreMul_isZeroB_0
    | io_fromPreMul_isZeroA_0 & io_fromPreMul_isInfB_0 | ~io_fromPreMul_isNaNAOrB_0
    & notNaN_isInfProd & io_fromPreMul_isInfC_0 & io_fromPreMul_doSubMags_0;	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:262:49, :270:31, :271:{32,57}, :272:10, :274:35
  wire         io_rawOut_isNaN_0 = io_fromPreMul_isNaNAOrB_0 | io_fromPreMul_isNaNC_0;	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:276:48
  wire         io_rawOut_isZero_0 =
    notNaN_addZeros | ~io_fromPreMul_CIsDominant_0 & notCDom_completeCancellation;	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:253:50, :265:58, :280:25, :281:{14,42}
  wire         io_rawOut_sign_0 =
    notNaN_isInfProd & io_fromPreMul_signProd_0 | io_fromPreMul_isInfC_0 & opSignC
    | notNaN_addZeros & ~roundingMode_min & io_fromPreMul_signProd_0 & opSignC
    | notNaN_addZeros & roundingMode_min & (io_fromPreMul_signProd_0 | opSignC)
    | ~notNaN_isInfOut & ~notNaN_addZeros
    & (io_fromPreMul_CIsDominant_0 ? opSignC : notCDom_sign);	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:184:45, :188:42, :255:12, :262:49, :263:44, :265:58, :283:27, :284:31, :285:29, :286:36, :287:46, :288:{37,50}, :289:{10,31,49}, :290:17
  wire [9:0]   io_rawOut_sExp_0 = io_fromPreMul_CIsDominant_0 ? CDom_sExp : notCDom_sExp;	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:201:43, :239:46, :291:26
  wire [26:0]  io_rawOut_sig_0 = io_fromPreMul_CIsDominant_0 ? CDom_sig : notCDom_sig;	// hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:223:12, :249:12, :292:25
  assign io_invalidExc = io_invalidExc_0;
  assign io_rawOut_isNaN = io_rawOut_isNaN_0;
  assign io_rawOut_isInf = io_rawOut_isInf_0;
  assign io_rawOut_isZero = io_rawOut_isZero_0;
  assign io_rawOut_sign = io_rawOut_sign_0;
  assign io_rawOut_sExp = io_rawOut_sExp_0;
  assign io_rawOut_sig = io_rawOut_sig_0;
endmodule

