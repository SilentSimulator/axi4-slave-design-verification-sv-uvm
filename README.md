## ADVANCED eXTENSIBLE INTERFACE PROTOCOL AXI4

## SUMMARY
This project implements the design and verification of an AXI4 slave using SystemVerilog. 
The objective of the project is to model a parameterized AXI slave that supports burst-based read 
and write transactions and to validate its functionality using a structured testbench environment. 
The design follows the AXI protocol defined in the AMBA AXI4, which is widely used in modern SoC designsfor high-performance communication
between masters and slaves.

## Overview
This project implements the verification of an AXI4 Slave design using SystemVerilog and UVM methodology. 
The design supports burst-based read and write transactions following the AXI4 protocol. A structured verification environment
is developed to validate the functionality of the slave using UVM components such as driver, monitor, sequencer, and scoreboard.

## design features
> Parameterized AXI4 interface
> Separate channels for read and write operations
> Burst transfer support
> Address handshake mechanism
> Write response channel implementation
> Read data channel with burst completion detection
> Internal memory model for data storage

## channels implemented
1.Write Address Channel (AW) – Carries write address and control signals
2.Write Data Channel (W) – Transfers data to the slave
3.Write Response Channel (B) – Provides write completion response
4.Read Address Channel (AR) – Sends read address information
5.Read Data Channel (R) – Returns data from the slave

## Verification environment
The verification environment is built using the Universal Verification Methodology (UVM) defined by Accellera Systems Initiative.
UVM Components:
> Sequence Item (Transaction)
> Sequencer
> Driver
> Monitor
> Agent
> Scoreboard
> Environment
> Test

## Tools Used
Simulation can be executed using industry standard simulators such as:
Synopsys VCS eda playground

## Learning Outcome
> This project demonstrates practical understanding of:
> AXI4 protocol operation
> SystemVerilog testbench architecture
> UVM based verification flow
> Burst transaction handling
> Protocol-level functional verification

## Author
DASI HONEY 
VLSI DV Trainee

