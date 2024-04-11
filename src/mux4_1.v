/***************************************************************************
***                                                                      ***
*** EE 526 L Experiment #1                  Steven Hernandez, Fall, 2023 ***
***                                                                      ***
*** Experiment #1 Familiarization with linux and synopsys VCS            ***
***                                                                      ***
****************************************************************************
*** Filename: mux4_1.v               Created by Steven Hernandez, 9/5/23 ***
***                                                                      ***
****************************************************************************
*** This module models a 4:1 mux:                                        ***
*** This 4:1 mux will  contain 4 inputs, 1 output and 2 select lines     ***
****************************************************************************/

`timescale 1 ns / 1 ns

module mux4_1(OUT, A, B, C, D, SEL0, SEL1);

output OUT;
input A, B, C, D, SEL0, SEL1;    //Our 4 inputs with 2 select lines
wire s0_n, s1_n, T1, T2, T3, T4;    //wiring our select lines and timers

not (s0_n, SEL0), (s1_n, SEL1);    //select lines going through not gate
and (T1, A, s0_n, s1_n), (T2, B, s0_n, SEL1),(T3, C, SEL0, s1_n), (T4, D, SEL0, SEL1);
or (OUT, T1, T2, T3, T4);    //timer outputs 

endmodule

