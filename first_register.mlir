hw.module @FirstRegister(
    in %clk : !seq.clock,
    in %reset : i1,
    in %input : i8,
    out result : i8
) {
    %zero = hw.constant 0 : i8

    %stored = seq.compreg %input, %clk reset %reset, %zero : i8

    hw.output %stored : i8
}