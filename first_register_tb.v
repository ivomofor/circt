module first_register_tb;

    reg clk;
    reg reset;
    reg [7:0] input_data;
    wire [7:0] result;

    // Connect the testbench to the CIRCT-generated module.
    FirstRegister dut (
        .clk(clk),
        .reset(reset),
        .input_0(input_data),
        .result(result)
    );

    // Generate a clock that changes every 5 time units.
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        // Start with reset active.
        reset = 1;
        input_data = 8'd10;

        // Wait for the first rising clock edge.
        @(posedge clk);
        #1;

        if (result !== 8'd0)
            $fatal(1, "Test 1 failed: reset should produce 0");

        $display("Test 1 passed: reset produces 0");

        // Release reset and provide a new input.
        reset = 0;
        input_data = 8'd42;

        @(posedge clk);
        #1;

        if (result !== 8'd42)
            $fatal(1, "Test 2 failed: expected 42, got %0d", result);

        $display("Test 2 passed: register captured 42");

        // Change the input between clock edges.
        #1;
        input_data = 8'd99;
        #1;

        if (result !== 8'd42)
            $fatal(1, "Test 3 failed: register should hold 42, got %0d", result);

        $display("Test 3 passed: register holds 42 between clock edges");

        // Wait for the next rising edge.
        @(posedge clk);
        #1;

        if (result !== 8'd99)
            $fatal(1, "Test 4 failed: expected 99, got %0d", result);

        $display("Test 4 passed: register captured 99 at the next clock edge");

        $display("All register tests passed!");
        $finish;
    end

endmodule
