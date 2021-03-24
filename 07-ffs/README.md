## Digital-electronics-1

https://github.com/Fabulec/Digital-electronics-1

# Lab 7: Latches and Flip-flops:

# 1.Preparation Task:
## Characteristic equations and completed tables for D, JK, T flip-flops:
| D   | Qn  | Q(n+1) | Comments |
| :-: | :-: | :-:    | :--      |
| 0   | 0   |     0   |   No change       |
| 0   | 1   |      0  |    Invert (Toggle)        |
| 1   |  0   |     1   |   Invert (Toggle)        |
| 1   |  1   |      1  |   No change       |

   | J | K | Qn | Q(n+1) | Comments |
   | :-: | :-: | :-: | :-: | :-- |
   | 0 | 0 | 0 | 0 | No change |
   | 0 | 0 | 1 | 1 | No change |
   | 0 | 1 | 0 |0   |    Reset |
   | 0 | 1 | 1 | 0  | Reset    |
   | 1 | 0 | 0 | 1 |        Set   |
   | 1 | 0 | 1 | 1|      Set    |
   | 1 | 1 | 0 | 1|      Toggle    |
   | 1 | 1 | 1 |  0|       Toggle   |

   | T | Qn | Q(n+1) | Comments |
   | :-: | :-: | :-: | :--      |
   | 0   |  0  |   0  |   No change       |
   | 0   |  1  |    1 |  No change         |
   | 1   |   0  |    1 |    Invert (Toggle)    |
   | 1   |    1 |     0|   Invert (Toggle)       |

# 2.D latch:
## VHDL code listing of the process p_d_latch:

```vhdl

```

## Listing of VHDL reset and stimulus processes from the testbench tb_d_latch:

```vhdl

```

## Screenshot with simulated time waveforms:

![Screenshot od EDA Playground](Image/     .png)

# 3. Flip-flops:

## VHDL code listing of the processes p_d_ff_arst, p_d_ff_rst, p_jk_ff_rst, p_t_ff_rst:

```vhdl

```

## Listing of VHDL clock, reset and stimulus processes from the testbench files:
 
```vhdl

```

## Screenshot, with simulated time waveforms:

![Screenshot od EDA Playground](Image/     .png)

# 4. Shift register:

## Image of the shift register schematic:

Obrážťečičičoučik :)

