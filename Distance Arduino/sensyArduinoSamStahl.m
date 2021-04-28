%Sam Stahl 10/29/2020
%Distance Sensor with corresponding lights
%Mech 103-001
clear;close all;clc;

% Define Pins
TRIG_PIN = 'D10';
ECHO_PIN = 'D8';
% Setup arduino object, make sure to set up the arduino for ultrasonic
% as described above!
sensyArduino = arduino();

% Setup ultrasonic sensor
ultraSensor = ultrasonic(sensyArduino,TRIG_PIN,ECHO_PIN);

% This while loop will run forever, so we will stick our distance reading,
% LED lighting, and noise making inside of here
while(1)
    % Read the distance from the ultrasonic sensor
    distance=readDistance(ultraSensor)
    
    % Use nested if statements to check distance and decide
    % Which if any lights need to go on
    writeDigitalPin(sensyArduino,'D3',0)
    writeDigitalPin(sensyArduino,'D4',0)
    writeDigitalPin(sensyArduino,'D5',0)
    writeDigitalPin(sensyArduino,'D6',0)
    writeDigitalPin(sensyArduino,'D7',0)
if distance>0 && distance<1
    if distance<.75
        writeDigitalPin(sensyArduino,'D7',1)%Red #1
        writeDigitalPin(sensyArduino,'D6',1)%Red #2
    end
    if distance>.75 && distance<1
        writeDigitalPin(sensyArduino,'D7',1)%Red #1
        writeDigitalPin(sensyArduino,'D6',0)%Red #2
    end
end
if distance>.75 && distance<1.25
    writeDigitalPin(sensyArduino,'D5',1)%Yellow
end
if distance>1
    if distance>1 && distance<2
        writeDigitalPin(sensyArduino,'D4',1)%Green #1
    end
    if distance>2
        writeDigitalPin(sensyArduino,'D4',1)%Green #1
        writeDigitalPin(sensyArduino,'D3',1)%Green #2
    end
end

    % Use a pause so we aren't taking a million distance readings per
    % second
    pause(0.5);
end