%Sam Stahl 12/7/2020
%Mech 103 Final Project
%This code is used for a tripwire alarm system using an ultrasonic sensor
%Two lights, a speaker and a button
%Pressing the button will turn off the speaker and stop the lights from 
%flashing and stop the code from running
clear;clc;
intruder_arduino=arduino();
redlight='d10'
bluelight='d9'
speaker='d8'
button_pin='D7'
trigpin='d6'
echopin='d5'
%Make sure lights are off at beginning
writeDigitalPin(intruder_arduino,redlight,0);
writeDigitalPin(intruder_arduino,bluelight,0);
sensor=ultrasonic(intruder_arduino,trigpin,echopin);
button=readDigitalPin(intruder_arduino,button_pin);
distance_initial=readDistance(sensor)%Inital Distance between wall and sensor
while button==0
    distance=readDistance(sensor);%Read ths distance between sensor and wall
    if distance<(distance_initial-.1)%If someone walks between the sensor
        %...and the wall, the distance will be less
        %Has the button been pressed down?:
        button=readDigitalPin(intruder_arduino,button_pin);
        while button==0
            %Flash lights back and forth
            writeDigitalPin(intruder_arduino,redlight,1);
            writeDigitalPin(intruder_arduino,bluelight,0);
            pause(.125);
            writeDigitalPin(intruder_arduino,redlight,0);
            writeDigitalPin(intruder_arduino,bluelight,1);
            pause(.125)
            %Play the speaker tone
            playTone(intruder_arduino,speaker,540);
            %Has the button been pressed down?:
            button=readDigitalPin(intruder_arduino,button_pin);
        end
        %Has the button been pressed down?
        button=readDigitalPin(intruder_arduino,button_pin);
        if button==1%Button has been pressed
            %Turn off lights
            writeDigitalPin(intruder_arduino,redlight,0);
            writeDigitalPin(intruder_arduino,bluelight,0);
            %Turn off speaker
            playTone(intruder_arduino,speaker,540,.01);
            %The play time is set at .01 because then the tone will play
            %for .01 seconds then stop instead of playing forever
        end
    end
end