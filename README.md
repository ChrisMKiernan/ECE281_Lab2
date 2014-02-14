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

#### Errors: Testbench
I actually ran into a few problems with the testbench code in this lab. I had a self-checking testbench that would alert me if any of the values were incorrect. However, upon running the testbench, I found that several of the values returned error messages, even though upon simple inspection the actual waveform lined up perfectly with the truth table I created. I found that even though I placed the "assert" statements after the input changes, the assert statement was checking the previous input declarartions, e.g. if I were checking line 4 of the S and Co values against the inputs in line 3. I checked this against previous self-checking truth tables that had functionality, and found that if I placed the "assert" statements after the "wait for 100 ns" statements, the problem was fixed.

## Main Lab

#### Connecting the blocks
I connected the file that I made of the 1-bit adder, now a component, into a series with 4 other identical components to create a 4-bit ripple-carry adder.

![alt text](http://i.imgur.com/824Hhry.jpg "A block diagram of the 4-bit adder schematic. This includes the somewhat messy addition of the subtract function.")

In creating the block diagram, I tried to plan ahead for full functionality. In doing this, I included an input for a subtract select value, called "Sub." This will come into play later for the multiplexer select and the carry-in value. Both of these are seen in the above diagram.

#### Coding
It was relatively easy to create simply the adder. From the block diagram, I could use components in structural architechture in order to plot the inputs (logic vectors Ain and Bin) and outputs (logic vector Sum) to the component blocks of my 1-bit full adder. With a total of 512 inputs for adding 2 4-bit numbers together, a "copy-paste" testbench was not practical in this application. The option to create a looping self-checking testbench is considered part of A functionality and is possible, but unfortunately, I was unable to devote time to learning for loops and the self-check function with the number of errors I ran into with simply trying to get subtraction functionality before the Lab deadline, as discussed below. 

#### Subtraction
The premise for subtracting in binary is that the number to be subtracted should be made negative. Taking the two's compliment of a number was discussed in Lab 1 and I won't go into detail here. However, I will discuss how to select between adding and subtracting using VHDL. In order to make this selection, I needed to create a multiplexer to select whether to use B or B' in the addition process (`B_N <= not B` was specified earlier in the program). Luckily, multiplexer logic is already implemented in VHDL. It uses the logic of a selector value and the "WHEN" function. Using a subtractor switch (or more accurately, a subtractor button), I assumed a default to add, and when the button gave a value of '1', The multiplexer selected the B' input. The selector, then, played a dual role in the subtraction process. THe next step in taking the 2's complement of a number is to add one, so the selector button could also play a part in this, taking on the value of the carry-in to the first 1-bit full adder. By depressing the subtract select button, then, the circuit took the 2's compliment of the B variable and added it to the A variable, effectively subtracting. 

#### Errors: Multiplexer
I ran into an error with my multiplexer functionality out of class and tried several variations with no success. My multiplexer used "WITH" and "WHEN" logic, which is slightly different than "WHEN" and "ELSE" logic. It was set up in the following format: `With Sub Select B_Use <= Bin when "0", B_N when "1";` This format would select B' when the selector button (here by variable "Sub") gave a value of 1. However, I ran into several syntax errors, and I could not get my multiplexer to pass the "Check Syntax" test. I tried several variations, even trying at one point to change the format of the multiplexer to "WHEN" and "ELSE" logic, to no success. However, with assistance in class, errors were found in two places:

- The quotes (" ") around my 1 and 0 values should be single ticks (' ') because I am using a 1-bit selector input instead of a 2-bit select input.
- I needed a statement at the end of the multiplexer specifying an "OTHERS" condition. That is, whenever the button is not in a position of strictly 1 or 0, what should the B_Use value be?

Documentation: received in-class help from Capt Silva on M15 (14 Feb) for this issue. 

#### Overflow detection
I, admittidly, received a significant hint from a classmate on how to program overflow detection properly. One property of an overflow is that the carry-in value of the MSB is different from the carry-out value of the MSB if there is an overflow. I tested this method against many different examples in order to try to disprove it, and no form of 4-bit two's compliment addition or subtraction disproved it to my testing. I decided to implement this design to create an overflow detector, using an XOR gate. The XOR gate only returns a value of "true" or 1 when the two input values are different. Using the values C3 (carry value from Bit2 adder component to Bit3 adder component) and Cout (the final carry out value) and an XOR gate, the overflow detector was simply another easily-programmed output to an LED. 

Documentation: Received the help mentioned above from C3C Sabin Park. 

#### Functionality
All physical functionality (4-bit adder, subtraction, and overflow detection) was checked in class on M15 (14 Feb).
