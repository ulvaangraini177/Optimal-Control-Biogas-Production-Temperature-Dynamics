# Optimal Control of Biogas Production with Temperature Dynamics

This repository contains the MATLAB code supporting the numerical
simulations of a mathematical model of biogas production incorporating
digester temperature dynamics and optimal control mechanisms.

## Model

The model consists of four state variables, namely $P(t)$, $E(t)$,
$T(t)$, and $S(t)$, where $S(t)$ represents the digester temperature.
The model incorporates three control variables, $u_1(t)$, $u_2(t)$,
and $u_3(t)$.

The state equations are given by:

$\frac{dP}{dt}=a_1+l+v_1T-\left[p+e\frac{S}{S_a}(1+u_1)\right]P$

$$
\frac{dE}{dt}
=
e\frac{S}{S_a}(1+u_1)P-(c+h)E+oT
$$

$$
\frac{dT}{dt}
=
(c+h)E+p(1+u_2)P-aT-(v_2+o)T
$$

$$
\frac{dS}{dt}
=
q_Hu_3-k_L(S-S_a)
$$

The control variables satisfy:

$$
0 \leq u_i(t) \leq 1,
\qquad i=1,2,3.
$$

## MATLAB Files

### `Biogas_Control_Comparison.m`

Compares the dynamics of the biogas production model under
uncontrolled and controlled conditions. The script generates the
trajectories of the four state variables and compares the system
responses with and without control.

### `Biogas_Control_Scenarios.m`

Simulates five control scenarios:

1. Without control
2. Control $u_1$ only
3. Control $u_2$ only
4. Control $u_3$ only
5. Combined controls $u_1$, $u_2$, and $u_3$

The script is used to examine the effects of each control mechanism
individually and their combined application on the system dynamics.

### `Biogas_Dynamic_Control_Variables.m`

Generates the time-dependent profiles of the control variables
$u_1(t)$, $u_2(t)$, and $u_3(t)$ over the simulation period.

## Software

The numerical simulations are implemented in MATLAB.

## Reproducibility

The MATLAB scripts are provided to support the reproduction of the
numerical simulations and figures reported in the associated
manuscript.

The scripts can be downloaded and executed independently in MATLAB.
The simulation parameters and initial conditions are specified within
the respective scripts.

## Associated Manuscript

This repository supports the research study:

**Mathematical Modeling and Optimal Control of Biogas Production
Incorporating Digester Temperature Dynamics**
