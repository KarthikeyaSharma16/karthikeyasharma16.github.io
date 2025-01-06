---
layout: page
title: Fault-Forge Sim
description: A simulator for logic evaluation, deductive fault simulation, and fault identification (PODEM) for digital circuits.
img: assets/img/DST_thumbnail.jpg
importance: 1
category: Projects
---

<div style="text-align: justify;">
The main goal of this project is to build a framework that performs logic simulation and detects fault in digital-logic circuits. The project comprises of three simulators implemented in <strong>C++</strong>
</div>

- <strong>Logic Simulator</strong> - Evaluates outputs for a given set of inputs for a particular netlist file.
- <strong>Deductive Fault Simulator</strong> - Detects all possible randomly injected faults for a given netlist. 
- <strong>Path-Oriented Decision Making (PODEM) Simulator</strong> - The simulator employs the PODEM algorithm to assess whether a given set of faults can be detected.

<div style="text-align: justify;">
<h3><strong>Logic Simulator</strong></h3>

The logic simulator evaluates output vectors for a given netlist file using three stack data structures: CurrentStack, EvaluatedStack, and UnevaluatedStack. The process begins with an initialization phase where gates are loaded into the CurrentStack with undefined states. During evaluation, gates with valid inputs are processed and moved to the EvaluatedStack, while those with incomplete inputs are temporarily stored in the UnevaluatedStack. This iterative evaluation ensures that all gates are systematically resolved by propagating logic throughout the netlist until no gates remain unevaluated. <br/><br/>


<div style="text-align: center;">
    <img src="../../assets/img/LogicSimulatorLogic.png" alt="Logic Evaluation" width="700">
    <p>Fig.1 Logic Evaluation</p>
</div>
</div>

<div style="text-align: justify;">
<h3><strong>Deductive Fault Simulator</strong></h3>

The Deductive fault simulator is built on top of Logic Simulator. Here, subroutines for propogating faults in the digital circuit is added, and the fault propogation varies for each type of gate in the netlist. The user has the option of running this simulator in two modes with random input vectors:
</div>

- <strong>Simulate all faults in the circuit</strong> - This is achieved by injecting faults for all the gates in the circuit.
- <strong>Simulate selective faults in the circuit</strong> - This is achieved by providing a set of faults for each gate in the circuit.

<div style="text-align: justify;">
Fig. 2 illustrates the plots of fault coverage vs. total number of applied tests for different Netlist files. On an average, it takes about 11 random tests (iterations) to achieve atleast 75% fault coverage and atleast 25 random tests for 90% fault coverage.
</div> <br/>

<div style="text-align: center;">
    <img src="../../assets/img/DST_FaultSim.png" alt="Fault Evaluation Outputs" width="900">
    <p>Fig. 2 Fault Evaluation Outputs</p>
</div>

<div style="text-align: justify;">
<h3><strong>Path-Oriented Decision Making (PODEM) Simulator</strong></h3>
The PODEM (Path-Oriented Decision Making) algorithm is a test pattern generation (ATPG) algorithm used for digital circuit testing which systematically determines input values needed to detect stuck-at faults in combinational circuits. 

The key idea is to make choices when assigning values to circuit inputs, using a backtracking approach that focuses on sensitizing a path from the fault site to a primary output. The algorithm proceeds by first selecting a target fault, then repeatedly making decisions about input assignments that help activate and propagate the fault effect, backtracking when necessary if a particular path proves unfruitful. It's generally more efficient than exhaustive or random testing approaches since it uses circuit topology information to guide the search. 

A description of all the subroutines involved in this algorithm is described in brief.<br/> <br/>

</div>

<strong>Description:</strong> This subroutine is responsible for navigating to the primary input of the ciruit through an "x-path".

```cpp
Algorithm: BackTrace
Input: (j, vj) returned by objective function
Output: Returns vector the PI to be assignment (k,vk) 

Steps:
1. v = vk; 
2. while k is a gate output do:
    - i = inversion of k; 
    - select an input (j) of k with value x; 
    - v = v ^ i; 
    - k = j; /* k is a PI */
3. return (k,v) 

```

<strong>Description:</strong> This subroutine is responsible for instructing the other functions in PODEM() to bring a value opposite to the fault to excite the fault. Further, it is also responsible for assigning non-controlling values on any selected gate on the D-Frontier to make the fault propagate to the output.

```cpp
Algorithm: Objective
Input: A vector containing "faulty" net and the "current" value on that net.
Output: Returns vector (j, vj), which is required to excite the fault. 

Steps:
// The target fault is l s-a-v (stuck-at-v)
1. if (the value of l is x) then return (l,vbar) 
2. select a gate (G) from the D-frontier 
3. select an input (j) of G with value x 
4. c = controlling value of G 
5. return (j,cbar) 

```

<strong>Description:</strong> This subroutine is responsible for updating the DFrontiers every time PODEM() calls itself.

```cpp
Algorithm: UpdateDFrontier
Input: DFrontier
Output: None

Steps:
1. Update the DFrontiers in the circuit to propagate a D/Dbar to the output. 
2. UpdateDFrontier() 
3. Iterate through all the gates in the netlist; 
4. If ((current gate != INV or current gate != BUF) and current gate output != x) do:
    for gates in DFrontier do:  
        If (gate already exists) do:
            break  
        else do:
            if either one of the gate inputs is at D/Dbar:
                add the gate to the DFrontier 
5. for gates in DFrontier:
    if gate output is not at x do:
        remove the gate from DFrontier. 
    else do:
        skip to next iteration. 
8. Print all the DFrontier gates at the console output. 
```
<strong>Description:</strong>  This subroutine does the "forward simulation" of the circuit, setting the other inputs of the gate whose one of the inputs is set to a non-controlling value.

```cpp
Algorithm: Imply
Input: backTraceVector, DFrontier
Output: returns boolean value after simulation.
 
Steps:
1. Save the previous state of the circuit (previous net values, in a vector) 
2. Inject the value on the PI predicted by the BackTrace Function. 
3. For gate in gateList do: 
    Assign D/Dbars to input nets of the gate if there are input faults. 
    If (gate.output != x) do: 
        If ((gate.type = INV or BUF) and input 1 != x) or ((gate.type = AND || OR || NOR || NAND) and input1 = controlValue, input 2 = x) or ((gate.type = AND || OR || NOR || NAND) and input2 = controlValue, input 2 = x) or ((gate.type = AND || OR || NOR || NAND) and input1 != x, input 2 != x) do:
            imply 
```

<strong>Description:</strong> Main PODEM function, all other functions are called from here.
```cpp
Algorithm: PODEM
Input: DFrontier
Output: returns SUCCESS or FAILURE

Steps:
1. if (error at PO) do:
    return SUCCESS 
2. if (test not possible) do:
    return FAILURE 
3. (k,Vk) = Objective(); 
4. (j,vj) = BackTrace(k,vk); 
5. Imply (j, vj); 
6. if (PODEM() = SUCCESS) do:
        return SUCCESS 
   else do:
        Retain previous state of circuit (backtracking) 
        Imply (j, vj Bar) 
        if (PODEM() = SUCCESS) do: 
            return SUCCESS 
        else do:
            Retain previous state of circuit (backtracking) 
            Imply (j, x) 
            return FAILURE 
```

Some sample outputs generated by the PODEM algorithm are tabulated in the table below for reference. Each Stuck-at fault can be detected for the combination determined by PODEM algorithm.

<table style="border-collapse: collapse; width: 50%;">
    <thead>
        <tr>
            <th style="border: 2px solid white; text-align: center; padding: 8px;">Stuck-at fault</th>
            <th style="border: 2px solid white; text-align: center; padding: 8px;">Test Vector generated by PODEM</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td style="border: 2px solid white; text-align: center; padding: 8px;">70/1</td>
            <td style="border: 2px solid white; text-align: center; padding: 8px;">01x1xxxxxxxxxx0xx</td>
        </tr>
        <tr>
            <td style="border: 2px solid white; text-align: center; padding: 8px;">73/0</td>
            <td style="border: 2px solid white; text-align: center; padding: 8px;">111xxxxxxxxxxx0xx</td>
        </tr>
        <tr>
            <td style="border: 2px solid white; text-align: center; padding: 8px;">26/1</td>
            <td style="border: 2px solid white; text-align: center; padding: 8px;">xx111xxx0xxxxxxxx</td>
        </tr>
        <tr>
            <td style="border: 2px solid white; text-align: center; padding: 8px;">92/0</td>
            <td style="border: 2px solid white; text-align: center; padding: 8px;">x10101xxxxxx0x0xx</td>
        </tr>
        <tr>
            <td style="border: 2px solid white; text-align: center; padding: 8px;">38/0</td>
            <td style="border: 2px solid white; text-align: center; padding: 8px;">01x0xxxxxxxxxx0xx</td>
        </tr>
    </tbody>
</table>

<br/>
<h3><strong>References</strong></h3>
This project is open-source and is available on <a href="https://github.com/KarthikeyaSharma16/faultforge-sim">github</a>.