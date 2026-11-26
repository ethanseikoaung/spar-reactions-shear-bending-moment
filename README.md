# SAE Biplane Semi-Span Load Analysis

Load analysis of one semi-span of Cal Aerospace's SAE biplane. Root reactions and spanwise shear-force expressions are derived by hand, and the results are visualized in MATLAB.


### Load Model

Lift is modeled as an elliptical distribution along the semi-spar:

$$L(x) = L_{max}\sqrt{1-\left(\frac{x}{l}\right)^2}$$

Weight is assumed to be uniformly distributed:

$$W(x) = w_0$$

<img width="2000" height="1000" alt="image" src="https://github.com/user-attachments/assets/fe339099-76d7-45af-9f59-5194632ad620" />

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

<img width="1128" height="745" alt="image" src="https://github.com/user-attachments/assets/1f3fe53a-6beb-48c2-a8f6-50df52dfc456" />
<img width="1121" height="745" alt="image" src="https://github.com/user-attachments/assets/99fd2f1b-7550-4370-ad01-bf5b4efbc56d" />

