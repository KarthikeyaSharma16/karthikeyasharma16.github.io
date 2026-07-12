---
title: "Curriculum Vitae"
layout: "single"
showToc: true
TocOpen: true
---

[Download the PDF résumé](/pdf/Resume_hotmail.pdf)

## General Information

|  |  |
| --- | --- |
| **Full name** | Karthikeya Sharma M |
| **Email** | [karthikeyasharma@hotmail.com](mailto:karthikeyasharma@hotmail.com) |
| **Languages** | English (fluent), Hindi (fluent), Tamil (native), Telugu (fluent) |
| **Socials** | [LinkedIn](https://www.linkedin.com/in/karthikeyasharma16/) · [GitHub](https://github.com/KarthikeyaSharma16) · [Google Scholar](https://scholar.google.com/citations?user=O4Tya_YAAAAJ&hl=en) |

I am a graduate student pursuing an MS in ECE at Georgia Tech. My research interests broadly include computer architecture, domain-specific accelerators such as FPGAs and ASICs, and memory systems. Currently I am exploring the hardware-software co-design space and optimizing algorithms for efficient hardware implementations.

## Research Interests

**Hardware-Software Co-design**
- Sparse and dense dataflow accelerators — algorithm-to-hardware design
- Programming model (workload mapping)
- Interconnection network optimization and performance for distributed training and inference

**Reconfigurable Architectures**
- FPGA — routing, placement, and timing optimization
- CGRA — reconfigurable interconnects, dynamic partial reconfiguration

**Electronic Design Automation (EDA)**
- Design space exploration and analytical models for QoR estimation
- Frameworks for simulation, benchmarking, and validation of automatically generated hardware accelerator designs

## Education

### MS in Electrical and Computer Engineering
**Georgia Institute of Technology**, Atlanta, Georgia, USA — *Aug 2023 – May 2025*

Coursework: Advanced Computer Architecture (ECE6100), Hardware-Software Co-design for Machine Learning (CS8803 HLM), Parallel Programming for FPGA (ECE8903), Advanced Programming Techniques for Engineering Applications (ECE6122), Machine Learning (CS7641), Digital Systems Test (ECE6140), Computer Network Security (ECE6612)

### B.Tech in Electronics and Communication Engineering
**SRM Institute of Science and Technology**, Kattankulathur, Chennai, India — *Jul 2019 – May 2023*

Coursework: Digital Electronic Principles, Microprocessor/Microcontroller and Interfacing Techniques, ARM-Based Embedded System Design, VLSI Design, Digital Signal Processing, Mobile Application Development

## Technical Skills

| | |
| --- | --- |
| **Programming** | C, CUDA C, C++, Python, MATLAB, LaTeX, Verilog, SystemVerilog, High-Level Synthesis (HLS) |
| **Libraries** | OpenGL, OpenMP, OpenMPI, OpenCV, CuPy, SFML, PyTorch, scikit-learn, pandas, NumPy, Matplotlib |
| **Tools** | Xilinx Vivado, Vitis HLS, Quartus Prime, ModelSim, Icarus Verilog, Libero v12.5, Microsemi SoftConsole, Keil uVision, Code Composer Studio, Arduino IDE, Android Studio, LTspice |
| **Hardware** | Microsemi SmartFusion2, PYNQ-Z2, Arduino Uno, Raspberry Pi 3B, ARM Cortex-M3 (LPC1768, LPC2148), ARM Mbed |

## Research Experience

### Special Problems Student — Cicerone Lab @ Georgia Tech
*Aug 2024 – Dec 2024*
- Accelerated the signal-processing pipeline for hyperspectral Raman imaging by optimizing and porting the implementation to GPU.
- Resolved key bottlenecks in the pipeline to achieve significant speedup through batch processing of SVD.
- Implemented automated metrics for SVD vector selection, organized a post-processing analysis toolkit, and explored UNET phase error correction.

### Research Collaborator — Synergy Lab @ Georgia Tech
*Apr 2024 – Present*
- Created APEX, an automated toolchain for unifying open-source distributed ML frameworks to study the impact of network configurations on collective algorithms through design space exploration.
- Translated auto-generated collective algorithm synthesizer outputs (TACOS) into MSCCLang IR, represented collectives as standardized Chakra Execution Traces (ETs), and bypassed the system layer of ASTRA-Sim, reducing the engineering effort to create the IR for studying the impact of network parameters on collective algorithms in a distributed GPU setup.
- Developed a configuration file supporting translation of heterogeneous topologies, and an interactive visualizer illustrating collective flows over GPU networks using Chakra ETs.

### M.S. Thesis Student — SHARC Lab @ Georgia Tech
*Jan 2024 – Present*
- Contributed to a fully automated and validated framework for generating correct-by-design FPGA accelerators from verified straight-line C implementations of cryptographic primitives.
- Implemented hardware-specific optimizations using HLS, including loop transformations and memory reorganization with equivalence-preserving loop transformations for enhanced hardware synthesis.
- Main developer of **Cryptonite**, a toolchain automating generation of correct-by-design hardware accelerators for cryptographic primitives.
- Developed an automated DSE engine and analytical model to estimate the Quality of Results (QoR) of generated HLS C++ code.
- Achieved scalable designs with up to **88.88% reduced resource usage** and a **54.31% latency improvement** over naively synthesized straight-line C cryptographic primitives.

### Student Assistant — iSenSys Lab @ Georgia Tech
*Jan 2024 – Present*
- Implemented a real-time frequency data acquisition system using a Microsemi SmartFusion2 SoC to control a closed-loop battery-powered embedded chemical sensing device detecting volatile organic compounds with sub-ppm sensitivity.
- Interfaced an ARM Cortex-M3 MCU with an SPI-controlled FPGA implementing a reciprocal frequency counter, enabling timed data collection and power-down phases and **reducing power consumption by 42%**.

### Undergraduate Research Associate — SRM Institute of Science and Technology
*Jan 2022 – May 2023*

**Edge Processing for 3D Object Reconstruction**
- Built a cost-effective solution for 3D reconstruction of objects in underwater environments using stereo images taken from perspectives with known deviations in distance and angle.
- Developed an image-processing pipeline optimized with multi-threading for feature extraction and depth estimation, using epipolar geometry to stitch 2D images into 3D space.

**Terahertz Imaging for Aerospace Applications**
- Developed an image-processing pipeline to automate classification and detection of commonly occurring defects in aircraft composites.
- Collected a dataset of aircraft composites and evaluated supervised ML algorithms to identify the most suitable one for defect classification.

## Projects

### [Context-Aware Deepfake Detection](https://github.com/KarthikeyaSharma16/context-aware-deepfake-detection)
*Feb 2024 – May 2024*
- Created a custom dataset from YouTube and Reddit including metadata such as video descriptions and comments to provide contextual information for deepfake detection.
- Built a preprocessing pipeline to clean metadata — removing unwanted text patterns, translating languages, and applying lemmatization for tokenization and feature extraction.
- Applied unsupervised algorithms (BERTopic, GMM, K-Means) to classify contextual deepfake data.
- Implemented a Hierarchical Multi-modal Contextual Attention Network, achieving **91.7% training accuracy**.

### [Fault-Forge Sim](https://github.com/KarthikeyaSharma16/FaultForge-Sim)
*Aug 2023 – Dec 2023*
- Developed a C++ logic simulator for parsing netlist files, enabling fault-free output evaluation.
- Applied PODEM test generation to produce input vectors for combinational circuits, verified via deductive fault simulation.
- Achieved **99.71% average fault coverage** across all netlists used in testing.

### CMP Memory Simulator
*Nov 2023 – Dec 2023*
- Engineered a dual-core simulator with a multi-level memory hierarchy (L1, L2, DRAM) implementing LRU and random eviction policies.
- Optimized L2 shared cache utilization through Static Way Partitioning (SWP) and Dynamic Way Partitioning (DWP).
- Achieved a 0.85% performance enhancement in the optimized DWP implementation.

## Honors and Awards

**2023**
- Best Project Award runner-up at COMSPRO Capstone Project Expo 2023
- Certificate of Recognition for Outstanding Performance in Academics throughout B.Tech
- Performance-Based Scholarship, academic year 2021–22

**2021** — Performance-Based Scholarship, academic year 2020–21

**2020** — Performance-Based Scholarship, academic year 2019–20

## Teaching

### Graduate Teaching Assistant
*Aug 2024 – Dec 2024*
- GTA for CS6340 — Software Analysis and Test.
- Conducted weekly office hours, graded assignments, and provided feedback to students.
- Assisted in developing course materials and conducted exam review sessions.
- Collaborated with the professor to create and grade assignments and exams.

## Volunteering

### Volunteer, National Service Scheme — *2019*
- Promoted social awareness, cleaned water bodies, and ran tree plantation campaigns.
- Led a campaign educating young minds on the importance of social service.

## Leadership

### Committee Head, Aaruush 2021 — *2021*
- Spearheaded a series of virtual hackathons during the COVID-19 lockdown, building a network across the Asia-Pacific region.
- Coordinated with organizing divisions virtually, maintaining transparency and effective communication.
- Managed a team of 10, delegating tasks and ensuring timely delivery.
