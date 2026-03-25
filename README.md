# 8-bit Registered Adder/Subtractor

## Overview
8-bit adder/subtractor implemented in SystemVerilog with registered input/output for synchronous operation.

## Features
- ADD/SUB operation using 2’s complement
- Ripple-carry structure (Full Adder)
- Registered datapath (sequential design)
- Overflow and carry detection

## Structure
- `EBA`: 8-bit adder/subtractor
- `FA`: 1-bit full adder
- `nbitreg`: register
- `d_ff`: flip-flop

## Notes
- Output is fed back as input → sequential behavior across clock cycles
- Verified using ModelSim
