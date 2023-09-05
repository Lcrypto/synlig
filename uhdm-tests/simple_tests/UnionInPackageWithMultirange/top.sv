package foo_flags_pkg; // verilog_lint: waive package-filename

  typedef struct packed {
    logic a;
    logic b;
    logic c;
  } common_flags_t;

endpackage : foo_flags_pkg

package fooes_pkg; // verilog_lint: waive package-filename

  typedef enum logic [1:0] {
    a,
    b,
    c,
    d
  } classes_e;

endpackage : fooes_pkg

typedef struct packed {
  logic a;
  fooes_pkg::classes_e b;
} padded_fooes_t;

package goog; // verilog_lint: waive package-filename
typedef union packed {
  foo_flags_pkg::common_flags_t  [3:0][7:0] atype_t;
  padded_fooes_t     [3:0][7:0] btype_t;
} top_flag_t;
endpackage: goog

module top(input goog::top_flag_t a , output goog::top_flag_t b);
  assign b = a;
endmodule
