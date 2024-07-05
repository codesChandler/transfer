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

module TLBuffer_4(
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
  TLMonitor_10 monitor (	// src/main/scala/tilelink/Nodes.scala:24:25
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
  Queue_35 nodeOut_a_q (	// src/main/scala/chisel3/util/Decoupled.scala:376:21
    .clock               (clock),
    .reset               (reset),
    .io_enq_ready        (nodeIn_a_ready),
    .io_enq_valid        (nodeIn_a_valid),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_enq_bits_opcode  (nodeIn_a_bits_opcode),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_enq_bits_param   (nodeIn_a_bits_param),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_enq_bits_size    (nodeIn_a_bits_size),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_enq_bits_source  (nodeIn_a_bits_source),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_enq_bits_address (nodeIn_a_bits_address),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_enq_bits_mask    (nodeIn_a_bits_mask),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_enq_bits_data    (nodeIn_a_bits_data),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_enq_bits_corrupt (nodeIn_a_bits_corrupt),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_deq_ready        (nodeOut_a_ready),	// src/main/scala/diplomacy/Nodes.scala:1205:17
    .io_deq_valid        (nodeOut_a_valid),
    .io_deq_bits_opcode  (nodeOut_a_bits_opcode),
    .io_deq_bits_param   (nodeOut_a_bits_param),
    .io_deq_bits_size    (nodeOut_a_bits_size),
    .io_deq_bits_source  (nodeOut_a_bits_source),
    .io_deq_bits_address (nodeOut_a_bits_address),
    .io_deq_bits_mask    (nodeOut_a_bits_mask),
    .io_deq_bits_data    (nodeOut_a_bits_data),
    .io_deq_bits_corrupt (nodeOut_a_bits_corrupt)
  );
  Queue_36 nodeIn_d_q (	// src/main/scala/chisel3/util/Decoupled.scala:376:21
    .clock               (clock),
    .reset               (reset),
    .io_enq_ready        (nodeOut_d_ready),
    .io_enq_valid        (nodeOut_d_valid),	// src/main/scala/diplomacy/Nodes.scala:1205:17
    .io_enq_bits_opcode  (nodeOut_d_bits_opcode),	// src/main/scala/diplomacy/Nodes.scala:1205:17
    .io_enq_bits_param   (nodeOut_d_bits_param),	// src/main/scala/diplomacy/Nodes.scala:1205:17
    .io_enq_bits_size    (nodeOut_d_bits_size),	// src/main/scala/diplomacy/Nodes.scala:1205:17
    .io_enq_bits_source  (nodeOut_d_bits_source),	// src/main/scala/diplomacy/Nodes.scala:1205:17
    .io_enq_bits_sink    (nodeOut_d_bits_sink),	// src/main/scala/diplomacy/Nodes.scala:1205:17
    .io_enq_bits_denied  (nodeOut_d_bits_denied),	// src/main/scala/diplomacy/Nodes.scala:1205:17
    .io_enq_bits_data    (nodeOut_d_bits_data),	// src/main/scala/diplomacy/Nodes.scala:1205:17
    .io_enq_bits_corrupt (nodeOut_d_bits_corrupt),	// src/main/scala/diplomacy/Nodes.scala:1205:17
    .io_deq_ready        (nodeIn_d_ready),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_deq_valid        (nodeIn_d_valid),
    .io_deq_bits_opcode  (nodeIn_d_bits_opcode),
    .io_deq_bits_param   (nodeIn_d_bits_param),
    .io_deq_bits_size    (nodeIn_d_bits_size),
    .io_deq_bits_source  (nodeIn_d_bits_source),
    .io_deq_bits_sink    (nodeIn_d_bits_sink),
    .io_deq_bits_denied  (nodeIn_d_bits_denied),
    .io_deq_bits_data    (nodeIn_d_bits_data),
    .io_deq_bits_corrupt (nodeIn_d_bits_corrupt)
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

