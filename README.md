# How to Land a Frontier Lab Job — A Course From Zero

An interactive, beginner→advanced course built from Vladimir Feinberg's essay
[*"How to Land a Frontier Lab Job"*](https://vladfeinberg.com/2026/05/10/how-to-land-a-job-at-a-frontier-lab.html).
It assumes you know **nothing** and climbs to the real techniques: kernels, Flash Attention,
quantization, agent research, JAX, and scaling laws.

## How to open it

**Easiest:** double-click `index.html` — it opens in any browser, no install needed.

> First open works best **with internet**: the fancy fonts load from Google Fonts on first
> view and then cache. Offline, it still works perfectly — it just falls back to your system
> serif/monospace fonts. Everything else (quizzes, search, glossary, progress, diagrams) is
> fully self-contained and needs no internet ever.

**Alternative (a local server):** from this folder run
`python -m http.server 8000` and visit `http://localhost:8000/index.html`.

## What's inside

- **10 modules**, 35 knowledge-check quizzes, 18 hand-drawn diagrams, 10 code walkthroughs,
  an 82-term hover-glossary, full-text search, dark/light themes, and progress that saves in
  your browser (nothing is uploaded).
- The **Module 08** JAX "addition transformer" code was test-run on real JAX/Flax/Optax and
  trains correctly (~10.7M params, loss converges).
- **Papers track** — a separate group at the bottom of the sidebar that walks through landmark
  research papers in plain English, figure by figure. First entry: *Attention Is All You Need*
  (Vaswani et al., 2017). Original figures are included locally under
  `images/papers/attention-is-all-you-need/`.

## One honest caveat

Three works the essay references use **future-dated arXiv IDs** (FlashAttention-4 `2603.05451`,
Barbarians at the Gate `2510.06189`, AlphaEvolve `2506.13131`). Those modules teach the
**technique family** (which is stable, well-established knowledge) and include "source note"
callouts flagging exactly where to verify specifics. Don't quote those specific modules as a
primary source for author names or benchmark numbers — read the papers themselves for that.

## Editing / rebuilding

The course is assembled from parts in `build/`:
- `build/_shell.html` — the page shell (all CSS + the JavaScript engine)
- `build/m0.html` … `build/m8.html` — one HTML fragment per module
- `CONTRACT.md` — the authoring spec every module follows

Rebuild `index.html` after editing any fragment:

```powershell
./build.ps1 -Fragments m0.html,m1a.html,m1b.html,m2.html,m3.html,m4.html,m5.html,m6.html,m7.html,m8.html,p0.html
```

Paper fragments live alongside module fragments and use `data-track="papers"` so the engine
groups them under a "PAPERS" header in the sidebar.
