# Lab 2: 4-bit Adder

Make a 4-bit adder from 1-bit full adder components

## Pre-lab
Starting with a 1-bit full adder, make a truth table from inputs A, B, and Carry-in.

#### Truth table
A | B | Ci | S | Co
--- | --- | --- | --- | ---
0 | 0 | 0 | 0 | 0
0 | 0 | 1 | 1 | 0
0 | 1 | 0 | 1 | 0
0 | 1 | 1 | 0 | 1
1 | 0 | 0 | 1 | 0
1 | 0 | 1 | 0 | 1
1 | 1 | 0 | 0 | 1
1 | 1 | 1 | 1 | 1

Where S is the output for Sum and Co is the output value for Carry-out

#### Algebra
From the truth table, I could create K-maps in order to formulate the Boolean Algebra for the circuit. The equations are as follows:

- S = A'B'C + A'BC' + ABC + AB'C'
- Co = BC + AB + AC

#### Schematic
![alt text](http://i.imgur.com/ShdWDBG.jpg "A simple schematic showing all needed inputs and gates, as well as other signal declarations")

#### Testbench
I actually ran into a few problems with the testbench code in this lab. I had a self-checking testbench that would alert me if any of the values were incorrect. However, upon running the testbench, I found that several of the values returned error messages, even though upon simple inspection the actual waveform lined up perfectly with the truth table I created. I found that even though I placed the "assert" statements after the input changes, the assert statement was checking the previous input declarartions, e.g. if I were checking line 4 of the S and Co values against the inputs in line 3. I checked this against previous self-checking truth tables that had functionality, and found that if I placed the "assert" statements after the "wait for 100 ns" statements, the problem was fixed.
