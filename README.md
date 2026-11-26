# SAE Biplane Semi-Span Load Analysis

Load analysis of one semi-span of Cal Aerospace's SAE biplane. Root reactions and spanwise shear-force expressions are derived by hand, and the results are visualized in MATLAB.

## Project Goals

- Derive expressions for the root reactions and spanwise shear-force distributions.
- Plot the resulting shear-force and bending-moment diagrams in MATLAB.

## Features

### Load Model

Lift is modeled as an elliptical distribution along the semi-spar:

$$L(x) = L_{max}\sqrt{1-\left(\frac{x}{l}\right)^2}$$

Weight is assumed to be uniformly distributed:

$$W(x) = w_0$$

### Root Reactions

The hand-derived expression for the root reaction force:

$$R_y = w_0 l - L_{max}\, l\, \frac{\pi}{4}$$

The hand-derived expression for the root moment:

$$M_R = w_0 \frac{l^2}{2} - L_{max} \frac{l^2}{3}$$

### Shear and Bending Moment

The shear force as a function of spanwise position:

$$V(x) = -\frac{L_{max}}{2}\, l \arccos\left(\frac{x}{l}\right) + \frac{x}{l}\sqrt{1-\left(\frac{x}{l}\right)^2} + \frac{\pi}{2} + R_y - w_0 x$$

The bending moment as a function of spanwise position:

$$M(x) = \int_{0}^{l} V(x)\, dx$$

### MATLAB Plots

Shear-force and bending-moment distributions are plotted along the semi-span in MATLAB.

## Challenges

- Inconsistent sign conventions caused errors during the initial calculations.

## Areas for Further Improvement

- Replace the uniform-weight assumption with a tapered spanwise weight distribution.
- Write a program to calculate the minimum cross-sectional area required at each spanwise position and optimize the spar geometry along the span.
- Account for torsion in the box-wing cross-section.
