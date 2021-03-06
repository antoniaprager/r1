#!/usr/bin/python3
import Adafruit_DHT

import time
import os

import RPi.GPIO as GPIO


DHT_SENSOR = Adafruit_DHT.DHT11

DHT_PIN = 4

Gruen = 25

Gelb = 24

Rot = 23

GPIO.setwarnings(False)

GPIO.setmode(GPIO.BCM)

GPIO.setup(Rot, GPIO.OUT)

GPIO.setup(Gelb, GPIO.OUT)

GPIO.setup(Gruen, GPIO.OUT)

messen = True;



while messen:
       humidity, temperature = Adafruit_DHT.read(DHT_SENSOR, DHT_PIN)
       if humidity is not None and temperature is not None:
             print("Temp={0:0.1f}C Humidity={1:0.1f}%.".format(temperature,humidity))


             cmd = 'curl -X POST -d "{"temperature": ' + str(temperature) + '}"  https://demo.thingsboard.io/api/v1/PIobHRn5i2gqdKGMRUvr/telemetry  --header "Content-Type:application/json" '
             os.system(cmd)

             cmd = 'curl -X POST -d "{"humidity": ' + str(humidity) + '}"  https://demo.thingsboard.io/api/v1/PIobHRn5i2gqdKGMRUvr/telemetry  --header "Content-Type:application/json" '
             os.system(cmd)
		
             if humidity < 40:
                    GPIO.output(Rot, GPIO.HIGH);
                    GPIO.output(Gelb, GPIO.LOW);
                    GPIO.output(Gruen, GPIO.LOW);
             elif humidity > 40 and humidity < 50:
                    GPIO.output(Gelb, GPIO.HIGH);
                    GPIO.output(Rot, GPIO.LOW);
                    GPIO.output(Gruen, GPIO.LOW);
             else:
                    GPIO.output(Gruen, GPIO.HIGH);
                    GPIO.output(Rot, GPIO.LOW);
                    GPIO.output(Gelb, GPIO.LOW);
       else:
             print("Sensor failure. Check wiring.")
       time.sleep(10);
GPIO.cleanup();
