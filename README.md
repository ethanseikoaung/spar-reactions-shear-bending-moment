## Cal AeroSAE Biplane Spar Reactions, Shear, and Bending Moment Calculation in MATLAB

<img width="2250" height="1591" alt="Spar_FBD" src="https://github.com/user-attachments/assets/6f23bb52-15ca-4c3c-8e1b-8f31f38d9dd5" />

## Modeled Loads

* Lift is modeled as an elliptical distributed force along the spar.

$$L(x) = L_{max}\sqrt{1 - \left(\frac{x}{l}\right)^2}$$

* Weight is assumed to be a linear distribution.

$$W(x) = w_0$$

## Reactions

* From hand calculations, we get the expressions for reaction forces and moments at root.

$$R_y = w_0l - L_{max}l\frac{\pi}{4}$$

$$M_R = w_0\frac{l^2}{2} - L_{max}\frac{l^2}{3}$$

## Shear and Bending Moment

*Expressions used to model shear and bending moment.

$$V(x) = -\frac{L_{max}}{2}l\arccos\left(\frac{x}{l}\right) + \frac{x}{l}\sqrt{\left(1 - \left(\frac{x}{l}\right)^2\right)} + \frac{\pi}{2} + R_y - w_0x$$

$$M(x) = \int_{0}^{l} V(x)dx$$
