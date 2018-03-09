
function [J] = pid_bike(x)

%setting s as our continuous variable
s = tf('s');

%plant function

plant = (217.5*s + 2175) / (90.28*s^2 - 853.5); %example

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
