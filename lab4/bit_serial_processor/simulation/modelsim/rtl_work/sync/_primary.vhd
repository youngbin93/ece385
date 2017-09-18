library verilog;
use verilog.vl_types.all;
entity sync is
    port(
        Clk             : in     vl_logic;
        d               : in     vl_logic;
        q               : out    vl_logic
    );
end sync;
