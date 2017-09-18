library verilog;
use verilog.vl_types.all;
entity sync_r0 is
    port(
        Clk             : in     vl_logic;
        Reset           : in     vl_logic;
        d               : in     vl_logic;
        q               : out    vl_logic
    );
end sync_r0;
