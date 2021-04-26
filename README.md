# Multicycle-Processor<br>
16-bit multicycle RISC processor.<br>
It has 5 submodules<br>
<ul>
  <li>Instruction Memory: 64kB. 16bits(1 instr.) is read at a time.</li>
  <li>Data Memory: 64kB. 16bits(1 instr.) is read at a time. </li>
  <li>Register File: 16 refisters. R0 hard coded to zero.</li>
  <li>ALU:Instructions given in Instruction Set.</li>    
  <li>Control Unit:FSM</li>
  </ul>
  <br>
  <ol>Instruction Set
<li>Addition: Register, Immediate 
<li>Subtraction: Register, Immediate
<li>Shift Logical: Left, right
<li>Load/ Store: Immediate, Register
<li>Jump: Immediate, Register
<li>Branch: Equal, Not-equal 
<li>Logical: Nand , Or 
  </ol>
