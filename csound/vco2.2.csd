<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
; Audio out   Audio in    No messages
-odac           -iadc     -d     ;;;RT audio I/O
; For Non-realtime ouput leave only the line below:
; -o vco2.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr      =  44100
ksmps   =  10
nchnls  =  1

; user defined waveform -1: trapezoid wave with default parameters (can be
; accessed at ftables starting from 10000)
itmp    ftgen 1, 0, 16384, 7, 0, 2048, 1, 4096, 1, 4096, -1, 4096, -1, 2048, 0
ift     vco2init -1, 10000, 0, 0, 0, 1
; user defined waveform -2: fixed table size (4096), number of partials
; multiplier is 1.02 (~238 tables)
itmp    ftgen 2, 0, 16384, 7, 1, 4095, 1, 1, -1, 4095, -1, 1, 0, 8192, 0
ift     vco2init -2, ift, 1.02, 4096, 4096, 2


        instr 5
;kcps    expon p4, p3, p5                ; instr 1: basic vco2 example
;a1      vco2 4000, 800                ; (sawtooth wave with default
a1      vco2 4000, p4                ; (sawtooth wave with default
        out a1                          ; parameters)
        endin


</CsInstruments>
<CsScore>


;i 5 0 1 100 200
;i 5 1 1 200 200
i 5 0 1 400 200
i 5 1 1 600 200
i 5 2 1 500 200
i 5 3 1 440 200

;f 0 14

e


</CsScore>
</CsoundSynthesizer>
