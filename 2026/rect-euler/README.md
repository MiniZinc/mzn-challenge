# MiniZinc Models for Rectangular Euler Diagrams

**Author:** Patrick Paetzold

## Overview

This repository contains MiniZinc models for automatically solving layout problems in the visualization domain, specifically for set visualization using rectangular Euler diagrams.

Euler diagrams represent relationships between sets using closed shapes. In our visualizations, the sets are represented by rectangles: overlaps indicate shared set membership, while separate regions indicate distinct set memberships. The main challenge is to construct diagrams that correctly encode the required set intersections while remaining readable, compact, and visually clear.

The models are an adaptation of the model presented in the paper:

**RectEuler: Visualizing Intersecting Sets using Rectangles**  
https://doi.org/10.1111/cgf.14814

A demo of the diagrams generated in the RectEuler paper is available online at:  
https://rectvis.de/

## Datasets

The datasets are taken from the **RectEuler** paper and the **MetroSets** paper/dataset:

- RectEuler https://doi.org/10.1111/cgf.14814
- MetroSets: Visualizing Sets as Metro Maps https://doi.org/10.1109/TVCG.2020.3030475
- MetroSets dataset: https://doi.org/10.17605/OSF.IO/NVD8E

The problem instances are roughly grouped into four categories:

- `easy`
- `medium`
- `hard`
- `unsatisfiable`

The last category contains instances for which no rectangular Euler diagram solution is available. This is expected: not every set system can be represented as a rectangular Euler diagram, because the required set intersections may not be realizable using only axis-aligned rectangles.

For each dataset, two versions are available in the `InputModelData` folder:

1. **Uncombined version**  
   All elements are positioned directly by the MiniZinc model.

2. **Combined version**  
   Elements belonging to the same region of the diagram are grouped in a preprocessing step using a heuristic bin-packing approach. This reduces the number of objects that must be positioned by the model and therefore lowers the model complexity.

## File Structure

```text
.
├── Examples/
├── InputModelData/
├── Models/
└── Website/
```

### `InputModelData/`

Contains the input instances for the MiniZinc models. Each dataset is available in an uncombined and a combined version.

### `Models/`

Contains the MiniZinc model files.

The **RectEuler model** is very similar to the model used in the RectEuler paper.

The adapted model avoids manually encoding all pairwise rectangle exclusions. Instead, these exclusions are expressed using `diffn` constraints, which makes the formulation more compact and easier to maintain.

### `Examples/`

Contains example outputs, including:

- images of combined and uncombined solutions,
- model outputs saved as JSON files,
- metadata JSON files containing information such as set names and element names, which are required for visualization.

### `Website/`

Contains a small demo website for visualizing the generated JSON output files. Loading the provided JSON files or own solutions shows the set system.

A temporary demo version is available here:  
https://patrick-paetzold.de/recteulerviewer/
