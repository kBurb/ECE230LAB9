# Sequential Circuits: Latches

In this lab, you learned about the basic building block of sequential circuits: the latch.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Names
Kade Burback, Kenny Shannon
## Summary
In this lab, we first implemented a D-Latch capable of storing a single bit of memory.
Then, we implemented a four byte memory system with multiple D-Latches, a Demux for selecting which of the four byte blocks to store, another Demux to enable the store selected, and a Mux for selecting which byte block to display.
## Lab Questions

###  Why can we not just use structural Verilog to implement latches?
If we were to try to implement the structural Verilog circuit using Vivado and synthesize it for the Basys3, we would get stuck in the same combinatorial looping problem as Lab 6. 
### What is the meaning of always @(*) in a sensitivity block?
In always @(*) blocks, regs can contain regular continuous assignment where no memory is needed in it.
### What importance is memory to digital circuits?
Memory allows calculations/computations to be stored for reading and reuse beyond the current state of the circuit. Without memory, the results of the computations on a circuit are gone as soon as the state changes.
