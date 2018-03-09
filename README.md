# PID_Optimization
Function to be used with Matlab.s ga_solver for tuning the parameters of a PID Controller.

This is an example of a function made to be optimizing for a the values in a PID Controller.

This is to be run with MATLAB and called using the ga_sovler Optimization tool.

Optimal values for Ki, Kp and Kd are found by setting the objective function to equal
to minimizing the squared error of the response with a step input.
