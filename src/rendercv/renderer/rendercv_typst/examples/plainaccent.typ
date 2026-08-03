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

// Define the custom accent color
#let primary-color = rgb(106, 90, 158)

// --- Helpers ---

// Section headings with a bottom border
#let section-heading(title) = {
  v(10pt)
  text(size: 12pt, weight: "bold", fill: rgb(106, 90, 158))[#title]
  v(-8pt)
  line(length: 100%, stroke: 0.8pt + rgb(106, 90, 158))
  v(4pt)
}

// Standard Entry Formatting (title/location left, subtitle/date right)
#let cv-entry(title, location, subtitle, date, body: none) = {
  grid(
    columns: (1fr, auto),
    text(weight: "bold")[#title],
    text()[#location]
  )
  v(-8pt)
  grid(
    columns: (1fr, auto),
    text()[#subtitle],
    text()[#date]
  )
  if body != none {
    v(-4pt)
    body
  }
  v(4pt)
}

#let contact() = (
  [#connection-with-icon("location-dot")[San Francisco, CA]],
  [#link("mailto:john.doe@email.com", icon: false, if-underline: false, if-color: false)[#connection-with-icon("envelope")[john.doe\@email.com]]],
  [#link("https://rendercv.com/", icon: false, if-underline: false, if-color: false)[#connection-with-icon("link")[rendercv.com]]],
  [#link("https://linkedin.com/in/rendercv", icon: false, if-underline: false, if-color: false)[#connection-with-icon("linkedin")[rendercv]]],
  [#link("https://github.com/rendercv", icon: false, if-underline: false, if-color: false)[#connection-with-icon("github")[rendercv]]],
)
#align(center)[
  #text(size: 22pt, weight: "bold", fill: rgb(106, 90, 158))[JOHN DOE]
  #v(2pt)
  #text(size: 10pt)[#contact().join(text("  |  "))]
]
#v(8pt)

#section-heading("Welcome to RenderCV")
RenderCV reads a CV written in a YAML file, and generates a PDF with professional typography.

Each section title is arbitrary.

You can choose any of the 9 entry types for each section.

Markdown syntax is supported everywhere. This is #strong[bold], #emph[italic], and #link("https://example.com")[link].
#v(0.01em)
#section-heading("Education")
#cv-entry(
  [Princeton University],
  [Princeton, NJ],
  [PhD — Computer Science],
  [Sept 2018 - May 2023],
  body: [
- Thesis: Efficient Neural Architecture Search for Resource-Constrained Deployment
- Advisor: Prof. Sanjeev Arora
- NSF Graduate Research Fellowship, Siebel Scholar (Class of 2022)
  ]
)

#cv-entry(
  [Boğaziçi University],
  [Istanbul, Türkiye],
  [BS — Computer Engineering],
  [Sept 2014 - June 2018],
  body: [
- GPA: 3.97\/4.00, Valedictorian
- Fulbright Scholarship recipient for Graduate Studies
  ]
)
#v(0.01em)
#section-heading("Experience")
#cv-entry(
  [Nexus AI],
  [San Francisco, CA],
  [Co-Founder & CTO],
  [June 2023 - present],
  body: [
- Built foundation model infrastructure serving 2M+ monthly API requests with 99.97\% uptime
- Raised \$18M Series A led by Sequoia Capital, with participation from a16z and Founders Fund
- Scaled engineering team from 3 to 28 across ML research, platform, and applied AI divisions
- Developed proprietary inference optimization reducing latency by 73\% compared to baseline
  ]
)

#cv-entry(
  [NVIDIA Research],
  [Santa Clara, CA],
  [Research Intern],
  [May 2022 - Aug 2022],
  body: [
- Designed sparse attention mechanism reducing transformer memory footprint by 4.2x
- Co-authored paper accepted at NeurIPS 2022 (spotlight presentation, top 5\% of submissions)
  ]
)

#cv-entry(
  [Google DeepMind],
  [London, UK],
  [Research Intern],
  [May 2021 - Aug 2021],
  body: [
- Developed reinforcement learning algorithms for multi-agent coordination
- Published research at top-tier venues with significant academic impact - ICML 2022 main conference paper, cited 340+ times within two years - NeurIPS 2022 workshop paper on emergent communication protocols - Invited journal extension in JMLR (2023)
  ]
)

#cv-entry(
  [Apple ML Research],
  [Cupertino, CA],
  [Research Intern],
  [May 2020 - Aug 2020],
  body: [
- Created on-device neural network compression pipeline deployed across 50M+ devices
- Filed 2 patents on efficient model quantization techniques for edge inference
  ]
)

#cv-entry(
  [Microsoft Research],
  [Redmond, WA],
  [Research Intern],
  [May 2019 - Aug 2019],
  body: [
- Implemented novel self-supervised learning framework for low-resource language modeling
- Research integrated into Azure Cognitive Services, reducing training data requirements by 60\%
  ]
)
#v(0.01em)
#section-heading("Projects")
#cv-entry(
  [#link("https://github.com/")[FlashInfer]],
  [],
  [Open-source library for high-performance LLM inference kernels],
  [Jan 2023 - present],
  body: [
- Achieved 2.8x speedup over baseline attention implementations on A100 GPUs
- Adopted by 3 major AI labs, 8,500+ GitHub stars, 200+ contributors
  ]
)

#cv-entry(
  [#link("https://github.com/")[NeuralPrune]],
  [],
  [Automated neural network pruning toolkit with differentiable masks],
  [Jan 2021],
  body: [
- Reduced model size by 90\% with less than 1\% accuracy degradation on ImageNet
- Featured in PyTorch ecosystem tools, 4,200+ GitHub stars
  ]
)
#v(0.01em)
#section-heading("Publications")
#cv-entry(
  [Sparse Mixture-of-Experts at Scale: Efficient Routing for Trillion-Parameter Models],
  [],
  [#emph[John Doe], Sarah Williams, David Park — NeurIPS 2023],
  [July 2023],
  body: [
  ]
)

#cv-entry(
  [Neural Architecture Search via Differentiable Pruning],
  [],
  [James Liu, #emph[John Doe] — NeurIPS 2022, Spotlight],
  [Dec 2022],
  body: [
  ]
)

#cv-entry(
  [Multi-Agent Reinforcement Learning with Emergent Communication],
  [],
  [Maria Garcia, #emph[John Doe], Tom Anderson — ICML 2022],
  [July 2022],
  body: [
  ]
)

#cv-entry(
  [On-Device Model Compression via Learned Quantization],
  [],
  [#emph[John Doe], Kevin Wu — ICLR 2021, Best Paper Award],
  [May 2021],
  body: [
  ]
)
#v(0.01em)
#section-heading("Selected Honors")
- MIT Technology Review 35 Under 35 Innovators (2024)

- Forbes 30 Under 30 in Enterprise Technology (2024)

- ACM Doctoral Dissertation Award Honorable Mention (2023)

- Google PhD Fellowship in Machine Learning (2020 – 2023)

- Fulbright Scholarship for Graduate Studies (2018)
#v(0.01em)
#section-heading("Skills")
- *Languages*: Python, C++, CUDA, Rust, Julia

- *ML Frameworks*: PyTorch, JAX, TensorFlow, Triton, ONNX

- *Infrastructure*: Kubernetes, Ray, distributed training, AWS, GCP

- *Research Areas*: Neural architecture search, model compression, efficient inference, multi-agent RL
#v(0.01em)
#section-heading("Patents")
+ Adaptive Quantization for Neural Network Inference on Edge Devices (US Patent 11,234,567)

+ Dynamic Sparsity Patterns for Efficient Transformer Attention (US Patent 11,345,678)

+ Hardware-Aware Neural Architecture Search Method (US Patent 11,456,789)
#v(0.01em)
#section-heading("Invited Talks")
#reversed-numbered-entries(
  [

+ Scaling Laws for Efficient Inference — Stanford HAI Symposium (2024)

+ Building AI Infrastructure for the Next Decade — TechCrunch Disrupt (2024)

+ From Research to Production: Lessons in ML Systems — NeurIPS Workshop (2023)

+ Efficient Deep Learning: A Practitioner's Perspective — Google Tech Talk (2022)
  ],
)
#v(0.01em)