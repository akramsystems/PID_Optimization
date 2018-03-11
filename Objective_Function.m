
function [J] = Objective_Function(x)

%setting s as our continuous variable
s = tf('s');

%plant function

plant = 16.57 / (s^2 + 2.393*s - 45.34); %example

%PID Values to tune for
Kp = x(1);
Kd = x(2);
Ki = x(3);



%PID Controller form
cont = Kp + Kd*s + Ki/s;


%use to see progression of response with optimized PID Values
%step(feedback(plant*cont,1))

%interval and duration of time we want to compare squared error with
dt = 0.001;
t = 0:dt:2;

error = 1 - step(feedback(plant*cont,1),t);

%squared error 
J = sum(t'.*abs(error)*dt);
