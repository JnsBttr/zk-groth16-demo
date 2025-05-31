pragma circom 2.0.0;

template Multiplier() {
    // Input signals
    signal input a;
    signal input b;
    
    // Output signal
    signal output c;
    
    // Constraint
    c <== a * b;
}

component main = Multiplier();
