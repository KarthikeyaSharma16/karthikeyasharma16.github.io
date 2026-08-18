---
title: "About"
showToc: false
# /about/ used to be its own page; keep old links working.
aliases: ["/about/"]
---

Hi 👋!

I am a Hardware Engineer at **[MangoBoost, Inc.](https://www.mangoboost.io/)**, where I work on scaling data center infrastructure — DPU system architecture and GPU-server workload analysis.

My work follows a single path: an application workload down to the silicon that runs it. Most of it is spent making that path scale — across the network with RDMA and NVMe-over-RDMA for I/O acceleration and storage disaggregation, and within a node through prefetch, offload, and hardware-software co-design.

Before that, I was a graduate student pursuing an MS in the Department of Electrical and Computer Engineering by research under the supervision of **[Prof. Callie Hao](https://sites.gatech.edu/ece-callie/)** at Georgia Tech's **[SHARC Lab](https://sharclab.ece.gatech.edu)**.

In addition to my academic pursuits, I enjoy playing games, watching Formula 1, exploring history, and being an avid aviation enthusiast.

## Research Interests

My **primary** interests are systems engineering, computer architecture (DPU, CPU, GPU microarchitecture) and interconnects & fabrics (PCIe, CXL etc). The following diagram summarizes my view of the software and hardware ecosystem, my **primary** interest areas and **secondary / supporting** areas.

```mermaid
flowchart TD
    subgraph SW[" Workload &amp; software stack "]
    direction TB
        S1["`**Inference serving**`"]
        S3["`**Compiler design**
        (Codegen, IR optimization)`"]
        S2["`**High-performance kernels** 
        (CUDA kernels, DSLs)`"]
        P5["`**Communication libraries**
        (Collectives Communication (NCCL, MSCCL), transfers (NIXL), MPI)`"]
        S4["`**OS & drivers**
        (Scheduling, memory management, NUMA)`"]

        S1 --> S2
        S2 --> S3
        S3 --> P5
        P5 --> S4
    end

    subgraph HW[" Hardware "]
    direction TB
        subgraph ARCH[" Architecture paradigms "]
        direction LR
            H1["`**CPU**`"]
            H2["`**GPU**`"]
            H3["`**FPGA**`"]
            H4["`**Custom ASIC**
            (Domain-specific dataflow accelerators)`"]

            %% Invisible links: Mermaid ignores a subgraph's `direction` once the
            %% subgraph has edges crossing its boundary, so without these the four
            %% paradigms stack in a single column. Two separate chains lay them
            %% out as a 2x2 grid.
            H1 ~~~ H2
            H3 ~~~ H4
        end

        P2["`**Network fabric**
        (DPU, SmartNIC)`"]

        P1["`**Interconnects**
        (PCIe, CXL, NVLink)`"]

        ARCH --> P2
        ARCH --> P1
    end

    P3["`**Systems engineering**
    (Storage disaggregation, KV-cache offloading, KV Cache compression, NVMe-oF over RDMA, ROCEv2, NTI)`"]

    HW --> P3
    S4 --> P3

    style P1 fill:#DCEAF8,stroke:#2A6DB0,color:#123A5E,stroke-width:2px
    style P2 fill:#DCEAF8,stroke:#2A6DB0,color:#123A5E,stroke-width:2px
    style P3 fill:#DCEAF8,stroke:#2A6DB0,color:#123A5E,stroke-width:2px
    style P5 fill:#DCEAF8,stroke:#2A6DB0,color:#123A5E,stroke-width:2px
    style H1 fill:#DCEAF8,stroke:#2A6DB0,color:#123A5E,stroke-width:2px,stroke-dasharray:5 3
    style H2 fill:#F5F5F3,stroke:#A9A9A4,color:#4A4A47,stroke-dasharray:4 3
    style H3 fill:#DCEAF8,stroke:#2A6DB0,color:#123A5E,stroke-width:2px,stroke-dasharray:5 3
    style H4 fill:#DCEAF8,stroke:#2A6DB0,color:#123A5E,stroke-width:2px,stroke-dasharray:5 3

    style S1 fill:#F5F5F3,stroke:#A9A9A4,color:#4A4A47,stroke-dasharray:4 3
    style S2 fill:#F5F5F3,stroke:#A9A9A4,color:#4A4A47,stroke-dasharray:4 3
    style S3 fill:#F5F5F3,stroke:#A9A9A4,color:#4A4A47,stroke-dasharray:4 3
    style S4 fill:#F5F5F3,stroke:#A9A9A4,color:#4A4A47,stroke-dasharray:4 3

    style SW fill:#FBFBFA,stroke:#C9C9C4,color:#8A8F98
    style ARCH fill:#EFF5FB,stroke:#9EC0E0,color:#3F6C97
    style HW fill:#FBFBFA,stroke:#C9C9C4,color:#8A8F98
```

<p class="diagram-legend">
  <span class="legend-item"><span class="legend-swatch legend-primary"></span>Primary interest</span>
  <span class="legend-item"><span class="legend-swatch legend-supporting"></span>Supporting area</span>
  <span class="legend-note">Click any box to open its details.</span>
</p>

<details class="focus-details">
<summary>Browse all focus areas as a list</summary>

<h3>Primary Interests</h3>

<div class="focus-grid">

<div class="focus-card" data-node="P1" style="--key:#2A6DB0">
  <h4>Interconnects</h4>
  <ul>
    <li><b>PCIe</b> — Gen5/Gen6 links, DMA engines, endpoint and root-complex behavior</li>
    <li><b>CXL</b> — memory expansion and pooling, type-2/type-3 devices, coherence</li>
    <li><b>NVLink, UALink</b> — scale-up accelerator fabrics and topologies</li>
    <li><b>RoCEv2, NVMe-over-RDMA</b> — scale-out I/O and storage disaggregation</li>
  </ul>
</div>

<div class="focus-card" data-node="P2" style="--key:#2A6DB0">
  <h4>DPU — Network Fabric</h4>
  <ul>
    <li>RDMA offload and networking datapath design</li>
    <li>SmartNIC programmability — what belongs on the device vs. the host</li>
    <li>Storage and network acceleration, on-the-fly processing in the data path</li>
  </ul>
</div>

<div class="focus-card" data-node="P3" style="--key:#2A6DB0">
  <h4>Systems Engineering</h4>
  <ul>
    <li><b>Across the network</b> — storage disaggregation, KV-cache offload, model offload to SSDs</li>
    <li><b>Within the node</b> — weight prefetch, scheduling, prediction algorithms</li>
    <li>Workload characterization and end-to-end benchmarking of the deployed stack</li>
  </ul>
</div>

<div class="focus-card" data-node="P5" style="--key:#2A6DB0">
  <h4>Communication &amp; Data-Movement Libraries</h4>
  <ul>
    <li><b>Collective libraries</b> — NCCL, RCCL, oneCCL, MPI: all-reduce and all-gather, topology-aware algorithm selection</li>
    <li><b>Transfer abstraction</b> — NIXL, UCX: moving tensors across HBM, host memory, SSD, and the network behind one API</li>
    <li>Where the fabric surfaces in software — how these calls map onto NVLink, PCIe, and RDMA decides whether the interconnect is actually used well</li>
  </ul>
</div>

<div class="focus-card" data-node="H1" style="--key:#2A6DB0">
  <h4>CPU</h4>
  <ul>
    <li>Pipeline, cache hierarchy, branch prediction, memory ordering</li>
    <li>NUMA effects and cache-aware data layout</li>
    <li>AVX/SIMD vectorization for dense compute</li>
  </ul>
</div>

<div class="focus-card" data-node="H3" style="--key:#2A6DB0">
  <h4>FPGA</h4>
  <ul>
    <li><b>Design flow</b> — HLS, C-to-RTL, Verilog/SystemVerilog</li>
    <li><b>Implementation</b> — routing, placement, timing closure</li>
    <li><b>Reconfigurable fabric</b> — CGRA interconnects, dynamic partial reconfiguration</li>
  </ul>
</div>

<div class="focus-card" data-node="H4" style="--key:#2A6DB0">
  <h4>Custom ASIC</h4>
  <ul>
    <li>Domain-specific accelerators — sparse and dense dataflow design</li>
    <li>Algorithm-to-hardware co-design and workload mapping</li>
    <li>Design-space exploration from a verified software model</li>
  </ul>
</div>

</div>

<h3>Supporting Areas</h3>

<div class="focus-grid">

<div class="focus-card" data-node="H2" style="--key:#6B6B66">
  <h4>GPU</h4>
  <ul>
    <li>SM design, tensor cores, warp scheduling, occupancy</li>
    <li>HBM bandwidth and the memory hierarchy behind it</li>
    <li>Host attachment over PCIe, scale-up over NVLink</li>
  </ul>
</div>

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

</div>

</details>

### Contact

- **Email:** [sharmakarthikeya6@gmail.com](mailto:sharmakarthikeya6@gmail.com)
- **LinkedIn:** [linkedin.com/in/karthikeyasharma16](https://www.linkedin.com/in/karthikeyasharma16/)
