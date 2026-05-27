# CONTENT CONTRACT — Frontier Lab Course Module

You are writing **one module** of a single-page HTML course that teaches a total beginner how to land a job at a frontier AI lab, based on Vladimir Feinberg's essay. The page shell (CSS + JS engine) already exists. You output **one HTML fragment** that gets injected into it. Follow this contract **exactly** — the JS engine and styling depend on these class names and structures.

---

## 0. THE GOLDEN RULES (read twice)

1. **The reader knows NOTHING.** Define every technical term the first time you use it, in plain English, before using it in an argument. Assume no calculus, no ML, no GPU knowledge. Build from zero.
2. **Simple English.** Short sentences. Concrete analogies. No unexplained jargon. Friendly, confident, motivating — like a brilliant TA who respects the reader. When you must use a real term (the reader needs it to talk to researchers), introduce it, then keep using it.
3. **Beginner → advanced within the module.** Open simple. End at the real technical idea from the source. Use `<details class="aside">` to tuck away the hardest optional depth so beginners aren't blocked.
4. **Ground every claim.** Fetch your assigned sources (URLs below in your task). Explain what the technique/paper actually does. **Never invent author names, dataset names, benchmark numbers, or experimental results.** See the Fetch-Failure Rule (§9).
5. **Always connect back to the thesis:** *why does this skill help you get hired at a frontier lab?* Each module should remind the reader how this fits the "work at the edges of the LLM stack" strategy.
6. **Word budget: 1,800–3,000 words of prose** (not counting code/SVG/quiz markup). Be thorough but tight.

---

## 1. FRAGMENT STRUCTURE (STRICT WHITELIST)

Output **only** this, nothing else. No `<!DOCTYPE>`, `<html>`, `<head>`, `<body>`, `<style>`, no `<script>` except the single glossary JSON block at the very end.

```html
<section class="module" id="mXX" data-num="NN" data-title="Short Nav Title" data-level="LEVEL">
  <h2>The Full Module Title</h2>
  <p class="lead">One or two opening sentences that hook the reader and say what they'll be able to do by the end.</p>

  <!-- ... your content using ONLY the components in §2–§7 ... -->

  <!-- glossary terms you introduced (see §8) -->
  <script type="application/json" class="glossary-add">
  { "term-key": {"term":"Display Name","short":"≤140 char hover definition","long":"Fuller 1–3 sentence definition for the glossary panel.","tag":"optional category"} }
  </script>
</section>
```

- `id`, `data-num`, `data-title`, `data-level` will be **given to you** in your task. Use them exactly.
- `data-level` is one of: `intro`, `beginner`, `core`, `advanced`.
- Do **NOT** add a module number, level badge, "mark complete" button, or "next" link — the engine injects those automatically. Just write `<h2>` then content.
- Allowed tags: `h2 h3 h4 p ul ol li strong em a code br hr.rule blockquote` + all components below + inline SVG. Nothing else.

---

## 2. PROSE COMPONENTS (copy these patterns)

**Lead paragraph** (once, right after `<h2>`):
```html
<p class="lead">Big friendly framing sentence. <b>Bolded promise of what they'll learn.</b></p>
```

**Section headings.** Use `<h3>` for major subsections, `<h4>` (renders as a small mono label) for minor ones. You may number h3s: `<h3><span class="h3-num">3.1</span> Title</h3>`.

**Callouts** — use freely to break up text. Pick the right type:
```html
<div class="callout key"><p class="co-h">Key idea</p><p>The single most important takeaway.</p></div>
<div class="callout note"><p class="co-h">Good to know</p><p>Helpful context or a tip.</p></div>
<div class="callout analogy"><p class="co-h">Analogy</p><p>A plain-life comparison that builds intuition.</p></div>
<div class="callout warn"><p class="co-h">Watch out</p><p>A common misconception or trap.</p></div>
```

**Pull-quote** (for quoting the essay or a paper):
```html
<blockquote class="callout quote">"The quote text."<cite>— Source</cite></blockquote>
```

**Concept card** — to formally introduce a named concept:
```html
<div class="concept"><p class="c-tag">Concept</p><h4>Arithmetic Intensity</h4><p>Plain-English definition and why it matters.</p></div>
```

**Checkpoint** — end most modules with this "you can now…" box:
```html
<div class="checkpoint"><p class="cp-h">✓ Checkpoint — you should now be able to…</p>
<ul><li>Explain X in one sentence.</li><li>Say why Y matters for a lab.</li></ul></div>
```

**Comparison table:**
```html
<div class="tbl-wrap"><table class="data"><caption>Optional caption</caption>
<thead><tr><th>Thing</th><th>Pro</th><th>Con</th></tr></thead>
<tbody><tr><td><b>Name</b></td><td>…</td><td>…</td></tr></tbody>
</table></div>
```

**Collapsible deep-dive** (hide hard/optional material):
```html
<details class="aside"><summary>Optional deep dive: the actual math <span class="aside-tag">advanced</span></summary>
<div class="aside-body"><p>…</p></div></details>
```

---

## 3. MATH (no LaTeX, no dependencies — use these)

Inline math: wrap variables in `<span class="var">x</span>` and use real Unicode operators: `× · ÷ √ ² ³ ₀ ₁ ₂ ∝ ≈ ≤ ≥ ≠ → ⇒ Σ ∏ ∈ ∇ θ α β γ λ μ √ ⌈ ⌉`. Superscripts `<sup>2</sup>`, subscripts `<sub>i</sub>`.

Display equation block:
```html
<div class="eq">Attention(<span class="var">Q,K,V</span>) = softmax<span class="op">(</span>
  <span class="frac"><span class="fn"><span class="var">Q K</span><sup>⊤</sup></span><span class="fd">√<span class="var">d</span><sub>k</sub></span></span>
  <span class="op">)</span> <span class="var">V</span>
  <span class="eqn-tag">— scaled dot-product attention</span></div>
```
Fractions use `<span class="frac"><span class="fn">numerator</span><span class="fd">denominator</span></span>`. Keep math light — prefer intuition; show one or two clean display equations per module max. Always explain every symbol immediately after.

---

## 4. DIAGRAMS (inline SVG — consistency is mandatory)

Wrap every diagram:
```html
<figure class="figure"><div class="fig-body">
  <svg class="diagram" viewBox="0 0 720 320" role="img" aria-label="describe it">
     ... use ONLY the class names below for fills/strokes ...
  </svg>
</div><figcaption class="fig-cap"><b>Figure.</b> One sentence explaining what to look at.</figcaption></figure>
```

**Use a `viewBox` (typical width 700–740) and NO hard-coded colors — use these classes only**, so the diagram auto-themes:

| Class | Use on | Looks like |
|---|---|---|
| `dg-box` | `<rect>` neutral box | dark fill, grey stroke |
| `dg-box-edge` | `<rect>` highlight an "edge" of the stack | ember fill+stroke (THE emphasis color) |
| `dg-box-accent` | `<rect>` secondary highlight | cyan fill+stroke |
| `dg-arrow` | `<path>`/`<line>` arrows (add `marker-end="url(#arw)"`) | grey arrow |
| `dg-line` `dg-dash` | connectors / dashed | grey / dashed |
| `dg-edge` `dg-accent` | colored strokes (ember / cyan) | for graph curves |
| `dg-title` | `<text>` headline in figure | bold |
| `dg-label` | `<text>` normal label | body color |
| `dg-mut` | `<text>` small caption-ish | muted |
| `dg-ember` `dg-cyan` | `<text>` colored | ember / cyan text |
| `glow` | add to an element for an ember glow | drop-shadow |

**Every SVG that uses arrows must include this marker once (inside the svg):**
```html
<defs><marker id="arw" viewBox="0 0 10 10" refX="9" refY="5" markerWidth="7" markerHeight="7" orient="auto-start-reverse">
  <path d="M0 0L10 5L0 10z" fill="currentColor" class="dg-mut"/></marker></defs>
```
(If multiple SVGs are on the page, give each marker a unique id like `arw-mXX` and reference that.)

**REFERENCE SVG — copy this style (boxes, arrows, labels):**
```html
<svg class="diagram" viewBox="0 0 700 170" role="img" aria-label="example">
  <defs><marker id="arwEx" viewBox="0 0 10 10" refX="9" refY="5" markerWidth="7" markerHeight="7" orient="auto"><path d="M0 0L10 5L0 10z" class="dg-mut" fill="currentColor"/></marker></defs>
  <text x="350" y="22" text-anchor="middle" class="dg-title">How data flows</text>
  <rect x="40" y="60" width="150" height="60" rx="10" class="dg-box"/>
  <text x="115" y="95" text-anchor="middle" class="dg-label">Input</text>
  <rect x="275" y="60" width="150" height="60" rx="10" class="dg-box-edge glow"/>
  <text x="350" y="88" text-anchor="middle" class="dg-ember">Kernel</text>
  <text x="350" y="106" text-anchor="middle" class="dg-mut">(the edge)</text>
  <rect x="510" y="60" width="150" height="60" rx="10" class="dg-box"/>
  <text x="585" y="95" text-anchor="middle" class="dg-label">Output</text>
  <line x1="192" y1="90" x2="271" y2="90" class="dg-arrow" marker-end="url(#arwEx)"/>
  <line x1="427" y1="90" x2="506" y2="90" class="dg-arrow" marker-end="url(#arwEx)"/>
</svg>
```
Aim for **1–3 diagrams per module**. They should teach, not decorate. Label everything. Text inside SVG inherits the mono font automatically.

---

## 5. CODE WALKTHROUGHS

```html
<div class="code-walk">
  <div class="cw-bar"><span class="cw-dots"><i></i><i></i><i></i></span><span class="cw-name">addition_transformer.py</span><button class="cw-copy">copy</button></div>
  <pre><code><span class="tok-com"># a comment</span>
<span class="tok-kw">import</span> jax.numpy <span class="tok-kw">as</span> jnp

<span class="tok-kw">def</span> <span class="tok-fn">forward</span>(x):
    <span class="tok-kw">return</span> jnp.<span class="tok-fn">sum</span>(x)</code></pre>
  <div class="cw-note">Plain-English explanation of what just happened and why it matters.</div>
</div>
```
- Token color spans (optional but nice): `tok-kw` keywords, `tok-fn` functions, `tok-str` strings, `tok-num` numbers, `tok-com` comments, `tok-op` operators. If hand-coloring is too fiddly for a long block, plain `<pre><code>…</code></pre>` is fine — readability first.
- **Escape `<` `>` `&` inside code** as `&lt; &gt; &amp;`.
- Add one or more `<div class="cw-note">` after the `<pre>` to narrate. Multiple code-walks per module are fine.
- **Code must be correct and runnable** as described. If you show the Vlad addition-transformer or a Pallas kernel, it must actually work (or be clearly marked as a sketch with `// sketch` if truly illustrative).

---

## 6. QUIZZES (declarative — engine wires them up)

Put **2–4 quizzes** through the module (after teaching a concept, check it). Exactly this structure:
```html
<div class="quiz">
  <p class="q-tag">Check your understanding</p>
  <p class="q-text">A clear question?</p>
  <ul class="q-opts">
    <li><button class="q-opt" data-correct="false">A wrong but plausible option.</button></li>
    <li><button class="q-opt" data-correct="true">The correct option.</button></li>
    <li><button class="q-opt" data-correct="false">Another distractor.</button></li>
  </ul>
  <div class="q-explain"><b>Why:</b> Explain the right answer AND why the tempting wrong one is wrong.</div>
</div>
```
- 3–4 options, exactly one `data-correct="true"`. Engine adds A/B/C labels, grades on click, reveals `.q-explain`. Don't add letters yourself.
- Make distractors plausible (test real misconceptions), and make explanations teach.

---

## 7. GLOSSARY TERMS (schema, end of fragment)

On the **first meaningful mention** of a key term in your prose, wrap it: `<span data-term="hbm">HBM</span>`. The engine adds a hover tooltip + links it to the glossary panel. Use a lowercase-kebab key. Wrap each term **once** (first mention), not every time.

Then, at the very end of your `<section>`, emit **one** JSON block with every term you tagged:
```html
<script type="application/json" class="glossary-add">
{
  "hbm": {"term":"HBM (High-Bandwidth Memory)","short":"The big, relatively slow memory on a GPU/TPU where weights and activations live.","long":"High-Bandwidth Memory is the large pool of memory physically stacked near the accelerator. It holds model weights and intermediate data. It is far bigger but far slower to reach than on-chip SRAM, so moving data in and out of HBM is often the real bottleneck.","tag":"hardware"},
  "flop": {"term":"FLOP","short":"One floating-point operation (e.g. one multiply or add).","long":"A FLOP is a single floating-point arithmetic operation. FLOPs/second measures raw compute speed; total FLOPs measures how much arithmetic a computation needs.","tag":"hardware"}
}
```
**Schema:** key → `{term, short(≤140 chars), long(1–3 sentences), tag(optional)}`. Valid JSON only (double quotes, no trailing commas). The lead aggregates all blocks and de-dupes by key — so use the **same key** for the same concept (e.g. always `hbm`), and only define terms **your module is the natural home for** (don't redefine `attention` if you're the quantization module — just tag it; the foundations module owns it). When in doubt, define it.

---

## 8. TONE & STYLE CHECKLIST (self-review before you finish)

- [ ] Could a smart 16-year-old with no ML background follow every paragraph?
- [ ] Is every acronym/jargon word defined on first use?
- [ ] At least one analogy for each hard concept?
- [ ] 1–3 teaching diagrams, 2–4 quizzes, a checkpoint box?
- [ ] Did I connect the topic back to "this is how you get hired at a lab"?
- [ ] Did I tag glossary terms and emit valid JSON?
- [ ] No banned tags, no inline styles, no extra scripts?
- [ ] Word count 1,800–3,000 prose?

---

## 9. FETCH-FAILURE RULE (critical — prevents fabrication)

You will be given source URLs to fetch (arXiv pages, blogs, repos, docs). **Fetch them first.** But:

- Several URLs may fail, return junk, or not exist. In particular: **x.com/Twitter links almost never scrape**, and some arXiv IDs in the essay are **future-dated and may not resolve or may differ from what the essay claims**.
- **If a fetch fails or returns nothing useful:** fall back to (a) the source essay's own framing of that work, and (b) your general knowledge of that *family* of technique. Then add an inline note: `<div class="callout note"><p class="co-h">Source note</p><p>The primary source for this wasn't reachable when this module was written, so the description below explains the general technique; verify specifics against the paper.</p></div>`
- **Never fabricate**: specific author names, institutions, exact benchmark numbers, dataset names, or quoted results you didn't verify. Speak about *what the technique does and why* (which is stable and teachable) rather than invented specifics.
- It's completely fine to say "the exact numbers vary; the important idea is …". Teaching the *intuition and the systems-thinking* is the goal, not reciting tables.

---

## 10. OUTPUT

Write your finished fragment with the `Write` tool to the **exact absolute path given in your task** (e.g. `E:\upskills\frontier-lab-course\build\mXX.html`). Output the file only. Then reply with a 2-line summary: word count + any sources that failed to fetch.
