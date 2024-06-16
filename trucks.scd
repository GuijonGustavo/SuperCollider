s.boot


(

SynthDef(\sinSynth, {
    |freq=440, amp=0.1, dur=1|
    var sig;
    sig=SinOsc.ar(freq)*amp;
    sig=sig * EnvGen.kr(Env.perc(0.01, dur - 0.01), doneAction:2);
    Out.ar(0, sig);
}).add;

)


(

p=Pbind(
    \instrument, \sinSynth, 
    \dur, Pseq([0.25, 0.5, 0.75, 1], inf),
    \freq, Pseq([440, 660, 550, 880], inf),
    \amp, 0.2
);
)

p.play;
p.stop;



SynthDef(\vibrato, {
    |freq=440, out=0, amp=10|
    var sig, env;
    sig=SinOsc.ar(freq, 0, amp);
    env=EnvGen.kr(Env.triangle(2,1), doneAction:2);
    Out.ar(out, sig*env);
}).add


Synth(\vibrato)


(

SynthDef(\vibrato2, {
    |freq=440, amp=0.5, rate=5, depth=5|
    var sig, vibrato;
    vibrato=SinOsc.kr(rate, 0, depth, freq);
    sig=SinOsc.ar(vibrato) * amp;
    sig=sig * EnvGen.kr(Env.perc(0.01, 1), doneAction:2);
    Out.ar(0, sig);
}).add;

)

Synth(\vibrato2, [\freq, 440, \amp, 0.3, \rate, 6, \depth, 10]) 


(

SynthDef(\onda, {
    |freq=440, amp=1, out=0|
    var sig;
    sig=TrigControl.ar(SinOsc(freq, 0, 1), 0, 1);
    Out.ar(out, sig);
}).add;

)

Synth(\onda)


(

SynthDef(\wave_form, {
    |wf=0, freq=440, amp=0.1|

    var sig;

    switch(wf,
            0, {sig=SinOsc.ar(freq, 0, amp);},
            1, {sig=Pulse.ar(freq, 0.5, amp);},
            2, {sig=Saw.ar(freq, amp);},
            3, {sig=LFTri.ar(freq, amp);}
        );
        Out.ar(0, sig);
}).add;

)


(

SynthDef(\wave_form_experiment, {
    |wf=0, freq=440, amp=0.1|

    var sig;

    sig = Select.ar(wf, [
            SinOsc.ar(freq, 0, amp);
            Pulse.ar(freq, 0.5, amp);
            Saw.ar(freq, amp);
            LFTri.ar(freq, amp);
        ]);
        Out.ar(0, sig);
}).add;

)


(

var wfs_lista=["Sine", "Square", "Saw", "Triangle"];

Routine({
    loop { 
        wfs_lista.do{
            |name, index|
            ("Playing "++ name ++ " wave with index: " ++ index).postln;
            Synth(\wave_form_experiment, [\wf, index]);
            2.wait;
        }
    }
}).play;
)

(
    SynthDef(\tren, {
            |freq=100, amp=1, out=0, width=0.5|
            var sig;
            sig=Pulse.ar(freq, width, amp); 
            Out.ar(out, sig);
    }).add;
)

Synth(\tren, [\freq, 200, \amp, 0.2, \width, 0.3])


(
    SynthDef(\tren, {
            |freq=100, amp=1, out=0, lf=0.5|
            var sig, width;
            width=SinOsc.kr(lf, 0, 0.5, 0.5);
            sig=Pulse.ar(freq, width, amp); 
            Out.ar(out, sig);
    }).add;
)


Synth(\tren)

//Synth(\tren, [\freq, 200, \amp, 0.2, \width, 0.3])


(
    SynthDef(\tremolo, {
            |out=0, freq=440, amp=0.5, tremFreq=5, depth=0.5|
            var sig, tremolEfect;
            sig=SinOsc.ar(freq, 0, amp); 
            tremolEfect=Pulse.kr(tremFreq, 0.5) * depth * amp; 
            sig=sig * (1 + tremolEfect) ;
            Out.ar(out, sig);
    }).add;
)


Synth(\tremolo)

{Pulse.ar(0.01, 0.9)}.scope;



(

SynthDef(\wave_form_experiment, {
    |wf=0, amp=0.1|

    var sig;

    sig = Select.ar(wf, [
            Pulse.ar(100, 0.1, amp);
            Pulse.ar(200, 0.2, amp);
            Pulse.ar(300, 0.3, amp);
            Pulse.ar(400, 0.4, amp);
            Pulse.ar(500, 0.5, amp);
        ]);
        Out.ar(0, sig);
}).add;

)


(

var wfs_lista=["freq:100; width:0.1", "freq:200; width:0.2", "freq:300; width:0.3", "freq:400; width:0.4", "freq:500; width:0.5"];

Routine({
    loop { 
        wfs_lista.do{
            |name, index|
            ("Playing "++ name ++ " in index: " ++ index).postln;
            Synth(\wave_form_experiment, [\wf, index]);
            2.wait;
        }
    }
}).play;
)

(

    {SinOsc.ar(400, 0, 0.5, 0.5)}.play;
)


(
    SynthDef(\simple, {
        |freq=400, amp=1, phase=0|
        var sig;
        sig=SinOsc.ar(freq, phase, amp);
        Out.ar(0, sig);
    }).add;
)

(
Routine({

Synth(\simple);
2.wait;

}).play;

)


(

Pbind(\instrument, \simple, \dur, 2, \degree, Pseq([0, 2, 4], inf).play;

)


)



/*=================================*/

(
SynthDef(\percSynth, {
    |freq=440, dur=0.1, amp=1|
    var sig, env;
    sig=Impulse.ar(freq) * amp;
    sig=LPF.ar(sig, 1000);
    env=EnvGen.kr(Env.perc(0.01, dur), doneAction:2);
    sig = sig * env;
    Out.ar(0, sig);
}).add
)

(
Pbind(
    \instrument, \percSynth,
    \freq, Pseq([440, 880, 660, 220], inf),
    \dur, Pseq([0.1, 0.2, 0.3, 0.4], inf),
    \amp, 1,
    \legato, 1
).play;
)








(

Pbind(
    \instrument, \percSynth,
    \dur, 0.5,
    \freq, 1.0.rrand(0.5, 2.0),
    \amp, 0.5
).play;


)



















//Synth(\percSynth).play;

(
Routine({
    loop { 
            2.wait;
            Synth(\percSynth).play;
            2.wait;
        }
    }).play;
)

a = 5;

b = a * 2

c = 10.5;

d = 4.2;

e = c + d;



residuo = 15 % 4;


"residuo =".post; residuo.postln;

{
var t;

t="Hola Supercollider";

t.postln;

}

"Hola Supercollider".postln;

a=Array[60, 62, 64, 65, 67];
a[3].postln;



x=false;
y=true;

r = x or: y;


f = 3*3*3;
f







g = 10 > 5

h = "Super"+"Colider"
h

d=Dictionary[\clave1->1,\clave2->2,\clave3->3];

d[\clave2].postln;



"Hello world"
"Hello world".speak;
