---
title: "Research"
layout: "single"
showToc: true
TocOpen: true
---

## Research Background
My main background is in computer architecture, and more recently systems engineering. 

- **Computer Architecture**
  - CPU & GPU microarchitecture
  - Dataflow accelerators 
    - Design-space exploration
    - Algorithm-to-hardware co-design and workload mapping
  - FPGA design
    - High-Level Synthesis
- **Networking**
  - Shell & NIC design for programmable DPUs (BoostX VP1202, U45N)
- **Systems Engineering**
  - RDMA 
  - NVMe-over-RDMA
  - Network fabric offload — DPU and SmartNIC datapaths
  - Data Center Architecture (Rack-Scale infrastructure)
    - Reference Architectures such as NVIDIA HGX, STX etc.
- **Systems Software**
  - Collective communication concepts + optimizing collectives using MSCCL

## Research Interests

My research interests cover (but are not limited to) the topics I list below:

- **Computer Architecture**
  - CPU microarchitecture
  - Dataflow accelerators
    - Compiler and DSLs for custom accelerators
  - Interconnects and fabrics (PCIe, CXL, NVLink/UALink etc)
  - Heterogenous computing
- **Networking**
  - NIC & DPU architecture
  - CXL-NIC architecture
- **Systems Engineering**
  - RDMA (RoCEv2), Infiniband
  - GPUDirect RDMA
  - NVMe-over-RDMA for Storage disaggregation
  - Network fabric offload — DPU and SmartNIC datapaths
  - KV-cache offloading & compression
- **System Software**
  - Collective communication libraries (NCCL, MSCCL) and transfer libraries (NIXL)
  - Inference serving and KV-cache management (vLLM, LMCache)

## Research Vision

As AI infrastructure scales to support agentic workloads, performance is constrained by full-system optimization: from the software stack down to the network fabric and the system's ability to handle on-the-fly data processing as workloads scale out. My research would focus on answering three key questions:

1. How should data move between accelerators, hosts, and storage once a model outgrows a single node?
2. What belongs on the network fabric — the DPU, the SmartNIC, the interconnect — and what belongs in the software stack above it?
3. What do serving frameworks and communication libraries have to change to use those fabrics well?

## How These Fit Together

The diagram below summarizes my view of the software and hardware ecosystem — my **primary** interest
areas and **secondary / supporting** ones. Systems engineering sits in the middle because that is where
the two sides meet: it is the work of making a software stack actually exploit the hardware beneath it.

**Click any box in the flowchart below to open its details.**

<div class="stack-map">

  <section class="stack-col">
    <h4 class="stack-col-title">Software stack</h4>
    <div class="stack-flow">
      <button type="button" class="stack-tile is-supporting" data-node="S1">Inference serving</button>
      <button type="button" class="stack-tile is-supporting" data-node="S2">High-performance kernels</button>
      <button type="button" class="stack-tile is-supporting" data-node="S3">Compiler design</button>
      <button type="button" class="stack-tile" data-node="P5">Communication libraries</button>
      <button type="button" class="stack-tile is-supporting" data-node="S4">OS &amp; drivers</button>
    </div>
  </section>

  <div class="stack-bridge">
    <span class="bridge-arm bridge-arm--left" aria-hidden="true"></span>
    <span class="bridge-arm bridge-arm--right" aria-hidden="true"></span>
    <button type="button" class="stack-tile" data-node="P3">
      Systems engineering
      <span class="stack-tile-note">connects the software stack to the hardware</span>
    </button>
  </div>

  <section class="stack-col">
    <h4 class="stack-col-title">Hardware</h4>
    <div class="stack-flow">
      <div class="stack-group">
        <span class="stack-group-title">Architecture paradigms</span>
        <div class="stack-quad">
          <button type="button" class="stack-tile" data-node="H1">CPU</button>
          <button type="button" class="stack-tile is-supporting" data-node="H2">GPU</button>
          <button type="button" class="stack-tile" data-node="H3">FPGA</button>
          <button type="button" class="stack-tile" data-node="H4">Custom ASIC</button>
        </div>
      </div>
      <div class="stack-pair">
        <button type="button" class="stack-tile" data-node="P2">Network fabric</button>
        <button type="button" class="stack-tile" data-node="P1">Interconnects</button>
      </div>
    </div>
  </section>

</div>

<p class="diagram-legend">
  <span class="legend-item"><span class="legend-swatch legend-primary"></span>Primary interest</span>
  <span class="legend-item"><span class="legend-swatch legend-supporting"></span>Supporting area</span>
</p>

<details class="focus-details">
<summary>Browse all focus areas as a list</summary>

**Primary Interests**

<div class="focus-grid">

<div class="focus-card" data-node="P1" style="--key:#2A6DB0">
  Interconnects
  <ul>
    <li><b>PCIe</b> — Gen5/Gen6 links, DMA engines, endpoint and root-complex behavior</li>
    <li><b>CXL</b> — memory expansion and pooling, type-1,2,3 devices</li>
    <li><b>NVLink, UALink</b> — scale-up accelerator fabrics and topologies</li>
  </ul>
</div>

<div class="focus-card" data-node="P2" style="--key:#2A6DB0">
  Network Fabric
  <ul>
    <li>RDMA offload and networking datapath design</li>
    <li>SmartNIC programmability — what belongs on the device vs. the host</li>
    <li>On-the-fly processing in the data path</li>
  </ul>
</div>

<div class="focus-card" data-node="P3" style="--key:#2A6DB0">
  Systems Engineering
  <ul>
    <li><b>Across the network</b> — storage disaggregation, KV-cache offload, model offload to SSDs</li>
    <li><b>Within the node</b> — weight prefetch, scheduling, prediction algorithms</li>
    <li><b>RoCEv2, NVMe-over-RDMA</b> — scale-out I/O and storage disaggregation</li>
    <li>Workload characterization and end-to-end benchmarking of the deployed stack</li>
  </ul>
</div>

<div class="focus-card" data-node="P5" style="--key:#2A6DB0">
  Communication Libraries
  <ul>
    <li><b>Collective libraries</b> — NCCL, RCCL, MPI: topology-aware algorithm selection</li>
    <li><b>Transfer abstraction</b> — NIXL, UCX: moving tensors across HBM, host memory, SSD, and the network behind one API</li>
    <li>Where the fabric surfaces in software — how these calls map onto NVLink, PCIe, and RDMA decides whether the interconnect is actually used well</li>
  </ul>
</div>

<div class="focus-card" data-node="H1" style="--key:#2A6DB0">
  CPU
  <ul>
    <li>NUMA effects and cache-aware data layout</li>
    <li>How are agent-ready CPUs (like NVIDIA Vera, AMD Venice different from the previous generation NVIDIA Grace, AMD EPYC CPUs?)</li>
  </ul>
</div>

<div class="focus-card" data-node="H3" style="--key:#2A6DB0">
  FPGA
  <ul>
    <li><b>Design flow</b> — HLS, C-to-RTL, Verilog/SystemVerilog</li>
    <li><b>Implementation</b> — routing, placement, timing closure</li>
  </ul>
</div>

<div class="focus-card" data-node="H4" style="--key:#2A6DB0">
  Custom ASIC
  <ul>
    <li>Domain-specific accelerators — sparse and dense dataflow design</li>
    <li>Algorithm-to-hardware co-design and workload mapping</li>
    <li>Design-space exploration</li>
  </ul>
</div>

</div>

**Supporting Areas**

<div class="focus-grid">

<div class="focus-card" data-node="H2" style="--key:#6B6B66">
  GPU
  <ul>
    <li>SM design, tensor cores, warp scheduling, occupancy</li>
    <li>HBM bandwidth and the memory hierarchy behind it</li>
    <li>Host attachment over PCIe, scale-up over NVLink</li>
  </ul>
</div>

<div class="focus-card" data-node="S1" style="--key:#6B6B66">
  Inference Serving
  <ul>
    <li><b>Serving stacks</b> — vLLM, continuous batching, PagedAttention, tensor parallelism</li>
    <li><b>AI agents</b> — session profiling, tool-call latency, offloading strategies</li>
  </ul>
</div>

<div class="focus-card" data-node="S2" style="--key:#6B6B66">
  High-Performance Kernels for AI operators
  <ul>
    <li><b>GPU</b> — CUDA, warp scheduling, memory coalescing</li>
  </ul>
</div>

<div class="focus-card" data-node="S3" style="--key:#6B6B66">
  Compiler Design
  <ul>
    <li>IR, passes, codegen, auto-vectorization</li>
    <li>Hardware compilers — mapping workloads onto accelerators &amp; DSLs</li>
  </ul>
</div>

<div class="focus-card" data-node="S4" style="--key:#6B6B66">
  OS &amp; Drivers
  <ul>
    <li>Process/thread scheduling, memory management, NUMA</li>
  </ul>
</div>

</div>

</details>
