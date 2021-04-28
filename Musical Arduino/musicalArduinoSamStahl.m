clear;clc;
button_arduino = arduino();
SPEAK_PIN='D3';
button_pin1 = 'D8';
button_pin2='D9';
button_pin3 = 'D10';
yLight='D4';
rLight='D5';
bLight='D6';
sensor=ultra
while (1)
    button_state1 = readDigitalPin(button_arduino, button_pin1);
    button_state2 = readDigitalPin(button_arduino, button_pin2);
    button_state3 = readDigitalPin(button_arduino, button_pin3);
    writeDigitalPin(button_arduino,yLight,0);
    writeDigitalPin(button_arduino,rLight,0);
    writeDigitalPin(button_arduino,bLight,0);
    
    if(button_state1 == 1)
        for run_1=1:5
            writeDigitalPin(button_arduino,yLight,1)
            pause(.125)
            writeDigitalPin(button_arduino,yLight,0)
            pause(.125)
            playTone(button_arduino, SPEAK_PIN, 493);
        end
        while button_state1==1
            writeDigitalPin(button_arduino,yLight,1);
            button_state1 = readDigitalPin(button_arduino, button_pin1);
            playTone(button_arduino, SPEAK_PIN, 493,.1);
        end
    end
    
    
    
     if(button_state2 == 1)
        for run_1=1:5
            writeDigitalPin(button_arduino,rLight,1)
            pause(.125)
            writeDigitalPin(button_arduino,rLight,0)
            pause(.125)
            playTone(button_arduino, SPEAK_PIN, 440);
        end
        while button_state2==1
            writeDigitalPin(button_arduino,rLight,1);
            button_state2 = readDigitalPin(button_arduino, button_pin2);
            playTone(button_arduino, SPEAK_PIN, 440,.1);
        end
    end
    
    
    
     if(button_state3 == 1)
        for run_1=1:5
            writeDigitalPin(button_arduino,bLight,1)
            pause(.125)
            writeDigitalPin(button_arduino,bLight,0)
            pause(.125)
            playTone(button_arduino, SPEAK_PIN, 392);
        end
        while button_state3==1
            writeDigitalPin(button_arduino,bLight,1);
            button_state3 = readDigitalPin(button_arduino, button_pin3);
            playTone(button_arduino, SPEAK_PIN, 392,.1);
        end
    end
end
