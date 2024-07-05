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

module TLFIFOFixer_3(
  input         clock,
                reset,
  output        auto_in_a_ready,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input         auto_in_a_valid,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [2:0]  auto_in_a_bits_opcode,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                auto_in_a_bits_param,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [3:0]  auto_in_a_bits_size,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [4:0]  auto_in_a_bits_source,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [27:0] auto_in_a_bits_address,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [7:0]  auto_in_a_bits_mask,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [63:0] auto_in_a_bits_data,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input         auto_in_a_bits_corrupt,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                auto_in_d_ready,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output        auto_in_d_valid,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [2:0]  auto_in_d_bits_opcode,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [1:0]  auto_in_d_bits_param,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [3:0]  auto_in_d_bits_size,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [4:0]  auto_in_d_bits_source,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output        auto_in_d_bits_sink,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                auto_in_d_bits_denied,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [63:0] auto_in_d_bits_data,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output        auto_in_d_bits_corrupt,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input         auto_out_a_ready,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output        auto_out_a_valid,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [2:0]  auto_out_a_bits_opcode,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                auto_out_a_bits_param,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [3:0]  auto_out_a_bits_size,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [4:0]  auto_out_a_bits_source,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [27:0] auto_out_a_bits_address,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [7:0]  auto_out_a_bits_mask,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [63:0] auto_out_a_bits_data,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output        auto_out_a_bits_corrupt,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                auto_out_d_ready,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input         auto_out_d_valid,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [2:0]  auto_out_d_bits_opcode,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [1:0]  auto_out_d_bits_param,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [3:0]  auto_out_d_bits_size,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [4:0]  auto_out_d_bits_source,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input         auto_out_d_bits_sink,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                auto_out_d_bits_denied,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [63:0] auto_out_d_bits_data,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input         auto_out_d_bits_corrupt	// src/main/scala/diplomacy/LazyModule.scala:374:18
);

  wire        auto_in_a_valid_0 = auto_in_a_valid;
  wire [2:0]  auto_in_a_bits_opcode_0 = auto_in_a_bits_opcode;
  wire [2:0]  auto_in_a_bits_param_0 = auto_in_a_bits_param;
  wire [3:0]  auto_in_a_bits_size_0 = auto_in_a_bits_size;
  wire [4:0]  auto_in_a_bits_source_0 = auto_in_a_bits_source;
  wire [27:0] auto_in_a_bits_address_0 = auto_in_a_bits_address;
  wire [7:0]  auto_in_a_bits_mask_0 = auto_in_a_bits_mask;
  wire [63:0] auto_in_a_bits_data_0 = auto_in_a_bits_data;
  wire        auto_in_a_bits_corrupt_0 = auto_in_a_bits_corrupt;
  wire        auto_in_d_ready_0 = auto_in_d_ready;
  wire        auto_out_a_ready_0 = auto_out_a_ready;
  wire        auto_out_d_valid_0 = auto_out_d_valid;
  wire [2:0]  auto_out_d_bits_opcode_0 = auto_out_d_bits_opcode;
  wire [1:0]  auto_out_d_bits_param_0 = auto_out_d_bits_param;
  wire [3:0]  auto_out_d_bits_size_0 = auto_out_d_bits_size;
  wire [4:0]  auto_out_d_bits_source_0 = auto_out_d_bits_source;
  wire        auto_out_d_bits_sink_0 = auto_out_d_bits_sink;
  wire        auto_out_d_bits_denied_0 = auto_out_d_bits_denied;
  wire [63:0] auto_out_d_bits_data_0 = auto_out_d_bits_data;
  wire        auto_out_d_bits_corrupt_0 = auto_out_d_bits_corrupt;
  wire        nodeIn_a_ready;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        nodeIn_a_valid = auto_in_a_valid_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [2:0]  nodeIn_a_bits_opcode = auto_in_a_bits_opcode_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [2:0]  nodeIn_a_bits_param = auto_in_a_bits_param_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [3:0]  nodeIn_a_bits_size = auto_in_a_bits_size_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [4:0]  nodeIn_a_bits_source = auto_in_a_bits_source_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [27:0] nodeIn_a_bits_address = auto_in_a_bits_address_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [7:0]  nodeIn_a_bits_mask = auto_in_a_bits_mask_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [63:0] nodeIn_a_bits_data = auto_in_a_bits_data_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        nodeIn_a_bits_corrupt = auto_in_a_bits_corrupt_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        nodeIn_d_ready = auto_in_d_ready_0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        nodeIn_d_valid;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [2:0]  nodeIn_d_bits_opcode;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [1:0]  nodeIn_d_bits_param;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [3:0]  nodeIn_d_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [4:0]  nodeIn_d_bits_source;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        nodeIn_d_bits_sink;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        nodeIn_d_bits_denied;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [63:0] nodeIn_d_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        nodeIn_d_bits_corrupt;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        nodeOut_a_ready = auto_out_a_ready_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        nodeOut_a_valid;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [2:0]  nodeOut_a_bits_opcode;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [2:0]  nodeOut_a_bits_param;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [3:0]  nodeOut_a_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [4:0]  nodeOut_a_bits_source;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [27:0] nodeOut_a_bits_address;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [7:0]  nodeOut_a_bits_mask;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [63:0] nodeOut_a_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        nodeOut_a_bits_corrupt;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        nodeOut_d_ready;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        nodeOut_d_valid = auto_out_d_valid_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [2:0]  nodeOut_d_bits_opcode = auto_out_d_bits_opcode_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [1:0]  nodeOut_d_bits_param = auto_out_d_bits_param_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [3:0]  nodeOut_d_bits_size = auto_out_d_bits_size_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [4:0]  nodeOut_d_bits_source = auto_out_d_bits_source_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        nodeOut_d_bits_sink = auto_out_d_bits_sink_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        nodeOut_d_bits_denied = auto_out_d_bits_denied_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [63:0] nodeOut_d_bits_data = auto_out_d_bits_data_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        nodeOut_d_bits_corrupt = auto_out_d_bits_corrupt_0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        auto_in_a_ready_0 = nodeIn_a_ready;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign nodeOut_a_bits_opcode = nodeIn_a_bits_opcode;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_a_bits_param = nodeIn_a_bits_param;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_a_bits_size = nodeIn_a_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_a_bits_source = nodeIn_a_bits_source;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_a_bits_address = nodeIn_a_bits_address;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_a_bits_mask = nodeIn_a_bits_mask;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_a_bits_data = nodeIn_a_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_a_bits_corrupt = nodeIn_a_bits_corrupt;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeOut_d_ready = nodeIn_d_ready;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire        auto_in_d_valid_0 = nodeIn_d_valid;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [2:0]  auto_in_d_bits_opcode_0 = nodeIn_d_bits_opcode;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [1:0]  auto_in_d_bits_param_0 = nodeIn_d_bits_param;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [3:0]  auto_in_d_bits_size_0 = nodeIn_d_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [4:0]  auto_in_d_bits_source_0 = nodeIn_d_bits_source;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        auto_in_d_bits_sink_0 = nodeIn_d_bits_sink;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        auto_in_d_bits_denied_0 = nodeIn_d_bits_denied;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [63:0] auto_in_d_bits_data_0 = nodeIn_d_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        auto_in_d_bits_corrupt_0 = nodeIn_d_bits_corrupt;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        auto_out_a_valid_0 = nodeOut_a_valid;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [2:0]  auto_out_a_bits_opcode_0 = nodeOut_a_bits_opcode;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [2:0]  auto_out_a_bits_param_0 = nodeOut_a_bits_param;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [3:0]  auto_out_a_bits_size_0 = nodeOut_a_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [4:0]  auto_out_a_bits_source_0 = nodeOut_a_bits_source;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [27:0] auto_out_a_bits_address_0 = nodeOut_a_bits_address;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [7:0]  auto_out_a_bits_mask_0 = nodeOut_a_bits_mask;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [63:0] auto_out_a_bits_data_0 = nodeOut_a_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        auto_out_a_bits_corrupt_0 = nodeOut_a_bits_corrupt;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        auto_out_d_ready_0 = nodeOut_d_ready;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign nodeIn_d_valid = nodeOut_d_valid;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeIn_d_bits_opcode = nodeOut_d_bits_opcode;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeIn_d_bits_param = nodeOut_d_bits_param;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeIn_d_bits_size = nodeOut_d_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeIn_d_bits_source = nodeOut_d_bits_source;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeIn_d_bits_sink = nodeOut_d_bits_sink;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeIn_d_bits_denied = nodeOut_d_bits_denied;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeIn_d_bits_data = nodeOut_d_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  assign nodeIn_d_bits_corrupt = nodeOut_d_bits_corrupt;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire [2:0]  a_id =
    {{nodeIn_a_bits_address[27],
      nodeIn_a_bits_address[25],
      nodeIn_a_bits_address[16],
      nodeIn_a_bits_address[13]} == 4'h0,
     {nodeIn_a_bits_address[27],
      {nodeIn_a_bits_address[27],
       nodeIn_a_bits_address[25],
       nodeIn_a_bits_address[16],
       ~(nodeIn_a_bits_address[13])} == 4'h0}
       | {2{{nodeIn_a_bits_address[27],
             ~(nodeIn_a_bits_address[25]),
             nodeIn_a_bits_address[16]} == 3'h0}}}
    | ({nodeIn_a_bits_address[27],
        nodeIn_a_bits_address[25],
        ~(nodeIn_a_bits_address[16])} == 3'h0
         ? 3'h5
         : 3'h0);	// src/main/scala/chisel3/util/Mux.scala:30:73, src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/diplomacy/Parameters.scala:52:29, :137:{31,41,46,59}
  wire        a_noDomain = a_id == 3'h0;	// src/main/scala/chisel3/util/Mux.scala:30:73, src/main/scala/diplomacy/Parameters.scala:52:29, src/main/scala/tilelink/FIFOFixer.scala:57:29
  wire        _stalls_id_T_4 = nodeIn_a_ready & nodeIn_a_valid;	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [26:0] _a_first_beats1_decode_T_1 = 27'hFFF << nodeIn_a_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/util/package.scala:243:71
  wire [8:0]  a_first_beats1_decode = ~(_a_first_beats1_decode_T_1[11:3]);	// src/main/scala/tilelink/Edges.scala:221:59, src/main/scala/util/package.scala:243:{46,71,76}
  wire        a_first_beats1_opdata = ~(nodeIn_a_bits_opcode[2]);	// src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/Edges.scala:93:{28,37}
  wire [8:0]  a_first_beats1 = a_first_beats1_opdata ? a_first_beats1_decode : 9'h0;	// src/main/scala/tilelink/Edges.scala:93:28, :221:59, :222:14, :230:27
  reg  [8:0]  a_first_counter;	// src/main/scala/tilelink/Edges.scala:230:27
  wire [8:0]  a_first_counter1 = a_first_counter - 9'h1;	// src/main/scala/tilelink/Edges.scala:230:27, :231:28
  wire        a_first = a_first_counter == 9'h0;	// src/main/scala/tilelink/Edges.scala:230:27, :232:25
  wire        a_first_last = a_first_counter == 9'h1 | a_first_beats1 == 9'h0;	// src/main/scala/tilelink/Edges.scala:222:14, :230:27, :233:{25,33,43}
  wire        a_first_done = a_first_last & _stalls_id_T_4;	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/tilelink/Edges.scala:233:33, :234:22
  wire [8:0]  a_first_count = a_first_beats1 & ~a_first_counter1;	// src/main/scala/tilelink/Edges.scala:222:14, :231:28, :235:{25,27}
  wire        _d_first_T = nodeOut_d_ready & nodeOut_d_valid;	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [26:0] _d_first_beats1_decode_T_1 = 27'hFFF << nodeOut_d_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/util/package.scala:243:71
  wire [8:0]  d_first_beats1_decode = ~(_d_first_beats1_decode_T_1[11:3]);	// src/main/scala/tilelink/Edges.scala:221:59, src/main/scala/util/package.scala:243:{46,71,76}
  wire        d_first_beats1_opdata = nodeOut_d_bits_opcode[0];	// src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Edges.scala:107:36
  wire [8:0]  d_first_beats1 = d_first_beats1_opdata ? d_first_beats1_decode : 9'h0;	// src/main/scala/tilelink/Edges.scala:107:36, :221:59, :222:14, :230:27
  reg  [8:0]  d_first_counter;	// src/main/scala/tilelink/Edges.scala:230:27
  wire [8:0]  d_first_counter1 = d_first_counter - 9'h1;	// src/main/scala/tilelink/Edges.scala:230:27, :231:28
  wire        d_first_first = d_first_counter == 9'h0;	// src/main/scala/tilelink/Edges.scala:230:27, :232:25
  wire        d_first_last = d_first_counter == 9'h1 | d_first_beats1 == 9'h0;	// src/main/scala/tilelink/Edges.scala:222:14, :230:27, :233:{25,33,43}
  wire        d_first_done = d_first_last & _d_first_T;	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/tilelink/Edges.scala:233:33, :234:22
  wire [8:0]  d_first_count = d_first_beats1 & ~d_first_counter1;	// src/main/scala/tilelink/Edges.scala:222:14, :231:28, :235:{25,27}
  wire        d_first = d_first_first & nodeOut_d_bits_opcode != 3'h6;	// src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Edges.scala:232:25, src/main/scala/tilelink/FIFOFixer.scala:69:{42,63}
  reg         flight_0;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
  reg         flight_1;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
  reg         flight_2;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
  reg         flight_3;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
  reg         flight_4;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
  reg         flight_5;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
  reg         flight_6;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
  reg         flight_7;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
  reg         flight_8;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
  reg         flight_9;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
  reg         flight_10;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
  reg         flight_11;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
  reg         flight_12;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
  reg         flight_13;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
  reg         flight_14;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
  reg         flight_15;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
  reg         flight_16;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
  reg         flight_17;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
  reg         flight_18;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
  wire        _GEN = a_first & _stalls_id_T_4;	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/tilelink/Edges.scala:232:25, src/main/scala/tilelink/FIFOFixer.scala:74:21
  wire        _GEN_0 = d_first & nodeIn_d_ready & nodeIn_d_valid;	// src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/FIFOFixer.scala:69:42, :75:21
  wire [2:0]  stalls_a_sel_uncommonBits = nodeIn_a_bits_source[2:0];	// src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/diplomacy/Parameters.scala:52:56
  wire [2:0]  stalls_a_sel_uncommonBits_1 = nodeIn_a_bits_source[2:0];	// src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/diplomacy/Parameters.scala:52:56
  wire        stalls_a_sel = nodeIn_a_bits_source[4:3] == 2'h0;	// src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/diplomacy/Parameters.scala:54:{10,32}, :56:48
  reg  [2:0]  stalls_id;	// src/main/scala/tilelink/FIFOFixer.scala:79:30
  wire        stalls_0 =
    stalls_a_sel & a_first
    & (flight_0 | flight_1 | flight_2 | flight_3 | flight_4 | flight_5 | flight_6
       | flight_7) & (a_noDomain | stalls_id != a_id);	// src/main/scala/chisel3/util/Mux.scala:30:73, src/main/scala/diplomacy/Parameters.scala:56:48, src/main/scala/tilelink/Edges.scala:232:25, src/main/scala/tilelink/FIFOFixer.scala:57:29, :73:27, :79:30, :82:{44,50,65,71}
  wire        stalls_a_sel_1 = nodeIn_a_bits_source[4:3] == 2'h1;	// src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/diplomacy/Parameters.scala:54:{10,32}, :56:48
  reg  [2:0]  stalls_id_1;	// src/main/scala/tilelink/FIFOFixer.scala:79:30
  wire        stalls_1 =
    stalls_a_sel_1 & a_first
    & (flight_8 | flight_9 | flight_10 | flight_11 | flight_12 | flight_13 | flight_14
       | flight_15) & (a_noDomain | stalls_id_1 != a_id);	// src/main/scala/chisel3/util/Mux.scala:30:73, src/main/scala/diplomacy/Parameters.scala:56:48, src/main/scala/tilelink/Edges.scala:232:25, src/main/scala/tilelink/FIFOFixer.scala:57:29, :73:27, :79:30, :82:{44,50,65,71}
  wire        stall = stalls_0 | stalls_1;	// src/main/scala/tilelink/FIFOFixer.scala:82:50, :85:45
  assign nodeOut_a_valid = nodeIn_a_valid & ~stall;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/FIFOFixer.scala:85:45, :89:{33,50}
  assign nodeIn_a_ready = nodeOut_a_ready & ~stall;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/FIFOFixer.scala:85:45, :89:50, :90:33
  reg  [18:0] SourceIdFIFOed;	// src/main/scala/tilelink/FIFOFixer.scala:109:35
  wire [31:0] _SourceIdSet_T = 32'h1 << nodeIn_a_bits_source;	// src/main/scala/chisel3/util/OneHot.scala:58:35, src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [18:0] SourceIdSet = _GEN ? _SourceIdSet_T[18:0] : 19'h0;	// src/main/scala/chisel3/util/OneHot.scala:58:35, src/main/scala/tilelink/FIFOFixer.scala:74:21, :109:35, :110:36, :113:50, :114:21
  wire [31:0] _SourceIdClear_T = 32'h1 << nodeIn_d_bits_source;	// src/main/scala/chisel3/util/OneHot.scala:58:35, src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [18:0] SourceIdClear = _GEN_0 ? _SourceIdClear_T[18:0] : 19'h0;	// src/main/scala/chisel3/util/OneHot.scala:58:35, src/main/scala/tilelink/FIFOFixer.scala:75:21, :109:35, :111:38, :116:36, :117:23
  wire        allIDs_FIFOed = &SourceIdFIFOed;	// src/main/scala/tilelink/FIFOFixer.scala:109:35, :121:41
  always @(posedge clock) begin
    if (reset) begin
      a_first_counter <= 9'h0;	// src/main/scala/tilelink/Edges.scala:230:27
      d_first_counter <= 9'h0;	// src/main/scala/tilelink/Edges.scala:230:27
      flight_0 <= 1'h0;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
      flight_1 <= 1'h0;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
      flight_2 <= 1'h0;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
      flight_3 <= 1'h0;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
      flight_4 <= 1'h0;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
      flight_5 <= 1'h0;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
      flight_6 <= 1'h0;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
      flight_7 <= 1'h0;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
      flight_8 <= 1'h0;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
      flight_9 <= 1'h0;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
      flight_10 <= 1'h0;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
      flight_11 <= 1'h0;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
      flight_12 <= 1'h0;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
      flight_13 <= 1'h0;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
      flight_14 <= 1'h0;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
      flight_15 <= 1'h0;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
      flight_16 <= 1'h0;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
      flight_17 <= 1'h0;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
      flight_18 <= 1'h0;	// src/main/scala/tilelink/FIFOFixer.scala:73:27
      SourceIdFIFOed <= 19'h0;	// src/main/scala/tilelink/FIFOFixer.scala:109:35
    end
    else begin
      if (_stalls_id_T_4) begin	// src/main/scala/chisel3/util/Decoupled.scala:52:35
        if (a_first)	// src/main/scala/tilelink/Edges.scala:232:25
          a_first_counter <= a_first_beats1;	// src/main/scala/tilelink/Edges.scala:222:14, :230:27
        else	// src/main/scala/tilelink/Edges.scala:232:25
          a_first_counter <= a_first_counter1;	// src/main/scala/tilelink/Edges.scala:230:27, :231:28
      end
      if (_d_first_T) begin	// src/main/scala/chisel3/util/Decoupled.scala:52:35
        if (d_first_first)	// src/main/scala/tilelink/Edges.scala:232:25
          d_first_counter <= d_first_beats1;	// src/main/scala/tilelink/Edges.scala:222:14, :230:27
        else	// src/main/scala/tilelink/Edges.scala:232:25
          d_first_counter <= d_first_counter1;	// src/main/scala/tilelink/Edges.scala:230:27, :231:28
      end
      flight_0 <=
        ~(_GEN_0 & nodeIn_d_bits_source == 5'h0)
        & (_GEN & nodeIn_a_bits_source == 5'h0 | flight_0);	// src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/FIFOFixer.scala:73:27, :74:{21,35,62}, :75:{21,35,62}
      flight_1 <=
        ~(_GEN_0 & nodeIn_d_bits_source == 5'h1)
        & (_GEN & nodeIn_a_bits_source == 5'h1 | flight_1);	// src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/FIFOFixer.scala:73:27, :74:{21,35,62}, :75:{21,35,62}
      flight_2 <=
        ~(_GEN_0 & nodeIn_d_bits_source == 5'h2)
        & (_GEN & nodeIn_a_bits_source == 5'h2 | flight_2);	// src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/FIFOFixer.scala:73:27, :74:{21,35,62}, :75:{21,35,62}
      flight_3 <=
        ~(_GEN_0 & nodeIn_d_bits_source == 5'h3)
        & (_GEN & nodeIn_a_bits_source == 5'h3 | flight_3);	// src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/FIFOFixer.scala:73:27, :74:{21,35,62}, :75:{21,35,62}
      flight_4 <=
        ~(_GEN_0 & nodeIn_d_bits_source == 5'h4)
        & (_GEN & nodeIn_a_bits_source == 5'h4 | flight_4);	// src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/FIFOFixer.scala:73:27, :74:{21,35,62}, :75:{21,35,62}
      flight_5 <=
        ~(_GEN_0 & nodeIn_d_bits_source == 5'h5)
        & (_GEN & nodeIn_a_bits_source == 5'h5 | flight_5);	// src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/FIFOFixer.scala:73:27, :74:{21,35,62}, :75:{21,35,62}
      flight_6 <=
        ~(_GEN_0 & nodeIn_d_bits_source == 5'h6)
        & (_GEN & nodeIn_a_bits_source == 5'h6 | flight_6);	// src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/FIFOFixer.scala:73:27, :74:{21,35,62}, :75:{21,35,62}
      flight_7 <=
        ~(_GEN_0 & nodeIn_d_bits_source == 5'h7)
        & (_GEN & nodeIn_a_bits_source == 5'h7 | flight_7);	// src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/FIFOFixer.scala:73:27, :74:{21,35,62}, :75:{21,35,62}
      flight_8 <=
        ~(_GEN_0 & nodeIn_d_bits_source == 5'h8)
        & (_GEN & nodeIn_a_bits_source == 5'h8 | flight_8);	// src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/FIFOFixer.scala:73:27, :74:{21,35,62}, :75:{21,35,62}
      flight_9 <=
        ~(_GEN_0 & nodeIn_d_bits_source == 5'h9)
        & (_GEN & nodeIn_a_bits_source == 5'h9 | flight_9);	// src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/FIFOFixer.scala:73:27, :74:{21,35,62}, :75:{21,35,62}
      flight_10 <=
        ~(_GEN_0 & nodeIn_d_bits_source == 5'hA)
        & (_GEN & nodeIn_a_bits_source == 5'hA | flight_10);	// src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/FIFOFixer.scala:73:27, :74:{21,35,62}, :75:{21,35,62}
      flight_11 <=
        ~(_GEN_0 & nodeIn_d_bits_source == 5'hB)
        & (_GEN & nodeIn_a_bits_source == 5'hB | flight_11);	// src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/FIFOFixer.scala:73:27, :74:{21,35,62}, :75:{21,35,62}
      flight_12 <=
        ~(_GEN_0 & nodeIn_d_bits_source == 5'hC)
        & (_GEN & nodeIn_a_bits_source == 5'hC | flight_12);	// src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/FIFOFixer.scala:73:27, :74:{21,35,62}, :75:{21,35,62}
      flight_13 <=
        ~(_GEN_0 & nodeIn_d_bits_source == 5'hD)
        & (_GEN & nodeIn_a_bits_source == 5'hD | flight_13);	// src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/FIFOFixer.scala:73:27, :74:{21,35,62}, :75:{21,35,62}
      flight_14 <=
        ~(_GEN_0 & nodeIn_d_bits_source == 5'hE)
        & (_GEN & nodeIn_a_bits_source == 5'hE | flight_14);	// src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/FIFOFixer.scala:73:27, :74:{21,35,62}, :75:{21,35,62}
      flight_15 <=
        ~(_GEN_0 & nodeIn_d_bits_source == 5'hF)
        & (_GEN & nodeIn_a_bits_source == 5'hF | flight_15);	// src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/FIFOFixer.scala:73:27, :74:{21,35,62}, :75:{21,35,62}
      flight_16 <=
        ~(_GEN_0 & nodeIn_d_bits_source == 5'h10)
        & (_GEN & nodeIn_a_bits_source == 5'h10 | flight_16);	// src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/FIFOFixer.scala:73:27, :74:{21,35,62}, :75:{21,35,62}
      flight_17 <=
        ~(_GEN_0 & nodeIn_d_bits_source == 5'h11)
        & (_GEN & nodeIn_a_bits_source == 5'h11 | flight_17);	// src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/FIFOFixer.scala:73:27, :74:{21,35,62}, :75:{21,35,62}
      flight_18 <=
        ~(_GEN_0 & nodeIn_d_bits_source == 5'h12)
        & (_GEN & nodeIn_a_bits_source == 5'h12 | flight_18);	// src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/FIFOFixer.scala:73:27, :74:{21,35,62}, :75:{21,35,62}
      SourceIdFIFOed <= SourceIdFIFOed | SourceIdSet;	// src/main/scala/tilelink/FIFOFixer.scala:109:35, :110:36, :120:40
    end
    if (_stalls_id_T_4 & stalls_a_sel)	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/diplomacy/Parameters.scala:56:48, src/main/scala/tilelink/FIFOFixer.scala:79:47
      stalls_id <= a_id;	// src/main/scala/chisel3/util/Mux.scala:30:73, src/main/scala/tilelink/FIFOFixer.scala:79:30
    if (_stalls_id_T_4 & stalls_a_sel_1)	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/diplomacy/Parameters.scala:56:48, src/main/scala/tilelink/FIFOFixer.scala:79:47
      stalls_id_1 <= a_id;	// src/main/scala/chisel3/util/Mux.scala:30:73, src/main/scala/tilelink/FIFOFixer.scala:79:30
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin
      automatic logic [31:0] _RANDOM[0:1];
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [1:0] i = 2'h0; i < 2'h2; i += 2'h1) begin
          _RANDOM[i[0]] = `RANDOM;
        end
        a_first_counter = _RANDOM[1'h0][8:0];	// src/main/scala/tilelink/Edges.scala:230:27
        d_first_counter = _RANDOM[1'h0][17:9];	// src/main/scala/tilelink/Edges.scala:230:27
        flight_0 = _RANDOM[1'h0][18];	// src/main/scala/tilelink/Edges.scala:230:27, src/main/scala/tilelink/FIFOFixer.scala:73:27
        flight_1 = _RANDOM[1'h0][19];	// src/main/scala/tilelink/Edges.scala:230:27, src/main/scala/tilelink/FIFOFixer.scala:73:27
        flight_2 = _RANDOM[1'h0][20];	// src/main/scala/tilelink/Edges.scala:230:27, src/main/scala/tilelink/FIFOFixer.scala:73:27
        flight_3 = _RANDOM[1'h0][21];	// src/main/scala/tilelink/Edges.scala:230:27, src/main/scala/tilelink/FIFOFixer.scala:73:27
        flight_4 = _RANDOM[1'h0][22];	// src/main/scala/tilelink/Edges.scala:230:27, src/main/scala/tilelink/FIFOFixer.scala:73:27
        flight_5 = _RANDOM[1'h0][23];	// src/main/scala/tilelink/Edges.scala:230:27, src/main/scala/tilelink/FIFOFixer.scala:73:27
        flight_6 = _RANDOM[1'h0][24];	// src/main/scala/tilelink/Edges.scala:230:27, src/main/scala/tilelink/FIFOFixer.scala:73:27
        flight_7 = _RANDOM[1'h0][25];	// src/main/scala/tilelink/Edges.scala:230:27, src/main/scala/tilelink/FIFOFixer.scala:73:27
        flight_8 = _RANDOM[1'h0][26];	// src/main/scala/tilelink/Edges.scala:230:27, src/main/scala/tilelink/FIFOFixer.scala:73:27
        flight_9 = _RANDOM[1'h0][27];	// src/main/scala/tilelink/Edges.scala:230:27, src/main/scala/tilelink/FIFOFixer.scala:73:27
        flight_10 = _RANDOM[1'h0][28];	// src/main/scala/tilelink/Edges.scala:230:27, src/main/scala/tilelink/FIFOFixer.scala:73:27
        flight_11 = _RANDOM[1'h0][29];	// src/main/scala/tilelink/Edges.scala:230:27, src/main/scala/tilelink/FIFOFixer.scala:73:27
        flight_12 = _RANDOM[1'h0][30];	// src/main/scala/tilelink/Edges.scala:230:27, src/main/scala/tilelink/FIFOFixer.scala:73:27
        flight_13 = _RANDOM[1'h0][31];	// src/main/scala/tilelink/Edges.scala:230:27, src/main/scala/tilelink/FIFOFixer.scala:73:27
        flight_14 = _RANDOM[1'h1][0];	// src/main/scala/tilelink/FIFOFixer.scala:73:27
        flight_15 = _RANDOM[1'h1][1];	// src/main/scala/tilelink/FIFOFixer.scala:73:27
        flight_16 = _RANDOM[1'h1][2];	// src/main/scala/tilelink/FIFOFixer.scala:73:27
        flight_17 = _RANDOM[1'h1][3];	// src/main/scala/tilelink/FIFOFixer.scala:73:27
        flight_18 = _RANDOM[1'h1][4];	// src/main/scala/tilelink/FIFOFixer.scala:73:27
        stalls_id = _RANDOM[1'h1][7:5];	// src/main/scala/tilelink/FIFOFixer.scala:73:27, :79:30
        stalls_id_1 = _RANDOM[1'h1][10:8];	// src/main/scala/tilelink/FIFOFixer.scala:73:27, :79:30
        SourceIdFIFOed = _RANDOM[1'h1][29:11];	// src/main/scala/tilelink/FIFOFixer.scala:73:27, :109:35
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  TLMonitor_8 monitor (	// src/main/scala/tilelink/Nodes.scala:24:25
    .clock                (clock),
    .reset                (reset),
    .io_in_a_ready        (nodeIn_a_ready),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_valid        (nodeIn_a_valid),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_bits_opcode  (nodeIn_a_bits_opcode),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_bits_param   (nodeIn_a_bits_param),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_bits_size    (nodeIn_a_bits_size),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_bits_source  (nodeIn_a_bits_source),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_bits_address (nodeIn_a_bits_address),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_bits_mask    (nodeIn_a_bits_mask),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_bits_data    (nodeIn_a_bits_data),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_bits_corrupt (nodeIn_a_bits_corrupt),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_ready        (nodeIn_d_ready),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_valid        (nodeIn_d_valid),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_bits_opcode  (nodeIn_d_bits_opcode),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_bits_param   (nodeIn_d_bits_param),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_bits_size    (nodeIn_d_bits_size),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_bits_source  (nodeIn_d_bits_source),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_bits_sink    (nodeIn_d_bits_sink),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_bits_denied  (nodeIn_d_bits_denied),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_bits_data    (nodeIn_d_bits_data),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_bits_corrupt (nodeIn_d_bits_corrupt)	// src/main/scala/diplomacy/Nodes.scala:1214:17
  );
  assign auto_in_a_ready = auto_in_a_ready_0;
  assign auto_in_d_valid = auto_in_d_valid_0;
  assign auto_in_d_bits_opcode = auto_in_d_bits_opcode_0;
  assign auto_in_d_bits_param = auto_in_d_bits_param_0;
  assign auto_in_d_bits_size = auto_in_d_bits_size_0;
  assign auto_in_d_bits_source = auto_in_d_bits_source_0;
  assign auto_in_d_bits_sink = auto_in_d_bits_sink_0;
  assign auto_in_d_bits_denied = auto_in_d_bits_denied_0;
  assign auto_in_d_bits_data = auto_in_d_bits_data_0;
  assign auto_in_d_bits_corrupt = auto_in_d_bits_corrupt_0;
  assign auto_out_a_valid = auto_out_a_valid_0;
  assign auto_out_a_bits_opcode = auto_out_a_bits_opcode_0;
  assign auto_out_a_bits_param = auto_out_a_bits_param_0;
  assign auto_out_a_bits_size = auto_out_a_bits_size_0;
  assign auto_out_a_bits_source = auto_out_a_bits_source_0;
  assign auto_out_a_bits_address = auto_out_a_bits_address_0;
  assign auto_out_a_bits_mask = auto_out_a_bits_mask_0;
  assign auto_out_a_bits_data = auto_out_a_bits_data_0;
  assign auto_out_a_bits_corrupt = auto_out_a_bits_corrupt_0;
  assign auto_out_d_ready = auto_out_d_ready_0;
endmodule

