clear;clc;
intruder_arduino=arduino()
trig_pin='D8';
echo_pin='D9';
sensor=ultrasonic(intruder_arduino,TRIG_PIN,ECHO_PIN);
distance=readDistance(sensor)