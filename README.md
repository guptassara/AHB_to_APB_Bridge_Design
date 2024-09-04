# AHB to APB Bridge Design

## Overview

This repository contains the implementation of an AHB to APB (AHB2APB) bridge designed in Verilog, using the AMBA protocol. The design is tested using ModelSim for simulation and Quartus Prime for synthesis and FPGA implementation. The bridge facilitates communication between high-speed AHB and low-speed APB peripherals, making it essential for efficient data transfer in systems-on-chip (SoCs).

## AMBA Protocol

The Advanced Microcontroller Bus Architecture (AMBA) is an open-standard, on-chip interconnect specification for the connection and management of functional blocks in a system-on-chip (SoC). AMBA is widely used in ARM-based processors and other SoC designs due to its flexibility and ease of integration.

### AMBA Protocol Features

- **Modular Design**: AMBA facilitates easy integration of peripherals and modules.
- **High Throughput**: Ensures efficient data transfer with minimal latency.
- **Scalability**: Can be used in a wide range of devices, from simple microcontrollers to complex SoCs.

## AHB Protocol

The Advanced High-performance Bus (AHB) is a part of the AMBA protocol family and is designed for high-speed, high-bandwidth communication. It is used to connect the processor, on-chip memory, and other high-speed components.

### AHB Protocol Features

- **Pipelined Operation**: Supports burst transfers and pipelining for high data throughput.
- **Single-Clock Edge Operation**: Simplifies timing analysis and implementation.
- **Split Transactions**: Allows the bus to be released for other operations during a long data transfer.

### AHB Signals

- **HCLK**: Clock signal for synchronization.
- **HRESETn**: Active-low reset signal.
- **HADDR**: Address bus.
- **HTRANS**: Transfer type (IDLE, BUSY, NONSEQ, SEQ).
- **HWRITE**: Write control signal.
- **HSIZE**: Transfer size (byte, halfword, word).
- **HBURST**: Burst type (single, increment, wrap).
- **HWDATA**: Write data bus.
- **HRDATA**: Read data bus.
- **HREADY**: Indicates the completion of the current transfer.
- **HRESP**: Transfer response (OKAY, ERROR, RETRY, SPLIT).

## APB Protocol

The Advanced Peripheral Bus (APB) is another part of the AMBA protocol, designed for low-power, low-bandwidth communication. It is typically used to connect simple peripherals like timers, UARTs, and GPIOs.

### APB Protocol Features

- **Low Power Consumption**: Optimized for peripherals that do not require high-speed communication.
- **Simplified Interface**: Minimal control signals, making it easier to integrate.
- **Single-Cycle Access**: Each transfer is completed in a single cycle.

### APB Signals

- **PCLK**: Clock signal for synchronization.
- **PRESETn**: Active-low reset signal.
- **PADDR**: Address bus.
- **PWRITE**: Write control signal.
- **PSELx**: Peripheral select signal.
- **HTRANS**: Indicates the type of the current transfer. 
- **PENABLE**: Enable signal for transfer.
- **PWDATA**: Write data bus.
- **PRDATA**: Read data bus.
- **PREADY**: Indicates the readiness of the peripheral.


## Getting Started

### Prerequisites

- **ModelSim**: For simulating the design.
- **Quartus Prime**: For synthesizing and implementing the design on FPGA.

### Cloning the Repository

```bash
git clone https://github.com/guptassara/AHB_to_APB_Bridge_Design.git
cd AHB_to_APB_Bridge_Design
```



## Contributing

Contributions are welcome! Please feel free to submit issues, fork the repository, and make pull requests.


## Contact

For any queries or support, please contact [gupta.ssara@gmail.com].
