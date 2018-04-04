
function [J] = Objective_Function(x)

%PID Values to tune for
Kp = x(1);
Kd = x(2);
Ki = x(3);

% pushes variables to workspace
assignin('base','x_base',x); %sets x_base equal to x in your workspace since Matlab cant use values in a function

model_name = 'model_1' % this is the name of your simulink model file you want to get the response from

a = sim('model_1','SimulationMode','normal');   %this runs the simulation
b = a.get('simout');  % make sure to have a simout block in your simulink model to be able to get the response

%interval and duration of time we want to compare squared error with
dt = 0.001;
t = 0:dt:1;

error = 1 - b

%returns squared error 
J = sum(t'.*abs(error)*dt);
