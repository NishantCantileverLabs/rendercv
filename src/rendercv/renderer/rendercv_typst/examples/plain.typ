#import "@preview/rendercv:0.3.0": *

// The rendercv package's link function requires the package's configuration
// state, so replace it with a plain hyperlink that keeps the current text style.
#let link(dest, body, icon: none, if-underline: none, if-color: none) = original-link(dest, body)

// Setup Page Rules & Variables
#set document(
  author: "John Doe",
  title: "John Doe - CV",
  date: datetime(
    year: 2026,
    month: 8,
    day: 3,
  ),
)
#set page(
  paper: "a4",
  margin: (
    top: 1.5cm,
    bottom: 1.5cm,
    left: 1.5cm,
    right: 1.5cm
  )
)
#set text(
  font: ("Arial", "Helvetica", "Liberation Sans", "sans-serif"),
  size: 10pt,
  fill: rgb(0, 0, 0),
)

// Paragraph justification for the summary
#set par(justify: true)

// --- Helpers ---

// Section headings with a bottom border
#let section-heading(title) = {
  v(12pt)
  text(size: 14pt, weight: "bold", fill: rgb(0, 0, 0))[#title]
  v(-8pt)
  line(length: 100%, stroke: 0.8pt + rgb(0, 0, 0))
  v(4pt)
}

// Two-column line: title left, date/place right
#let entry-line(title, right) = {
  grid(
    columns: (1fr, auto),
    text(weight: "bold")[#title],
    text(weight: "bold")[#right]
  )
}

#let contact() = (
  [#connection-with-icon("location-dot")[San Francisco, CA]],
  [#link("mailto:john.doe@email.com", icon: false, if-underline: false, if-color: false)[#connection-with-icon("envelope")[john.doe\@email.com]]],
  [#link("https://rendercv.com/", icon: false, if-underline: false, if-color: false)[#connection-with-icon("link")[rendercv.com]]],
  [#link("https://linkedin.com/in/rendercv", icon: false, if-underline: false, if-color: false)[#connection-with-icon("linkedin")[rendercv]]],
  [#link("https://github.com/rendercv", icon: false, if-underline: false, if-color: false)[#connection-with-icon("github")[rendercv]]],
)
#align(center)[
  #text(size: 28pt, weight: "bold", fill: rgb(0, 0, 0))[John Doe]
  #v(2pt)
  #text(size: 10pt)[#contact().join(text("  |  "))]
]
#v(8pt)

#section-heading("WELCOME TO RENDERCV")
RenderCV reads a CV written in a YAML file, and generates a PDF with professional typography.

Each section title is arbitrary.

You can choose any of the 9 entry types for each section.

Markdown syntax is supported everywhere. This is #strong[bold], #emph[italic], and #link("https://example.com")[link].
#v(0.01em)
#section-heading("EDUCATION")
#block[
  #text(weight: "bold", size: 11pt)[PhD]
  #linebreak()
  #entry-line(
    [Princeton University — Computer Science],
    [Princeton, NJ | Sept 2018 - May 2023]
  )
  #v(2pt)
  - Thesis: Efficient Neural Architecture Search for Resource-Constrained Deployment
  - Advisor: Prof. Sanjeev Arora
  - NSF Graduate Research Fellowship, Siebel Scholar (Class of 2022)
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Computer Engineering],
    [Istanbul, Türkiye | Sept 2014 - June 2018]
  )
  #v(2pt)
  - GPA: 3.97\/4.00, Valedictorian
  - Fulbright Scholarship recipient for Graduate Studies
]
#v(8pt)
#v(0.01em)
#section-heading("EXPERIENCE")
#block[
  #text(weight: "bold", size: 11pt)[Co-Founder & CTO]
  #linebreak()
  #entry-line(
    [Nexus AI | San Francisco, CA],
    [June 2023 - present]
  )
  #v(2pt)
  - Built foundation model infrastructure serving 2M+ monthly API requests with 99.97\% uptime
  - Raised \$18M Series A led by Sequoia Capital, with participation from a16z and Founders Fund
  - Scaled engineering team from 3 to 28 across ML research, platform, and applied AI divisions
  - Developed proprietary inference optimization reducing latency by 73\% compared to baseline
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Research Intern]
  #linebreak()
  #entry-line(
    [NVIDIA Research | Santa Clara, CA],
    [May 2022 - Aug 2022]
  )
  #v(2pt)
  - Designed sparse attention mechanism reducing transformer memory footprint by 4.2x
  - Co-authored paper accepted at NeurIPS 2022 (spotlight presentation, top 5\% of submissions)
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Research Intern]
  #linebreak()
  #entry-line(
    [Google DeepMind | London, UK],
    [May 2021 - Aug 2021]
  )
  #v(2pt)
  - Developed reinforcement learning algorithms for multi-agent coordination
  - Published research at top-tier venues with significant academic impact - ICML 2022 main conference paper, cited 340+ times within two years - NeurIPS 2022 workshop paper on emergent communication protocols - Invited journal extension in JMLR (2023)
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Research Intern]
  #linebreak()
  #entry-line(
    [Apple ML Research | Cupertino, CA],
    [May 2020 - Aug 2020]
  )
  #v(2pt)
  - Created on-device neural network compression pipeline deployed across 50M+ devices
  - Filed 2 patents on efficient model quantization techniques for edge inference
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Research Intern]
  #linebreak()
  #entry-line(
    [Microsoft Research | Redmond, WA],
    [May 2019 - Aug 2019]
  )
  #v(2pt)
  - Implemented novel self-supervised learning framework for low-resource language modeling
  - Research integrated into Azure Cognitive Services, reducing training data requirements by 60\%
]
#v(8pt)
#v(0.01em)
#section-heading("PROJECTS")
#block[
  #entry-line(
    [#link("https://github.com/")[FlashInfer]],
    [Jan 2023 - present]
  )
  #v(-8pt)
  #text(style: "italic")[Open-source library for high-performance LLM inference kernels]
  #v(2pt)
  - Achieved 2.8x speedup over baseline attention implementations on A100 GPUs
  - Adopted by 3 major AI labs, 8,500+ GitHub stars, 200+ contributors
]
#v(8pt)

#block[
  #entry-line(
    [#link("https://github.com/")[NeuralPrune]],
    [Jan 2021]
  )
  #v(-8pt)
  #text(style: "italic")[Automated neural network pruning toolkit with differentiable masks]
  #v(2pt)
  - Reduced model size by 90\% with less than 1\% accuracy degradation on ImageNet
  - Featured in PyTorch ecosystem tools, 4,200+ GitHub stars
]
#v(8pt)
#v(0.01em)
#section-heading("PUBLICATIONS")
#block[
  #entry-line(
    [Sparse Mixture-of-Experts at Scale: Efficient Routing for Trillion-Parameter Models],
    [July 2023]
  )
  #v(-8pt)
  #text(style: "italic")[#emph[John Doe], Sarah Williams, David Park — NeurIPS 2023]
]
#v(8pt)

#block[
  #entry-line(
    [Neural Architecture Search via Differentiable Pruning],
    [Dec 2022]
  )
  #v(-8pt)
  #text(style: "italic")[James Liu, #emph[John Doe] — NeurIPS 2022, Spotlight]
]
#v(8pt)

#block[
  #entry-line(
    [Multi-Agent Reinforcement Learning with Emergent Communication],
    [July 2022]
  )
  #v(-8pt)
  #text(style: "italic")[Maria Garcia, #emph[John Doe], Tom Anderson — ICML 2022]
]
#v(8pt)

#block[
  #entry-line(
    [On-Device Model Compression via Learned Quantization],
    [May 2021]
  )
  #v(-8pt)
  #text(style: "italic")[#emph[John Doe], Kevin Wu — ICLR 2021, Best Paper Award]
]
#v(8pt)
#v(0.01em)
#section-heading("SELECTED HONORS")
- MIT Technology Review 35 Under 35 Innovators (2024)

- Forbes 30 Under 30 in Enterprise Technology (2024)

- ACM Doctoral Dissertation Award Honorable Mention (2023)

- Google PhD Fellowship in Machine Learning (2020 – 2023)

- Fulbright Scholarship for Graduate Studies (2018)
#v(0.01em)
#section-heading("SKILLS")
- *Languages*: Python, C++, CUDA, Rust, Julia

- *ML Frameworks*: PyTorch, JAX, TensorFlow, Triton, ONNX

- *Infrastructure*: Kubernetes, Ray, distributed training, AWS, GCP

- *Research Areas*: Neural architecture search, model compression, efficient inference, multi-agent RL
#v(0.01em)
#section-heading("PATENTS")
+ Adaptive Quantization for Neural Network Inference on Edge Devices (US Patent 11,234,567)

+ Dynamic Sparsity Patterns for Efficient Transformer Attention (US Patent 11,345,678)

+ Hardware-Aware Neural Architecture Search Method (US Patent 11,456,789)
#v(0.01em)
#section-heading("INVITED TALKS")
#reversed-numbered-entries(
  [

+ Scaling Laws for Efficient Inference — Stanford HAI Symposium (2024)

+ Building AI Infrastructure for the Next Decade — TechCrunch Disrupt (2024)

+ From Research to Production: Lessons in ML Systems — NeurIPS Workshop (2023)

+ Efficient Deep Learning: A Practitioner's Perspective — Google Tech Talk (2022)
  ],
)
#v(0.01em)