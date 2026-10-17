 module first_circuit_tb;
    reg  [7:0] a;
    reg  [7:0] b;
    wire [7:0] result;

    firstCircuit dut (
        .a(a),
        .b(b),
        .result(result)
    );

    initial begin
        a = 8'd10;
        b = 8'd20;
        #10;
        if (result !== 8'd30)
            $fatal(1, "Test 1 failed: expected 30, got %0d", result);
        $display("Test 1 passed: 10 + 20 = %0d", result);

        a = 8'd5;
        b = 8'd7;
        #10;
        if (result !== 8'd12)
            $fatal(1, "Test 2 failed: expected 12, got %0d", result);
        $display("Test 2 passed: 5 + 7 = %0d", result);

        a = 8'd255;
        b = 8'd1;
        #10;
        if (result !== 8'd0)
            $fatal(1, "Test 3 failed: expected 0, got %0d", result);
        $display("Test 3 passed: 255 + 1 = %0d (8-bit overflow)", result);

        $display("All tests passed!");
        $finish;
    end
endmodule
