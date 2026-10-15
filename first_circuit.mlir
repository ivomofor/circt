hw.module @firstCircuit(in %a: i8, in %b: i8, out result: i8) {
    %sum = comb.add %a, %b : i8
    hw.output %sum : i8
}