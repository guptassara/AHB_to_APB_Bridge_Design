AHB2APB Bridge Design
Overview

This repository contains the implementation of an AHB2APB bridge designed in Verilog. The AHB2APB bridge is used to connect an Advanced High-performance Bus (AHB) to an Advanced Peripheral Bus (APB), facilitating communication between high-speed and low-speed peripherals. The design is implemented using Verilog and tested using ModelSim for simulation and Quartus Prime for synthesis and FPGA implementation.

Features
    AHB Master Interface: Captures and decodes the AHB protocol signals.
    APB Slave Interface: Translates the signals from the AHB master to the APB slave interface.
    Address Decoding: Decodes the address and forwards the data to the appropriate APB peripheral.
    Data Transfer: Handles read/write operations between AHB and APB.

Software used:
    ModelSim: For simulating the design.
    Quartus Prime: For synthesizing and implementing the design on FPGA.

