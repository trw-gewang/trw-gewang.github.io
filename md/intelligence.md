# Intelligence

## Proposition

**intelligence is the competency of solving never-seen-before problems** 

## I. Prolegomena: Clarification of Terms

Before evaluating the proposition, its constituent terms require rigorous disambiguation.

### 1.1 Intelligence

The word *intelligence* derives from the Latin *intelligentia*, meaning discernment or understanding. Across disciplines it has been operationalized in markedly different ways:

- **Psychometric tradition**: a general factor $g$ underlying performance across cognitive tasks.
- **Developmental tradition**: intelligence as adaptive equilibration between assimilation and accommodation.
- **Computational tradition**: intelligence as the capacity to exhibit behavior indistinguishable from that of a human reasoner.
- **Ecological tradition**: intelligence as organism-environment coupling and affordance exploitation.

No consensus definition exists. Any proposition of the form *"intelligence is X"* should therefore be understood as a **theoretical commitment**, not a description of settled fact.

### 1.2 Competency

*Competency* implies a reliable, exercisable capacity — not merely a one-off occurrence. It connotes **skill** rather than luck. This is important: the proposition requires that the agent *reliably* solve novel problems, not merely solve one by chance.

### 1.3 Never-Seen-Before Problems

This phrase is both the most distinctive and most problematic element of the proposition. It encompasses:

- Problems whose **surface form** is novel (new inputs to known problem-types).
- Problems whose **structure** is genuinely unprecedented (requiring new conceptual frameworks).
- Problems **outside the agent's training distribution** (in the ML sense).

These three interpretations differ substantially, and the proposition's force depends heavily on which is intended.

---

## II. The Steel-Manned Proposition

### 2.1 Novelty as the Mark of Intelligence

The strongest argument for the proposition is its alignment with the intuition that **rote execution is not intelligence**. A calculator that computes $2 + 2 = 4$ does not seem intelligent, even if accurate. The proposition captures the insight that intelligence involves **generalization beyond the familiar** — what psychologists call *fluid intelligence* $G_f$, formally distinguished from crystallized intelligence $G_c$:

$$G_f \neq G_c, \quad \text{where } G_f = f(\text{novel reasoning}), \quad G_c = f(\text{acquired knowledge})$$

Cattell's investment theory (1971) holds that $G_f$ is the primitive capacity that underwrites all further cognitive development, making novelty-response a plausible *root* of intelligence.

### 2.2 Transfer Learning as a Criterion

The proposition also aligns with the concept of **transfer**: the ability to apply knowledge learned in one domain to solve problems in another. Formally, if an agent $A$ trained on distribution $\mathcal{D}_{\text{train}}$ achieves high performance on $\mathcal{D}_{\text{test}}$ where:

$$\mathcal{D}_{\text{test}} \cap \mathcal{D}_{\text{train}} = \emptyset$$

then $A$ demonstrates precisely what the proposition demands. This is a meaningful and testable criterion.

### 2.3 Agreement with the Turing Tradition

The proposition is broadly consistent with Turing's imitation game, which tests whether a machine can respond intelligently to *arbitrary* novel queries from a human interlocutor. Novel problem-solving is implicitly what the Turing Test probes.

---

## III. Critique: Five Principal Objections

### Objection I — The Novelty Regress Problem

The proposition requires problems to be *never-seen-before*, but all problems encountered by any agent are, at some level of description, novel. Conversely, every seemingly novel problem can be re-described as a known type. This generates a **novelty regress**:

$$\forall p \in \mathcal{P}: \exists d \in \mathcal{D}\ [p \text{ is familiar under description } d] \land \exists d' \in \mathcal{D}\ [p \text{ is novel under description } d']$$

The criterion of novelty is thus **frame-relative** and cannot serve as an objective, description-independent marker of intelligence.

---

### Objection II — The Competence-Without-Intelligence Problem

Some systems solve never-seen-before problems via processes that appear non-intelligent. Consider **random search**: a sufficiently exhaustive stochastic algorithm will eventually solve any problem for which a solution verifier exists. More formally, for a problem space $\mathcal{P}$ with solution space $\mathcal{S}$, a random agent $R$ satisfies:

$$P(R \text{ solves } p) > 0 \quad \forall p \in \mathcal{P}$$

By the proposition, $R$ possesses intelligence. This is a *reductio ad absurdum*. The proposition fails to distinguish **intelligent problem-solving** from **accidental or brute-force problem-solving**.

---

### Objection III — The Expertise Exclusion Problem

Many of the most impressive demonstrations of human intelligence involve *deep expertise* — solving problems that have been seen before in highly elaborated form. A chess grandmaster, a seasoned surgeon, or a master poet operates largely within familiar territory, deploying finely tuned schemas. As Simon and Chase showed, chess mastery consists largely of recognizing approximately:

$$N_{\text{chess patterns}} \approx 50{,}000\text{–}100{,}000 \text{ stored configurations}$$

If intelligence requires novelty, then expertise is *inversely correlated* with intelligence — a conclusion that contradicts both intuition and empirical evidence.

---

### Objection IV — The Social and Distributed Intelligence Problem

The proposition is implicitly **individualist**: it imagines a single agent confronting a problem. But much intelligence is **socially distributed**. A team of scientists collectively solving a never-before-encountered disease does so through division of cognitive labor, institutional memory, peer review, and tool use. No individual member may solve a novel sub-problem alone. Does the group possess intelligence? The proposition provides no answer.

Furthermore, intelligence is increasingly understood as **extended** (Clark & Chalmers, 1998): an agent plus notebook, calculator, or internet may collectively solve novel problems that the biological agent cannot. If the competency resides in the system, not the organism, the proposition must be reformulated at the level of cognitive systems, not individual minds.

---

### Objection V — The Evaluator's Dilemma

The proposition presupposes that we can determine whether a problem is *never-seen-before* for a given agent. But:

1. We have no reliable **epistemic access** to an agent's prior problem-history.
2. For biological agents, the relevant "training distribution" includes evolution, development, and culture — all opaque.
3. For artificial agents, whether a test problem is out-of-distribution depends on the architecture, training data, and encoding — empirically difficult to verify.

This renders the proposition **operationally intractable**. A criterion for intelligence that cannot be applied in practice is scientifically deficient.

---

## IV. Structural Diagnosis

The proposition can be represented as a biconditional definition:

$$\text{Intelligent}(A) \iff \text{CanSolveNovelProblems}(A)$$

The objections above establish:

- **Sufficiency fails** (Objections I, II): solving novel problems does not *entail* intelligence.
- **Necessity fails** (Objection III): intelligence does not *require* solving novel problems.
- **Scope is too narrow** (Objection IV): intelligence extends beyond individual agents.
- **The criterion is unverifiable** (Objection V): the definition cannot be applied reliably.

The biconditional is therefore **false in both directions**.

---

## V. Alternative and Counter-Propositions

### Counter-Proposition 1 — The Adaptive Efficiency Thesis

$$\boxed{\text{Intelligence is the capacity to achieve goals with minimal resources across variable environments.}}$$

This formulation retains the adaptive core of the original proposition but replaces *novelty* with *efficiency under variation*. It accommodates expert problem-solving (efficient deployment of schemas), novel problem-solving (adaptive generalization), and social cognition (coordinated efficient goal pursuit). Formally:

$$I(A) \propto \frac{\mathbb{E}_{\mathcal{E}}[\text{GoalAchievement}(A, e)]}{\mathbb{E}_{\mathcal{E}}[\text{ResourceCost}(A, e)]}$$

where $\mathcal{E}$ is a distribution of environments.

---

### Counter-Proposition 2 — The Legg-Hutter Universal Intelligence Thesis

Drawing on Kolmogorov complexity and reinforcement learning, Legg and Hutter (2007) define intelligence as:

$$\Upsilon(\pi) = \sum_{\mu \in \mathcal{E}} 2^{-K(\mu)} V_\mu^\pi$$

where $\pi$ is an agent policy, $\mathcal{E}$ is the space of all computable reward environments, $K(\mu)$ is the Kolmogorov complexity of environment $\mu$, and $V_\mu^\pi$ is the expected cumulative reward of $\pi$ in $\mu$. This **formalizes** the adaptive thesis: intelligence is performance across all environments, weighted by their simplicity. Novel environments are just a subset.

---

### Counter-Proposition 3 — The Metacognitive Thesis

$$\boxed{\text{Intelligence is the capacity to monitor, evaluate, and regulate one's own cognitive processes.}}$$

This shifts emphasis from *output* (problem solutions) to *process* (cognitive self-governance). Flavell's concept of *metacognition* — thinking about one's own thinking — identifies a dimension of intelligence absent from the original proposition. An agent that knows what it does not know, and adjusts its strategies accordingly, is intelligent in a profound sense even if it regularly encounters familiar problems.

Formally, let $\mathcal{K}(A)$ denote the agent's knowledge state and $\hat{\mathcal{K}}(A)$ its model of its own knowledge:

$$\text{Metacognitive Intelligence} \propto \text{Accuracy}(\hat{\mathcal{K}}(A), \mathcal{K}(A))$$

---

### Counter-Proposition 4 — The Relational-Constructivist Thesis

$$\boxed{\text{Intelligence is the ongoing construction of meaning through interaction with problems, tools, and other agents.}}$$

Rooted in Vygotsky's zone of proximal development and Dewey's pragmatism, this proposition understands intelligence not as a fixed competency but as a **dynamic relational process**. The intelligent agent is not one who *has* a capacity but one who *enacts* understanding through inquiry. This dissolves the novelty/familiarity binary: what matters is the **quality of engagement**, not the prior exposure history.

---

### Counter-Proposition 5 — The Integrative Multi-Factor Thesis

Acknowledging that intelligence is **irreducibly multidimensional**, we may define it as a weighted vector:

$$\vec{I}(A) = \begin{pmatrix} w_1 \cdot G_f(A) \\ w_2 \cdot G_c(A) \\ w_3 \cdot \text{Meta}(A) \\ w_4 \cdot \text{Social}(A) \\ w_5 \cdot \text{Creative}(A) \end{pmatrix}$$

where $G_f$ = fluid reasoning, $G_c$ = crystallized knowledge, $\text{Meta}$ = metacognitive accuracy, $\text{Social}$ = interpersonal and collective cognition, and $\text{Creative}$ = generative capacity. Weights $w_i$ are domain- and context-dependent. Novel problem-solving is captured primarily by $G_f$ and $\text{Creative}$, but is neither necessary nor sufficient for the full vector to be impressive.

---

## VI. Conclusion

The proposition that *intelligence is the competency of solving never-seen-before problems* is a **theoretically motivated but philosophically inadequate** definition. Its virtues lie in centering adaptability, transfer, and generalization — genuine marks of sophisticated cognition. Its vices lie in its frame-relativity, its failure to exclude brute-force processes, its marginalization of expertise, its individualism, and its empirical unverifiability.

The most defensible position treats intelligence as a **family resemblance concept** (in the Wittgensteinian sense): a cluster of overlapping cognitive capacities — fluid reasoning, metacognition, adaptive efficiency, social coordination, and creative construction — no single one of which is either necessary or sufficient. Novel problem-solving is a *particularly salient* expression of this cluster, but it is neither its essence nor its measure.

$$\text{Intelligence} \neq \text{Novelty-Solving} \quad \text{but} \quad \text{Intelligence} \supset \text{Novelty-Solving}$$

Intelligence *contains* the competency of solving never-seen-before problems as a proper subset. To identify the container with the subset is the central error of the proposition.

