# MIPS Pipeline Optimization Project

## Overview
This project was developed as part of the course Computer Architecture II.

The objective is to analyze and optimize a MIPS assembly program under different CPU architectures, focusing on pipeline performance, hazards, and cost efficiency.

---

## Problem Description
The program processes an array of 200 signed integers and computes:

- Negative numbers (N)
- Positive numbers (P)
- Zeros (Z)
- Even numbers (E)
- Odd numbers (O)

Constraints:
- No input/output
- Data stored in memory
- Continuous execution (datacenter simulation)

---

## CPU Architectures

| CPU | Description | Frequency | Cost | Power |
|-----|------------|----------|------|-------|
| MIPSa | Single-cycle | 50 MHz | €5 | 20W |
| MIPSb | 5-stage pipeline (no forwarding) | 150 MHz | €8 | 35W |
| MIPSc | 5-stage pipeline (forwarding + prediction) | 150 MHz | €12 | 45W |

---

## Goal

Maximize:

Performance / Total Cost of Ownership (TCO)

---

## Optimization Steps

- Reduced branch instructions
- Replaced control flow with arithmetic (`slt`, `sltiu`)
- Instruction reordering to reduce hazards
- Loop unrolling (8×)
- Reduced memory operations

---

## Results

Performance (executions/year):
- MIPSa: ~10.56 trillion
- MIPSb: ~30.27 trillion
- MIPSc: ~31.53 trillion

TCO:
- MIPSa: €53,504
- MIPSb: €86,132
- MIPSc: €127,884

---

## Conclusion

Best Performance/Cost ratio:

→ MIPSb

---

## Files

- start.s — initial version
- final.s — optimized version
- report.pdf — analysis

---

## Authors

- Iasonas Karaprodromidis
- Alexandra Zorba
