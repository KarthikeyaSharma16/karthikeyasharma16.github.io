---
title: "About"
showToc: false
# /about/ used to be its own page; keep old links working.
aliases: ["/about/"]
---

Hi 👋! I am a Hardware Engineer at MangoBoost, Inc., working on DPU system architecture and GPU-server workload analysis. What I care about is how machines are wired together and what that costs the workload running on them: the interconnects and fabrics — PCIe, CXL, RoCEv2 — the programmable devices that sit on them, and the system stack that has to make all of it usable. My day-to-day is the full path from an application workload down to the silicon that runs it, and most of it lives in making that path scale: across the network with RDMA and NVMe-over-RDMA for I/O acceleration and storage disaggregation, and within a node through prefetch, offload, and hardware-software co-design.

Before that, I was a graduate student pursuing an MS in the Department of Electrical and Computer Engineering by research under the supervision of **[Prof. Callie Hao](https://sites.gatech.edu/ece-callie/)** at Georgia Tech's **[SHARC Lab](https://sharclab.ece.gatech.edu)**.

In addition to my academic pursuits, I enjoy playing games, watching Formula 1, exploring history, and being an avid aviation enthusiast.

## Research Interests

My **primary** interests are interconnects and fabrics (PCIe, CXL), DPU architecture, systems engineering, and computer architecture — CPU and GPU microarchitecture together with the hardware design that realizes it. The **supporting** areas below are the ones I lean on to get there: the inference stack — the serving framework, the compiler that lowers it, and the kernels it ends up running — defines the workload, the OS and drivers decide how that workload reaches the hardware, and accelerator and reconfigurable design is where it lands.

```mermaid
flowchart TD
    subgraph SW[" Workload &amp; software stack "]
    direction TB
        S1["`**Inference serving**
        vLLM · continuous batching · PagedAttention`"]
        S3["`**Compiler design**
        IR · passes · codegen · auto-vectorization`"]
        S2["`**High-performance kernels**
        CUDA · AVX/SIMD · memory coalescing`"]
        S4["`**OS & drivers**
        Scheduling · memory management · drivers · NUMA`"]

        S1 --> S3
        S3 --> S2
        S2 --> S4
    end

    subgraph HW[" Hardware &amp; fabric "]
    direction TB
        P1["`**Interconnects & fabrics**
        PCIe · CXL · NVLink / NVLink-C2C · UALink · RoCEv2`"]
        P2["`**DPU architecture**
        RDMA offload · SmartNIC datapath · storage acceleration`"]
        S5["`**ASIC / NPU & reconfigurable**
        Domain-specific accelerators · FPGA · CGRA`"]
        P4["`**Computer architecture**
        CPU & GPU microarchitecture · HLS & RTL design`"]

        P1 --> P2
        P2 --> P4
        S5 --> P4
    end

    P3["`**Systems engineering**
    Storage disaggregation · KV-cache offload · prefetch · scheduling`"]

    S4 --> P3
    P4 --> P3

    style P1 fill:#534AB7,stroke:#3C3489,color:#EDECFB,stroke-width:3px
    style P2 fill:#993C1D,stroke:#712B13,color:#FBEAE3,stroke-width:3px
    style P3 fill:#0F6E56,stroke:#085041,color:#E2F6EE,stroke-width:3px
    style P4 fill:#185FA5,stroke:#0C447C,color:#E4F0FC,stroke-width:3px

    style S1 fill:#F4F4F2,stroke:#9B9B97,color:#4A4A47,stroke-dasharray:4 3
    style S2 fill:#F4F4F2,stroke:#9B9B97,color:#4A4A47,stroke-dasharray:4 3
    style S3 fill:#F4F4F2,stroke:#9B9B97,color:#4A4A47,stroke-dasharray:4 3
    style S4 fill:#F4F4F2,stroke:#9B9B97,color:#4A4A47,stroke-dasharray:4 3
    style S5 fill:#F4F4F2,stroke:#9B9B97,color:#4A4A47,stroke-dasharray:4 3

    style SW fill:none,stroke:#B0B0AC,color:#8A8F98
    style HW fill:none,stroke:#B0B0AC,color:#8A8F98
```

<p class="diagram-hint">Solid boxes are primary interests, dashed are supporting. Click any box to open its details.</p>

<details class="focus-details">
<summary>Browse all focus areas as a list</summary>

<h3>Primary Interests</h3>

<div class="focus-grid">

<div class="focus-card" data-node="P1" style="--key:#534AB7">
  <h4>Interconnects &amp; Fabrics</h4>
  <ul>
    <li><b>PCIe</b> — Gen5/Gen6 links, DMA engines, endpoint and root-complex behavior</li>
    <li><b>CXL</b> — memory expansion and pooling, type-2/type-3 devices, coherence</li>
    <li><b>NVLink / NVLink-C2C, UALink</b> — scale-up accelerator fabrics and topologies</li>
    <li><b>RoCEv2, NVMe-over-RDMA</b> — scale-out I/O and storage disaggregation</li>
  </ul>
</div>

<div class="focus-card" data-node="P2" style="--key:#993C1D">
  <h4>DPU Architecture</h4>
  <ul>
    <li>RDMA offload and networking datapath design</li>
    <li>SmartNIC programmability — what belongs on the device vs. the host</li>
    <li>Storage and network acceleration, on-the-fly processing in the data path</li>
  </ul>
</div>

<div class="focus-card" data-node="P3" style="--key:#0F6E56">
  <h4>Systems Engineering</h4>
  <ul>
    <li><b>Across the network</b> — storage disaggregation, KV-cache offload, model offload to SSDs</li>
    <li><b>Within the node</b> — weight prefetch, scheduling, prediction algorithms</li>
    <li>Workload characterization and end-to-end benchmarking of the deployed stack</li>
  </ul>
</div>

<div class="focus-card" data-node="P4" style="--key:#185FA5">
  <h4>Computer Architecture</h4>
  <ul>
    <li><b>CPU</b> — pipeline, cache hierarchy, branch prediction, NUMA effects</li>
    <li><b>GPU</b> — SM, tensor cores, HBM, NVLink and PCIe attachment</li>
    <li><b>Hardware design</b> — HLS, C-to-RTL, Verilog/SystemVerilog, timing closure</li>
    <li>Hardware-software co-design and interconnection network optimization</li>
  </ul>
</div>

</div>

<h3>Supporting Areas</h3>

<div class="focus-grid">

<div class="focus-card" data-node="S1" style="--key:#6B6B66">
  <h4>Inference Serving</h4>
  <ul>
    <li><b>Serving stacks</b> — vLLM, continuous batching, PagedAttention, tensor parallelism</li>
    <li><b>AI agents</b> — session profiling, tool-call latency, offloading strategies</li>
    <li>On-prem and sandboxed deployment, framework benchmarking</li>
  </ul>
</div>

<div class="focus-card" data-node="S2" style="--key:#6B6B66">
  <h4>High-Performance Kernels</h4>
  <ul>
    <li><b>GPU</b> — CUDA, warp scheduling, memory coalescing</li>
    <li><b>CPU</b> — AVX/SIMD vectorization, cache-aware data layout</li>
  </ul>
</div>

<div class="focus-card" data-node="S3" style="--key:#6B6B66">
  <h4>Compiler Design</h4>
  <ul>
    <li>IR, passes, codegen, auto-vectorization</li>
    <li>Hardware compilers — mapping workloads onto accelerators</li>
  </ul>
</div>

<div class="focus-card" data-node="S4" style="--key:#6B6B66">
  <h4>OS &amp; Drivers</h4>
  <ul>
    <li>Process/thread scheduling, memory management, NUMA</li>
    <li>Device drivers — the seam between the fabric and the software stack</li>
  </ul>
</div>

<div class="focus-card" data-node="S5" style="--key:#6B6B66">
  <h4>ASIC / NPU &amp; Reconfigurable</h4>
  <ul>
    <li><b>Domain-specific accelerators</b> — sparse and dense dataflow design</li>
    <li><b>FPGA</b> — routing, placement, and timing optimization</li>
    <li><b>CGRA</b> — reconfigurable interconnects, dynamic partial reconfiguration</li>
  </ul>
</div>

</div>

</details>

### Contact

- **Email:** [sharmakarthikeya6@gmail.com](mailto:sharmakarthikeya6@gmail.com)
- **LinkedIn:** [linkedin.com/in/karthikeyasharma16](https://www.linkedin.com/in/karthikeyasharma16/)
