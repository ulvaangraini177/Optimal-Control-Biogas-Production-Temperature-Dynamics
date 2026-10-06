# Optimal Control of Biogas Production with Temperature Dynamics

This repository contains the MATLAB code supporting the numerical
simulations of a mathematical model of biogas production incorporating
digester temperature dynamics and control mechanisms.

## Model

The model consists of four state variables, namely \(P(t)\), \(E(t)\),
\(T(t)\), and \(S(t)\), where \(S(t)\) represents the digester
temperature. The model incorporates three control variables,
\(u_1(t)\), \(u_2(t)\), and \(u_3(t)\), to represent the control
mechanisms considered in the study.

## MATLAB Files

### `Biogas_Control_Comparison.m`

Compares the dynamics of the biogas production model under
uncontrolled and controlled conditions.

### `Biogas_Control_Scenarios.m`

Simulates five control scenarios:

1. Without control
2. Control \(u_1\) only
3. Control \(u_2\) only
4. Control \(u_3\) only
5. Combined controls \(u_1\), \(u_2\), and \(u_3\)

### `Biogas_Dynamic_Control_Variables.m`

Generates the time-dependent profiles of the control variables
\(u_1(t)\), \(u_2(t)\), and \(u_3(t)\).

## Software

The simulations are implemented in MATLAB.

## Reproducibility

The scripts are provided to support the reproduction of the numerical
simulations and figures reported in the associated manuscript.
