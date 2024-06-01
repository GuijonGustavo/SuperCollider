s.boot;


{BPF.ar(WhiteNoise.ar,300,100)}.scope

{HPF.ar(WhiteNoise.ar(0.1),7030)!2}.scope



{LPF.ar(WhiteNoise.ar(0.1), 7030)}.scope



{BPF.ar(WhiteNoise.ar(0.1), 7030, 703/7030)}.scope

{SinOsc.ar(400,0,MouseX.kr(0,1))}.scope

{Pulse.ar(MouseY.kr(10000,20), MouseX.kr(0.001,0.5), MouseButton.kr(0,1))}.scope

{HPF.ar(WhiteNoise.ar(0.1), MouseY.kr(1000,100))!2}.scope
{LPF.ar(WhiteNoise.ar(0.1), MouseX.kr(1000,100))!2}.scope
{BPF.ar(WhiteNoise.ar(0.1), MouseY.kr(1000,100),0.05)!2}.scope
{BPF.ar(WhiteNoise.ar(0.5), 130, MouseX.kr(0.05,1.5))!2}.scope
{BRF.ar(WhiteNoise.ar(0.1), 7030, MouseX.kr(1000,100), 1)!2}.scope //Peligroso!!! Muy agresivo

{BRF.ar(WhiteNoise.ar(0.1), MouseY.kr(10000,100),1)!2}.scope

Env.perc(0.01,1,1).plot

SynthDef("prueba", {
  |gate|Out.ar(
    0, 
    Pulse.ar(15)*EnvGen.kr(
      Env.asr(
        0.01,
        1,
        5), 
        gate, 
        doneAction:2
      ))}).send(s)

a=Synth("prueba",["gate",1])  
a.set("gate",0)

{Saw.ar(40)*EnvGen.kr(Env.perc(0.1,0.1), doneAction:2)}.scope



{Saw.ar(40)*EnvGen.kr(Env.asr(1,1,4), Line.kr(1,0,2),doneAction:2)}.scope

{Pan2.ar(Pulse.ar(100,0.01),MouseY.kr(-1,1))}.scope


{Pan2.ar(Pulse.ar(100,0.01),0.9)}.scope

{Out.ar(0, Pan2.ar(Dust.ar(1000),0))}.scope

60=Do

[60,62,64].midicps

{Out.ar(0,SinOsc.ar)}.scope

{Pan2.ar(WhiteNoise.ar,0)}.scope

{Out.ar(1,Saw.ar(100)*EnvGen.kr(Env.perc(0.01,2), doneAction:2))}.scope

{HPF.ar(WhiteNoise.ar,[100,200,400,1000,1500,5000].choose,0.5)*EnvGen.kr(Env.perc(0.01,15),doneAction:1)}.scope

{Pan2.ar(SinOsc.ar([60,64,67,72].choose.midicps,[-1,1].choose))}.play

{[LPF,HPF].choose.ar(BrownNoise.ar,[700,400,600,200].choose)}.scope


(

  var leon, dos;

  leon = 1;
  dos = 2;

  leon + dos;

 [leon + dos, 'dos variables']

)

(

{

  var ruido, senoide;

  ruido=WhiteNoise.ar(0.2);

  senoide=SinOsc.ar(100,0,0.3);

  ruido * senoide;

}.scope

)





(
  {
var ruido=WhiteNoise.ar(0.5), senoide=SinOsc.ar(10,0,0.3);

var env=EnvGen.kr(Env.perc(0,0.2), Impulse.kr(4));

senoide * ruido * env;
  }.play
)




(
  {
    var oscilador, envolvente, impulso;

    impulso=Impulse.kr(MouseX.kr(1,10));
    oscilador=LFTri.ar(200*[1, MouseY.kr(0.98,1.0124)],0,0.53);
    envolvente=EnvGen.kr(Env.perc(0.01,1), impulso);

    oscilador*envolvente;

  }.scope
)

(
SynthDef("prueba", {
  |gate, frecuencia=15|
  Out.ar(
    0, 
    Pulse.ar(frecuencia)*EnvGen.kr(
      Env.asr(
        0.01,
        1,
        3), 
        gate, 
        doneAction:2
      ))}).send(s)
    )

    a=Synth("prueba",[\gate,1])  
    a.set(\gate,0)

[1,4,3,2].plot("test", Rect(200 , 140, 705, 410), false, 2) ;


(
SynthDef(\prueba,
  {
    arg gate;
    Out.ar(0,
    Pulse.ar(15)*EnvGen.kr(Env.asr(0.01,1,3), gate, doneAction:2))
  }
).send(s)
)

a=Synth(\prueba,[\gate,1])

a.set(\gate,0)


(
SynthDef(\mi_primer_synth,{|frecuencia=100, amplitud=0.6, frecuenciatrig=2|
  var sen, env, trig;
  trig=Impulse.kr(frecuenciatrig);
  sen=Saw.ar(frecuencia*[0.9888,1.0011], amplitud);
  env=EnvGen.kr(Env.perc(0.01,0.5), trig);
  Out.ar(0, sen*env)
}).send(s)
)

b=Synth(\mi_primer_synth)
b.set(\frecuenciatrig,1)
b=Synth(\mi_primer_synth, [\frecuencia,100,\amplitud,0.1])
b.set(\frecuencia,700,\amplitud,1)
b.set(\frecuenciatrig,5.rrand(10), \frecuencia, 101.rrand(1820))
b.free

(
SynthDef(\mi_segundo_synth, {|frecuencia=100, amplitud=0.6, gate=1|
  var sen, env, trig;
  sen=Saw.ar(frecuencia*[0.9888, 1.011], amplitud);
  env=EnvGen.kr(Env.asr(3.6,1,4.5), gate, doneAction:2);
  Out.ar(0,sen*env)
}).send(s)
)


a=Synth(\mi_segundo_synth)
a.set(\frecuencia,90)
a.set(\gate,0)


(
SynthDef(\hola,{|frec=430,amp=2,gate=1,trig=10|
  var sen, env;
  sen=SinOsc.ar(frec*[1,1.01],0,amp);
  env=EnvGen.kr(Env.perc(0,0.1),Impulse.kr(trig));
  Out.ar(0,sen*env);
}).send(s)
)



a=Synth(\hola)
a.set(\frec,1700)
a.free

b=Synth(\hola,[\frec,1240])
b.set(\frec,800)
b.free

c=Synth(\hola,[\frec,900])
c.free


(
  {
    SinOsc.ar(SinOsc.ar(100,0,10000,10200))
  }.play

)


(
    SynthDef(\fm,{|gate=1, freq=1, mul=100, add=1000, amp=1|
      var modulacion, sig, env;
      modulacion=SinOsc.kr(freq, 0, mul, add);
      sig=SinOsc.ar(modulacion,0,amp);
      env=EnvGen.kr(Env.asr(2,1,2),gate,doneAction:2);
      Out.ar(0,sig*env);
    }).send(s)
)

m=Synth(\fm)
m.set(\freq,10,\mul,500,\add,1000)
m.set(\gate,0)


(
    SynthDef(\am, {|gate=1, portadora=1000, moduladora=10, amp=1|
      var modulacion, sig, env;
      modulacion=SinOsc.kr(moduladora, 0, 0.5, 0.5);
      sig=SinOsc.ar(portadora, 0, modulacion);
      env=EnvGen.kr(Env.asr(2,1,2), gate, doneAction:2);
      Out.ar(1, sig*env*amp);
    }).send(s)
)

a=Synth(\am)
a.set(\moduladora, 2000)
a.set(\gate,0)


(
  {LFNoise2.ar(1000,1,0)}.scope

)

(
  {
    SinOsc.ar(LFNoise0.kr(10,9990,10010),0,0.5)
  }.scope
)


(
  SynthDef(\controlNoise, {|gate=1, freq=10, min=20, max=2000, amp=1|
    var control, mul, add, sig, env;
    mul=(max-min)/2;
    add=mul-min;
    control=LFNoise2.kr(freq, mul, add);
    sig=SinOsc.ar(control, 0, amp);
    env=EnvGen.kr(Env.asr(2,1,2), gate, doneAction:2);
    Out.ar(0, sig*env);
  }).send(s)
)

n=Synth(\controlNoise)

n.set(\freq, 10, \min, 500, \max, 1000)

n.set(\gate, 0)

SynthDef

[0,1,2,3,4,5];


[0,1,2,3,4,5].scramble;

"hola".scramble.postln

(
5.do{
  [0,1,2,3,4,5].scramble.postln;
  [1,2,3,4,5].choose.postln}
)

clear()

(
  10.do{{
    SinOsc.ar(rrand(300,5000),0,1/10)
  }.play}
)

(
SynthDef(\hacer,{|freq=400|
  Out.ar(0,SinOsc.ar(freq,0,1)*EnvGen.kr(Env.perc(0.01,5),doneAction:2))
}).send(s)
)

a=Synth(\hacer)

(
SynthDef(\rev,{|gate=1|
  var sen, env;
  sen=Impulse.ar(1);
  5.do{sen=AllpassN.ar(sen, 0.1, rrand(0.03,0.04),1.5)};
  env=EnvGen.kr(Env.asr(0,1,0), gate, doneAction:2);
  Out.ar(1,sen*env);
}).send(s)
)

a=Synth(\rev)
a.set(\gate, 0)


(
Tdef(\x, {
  5.do{
    [0,1,2,3,4].scramble.postln;
    0.05.wait;
  }
})
)

Tdef(\x).play
Tdef(\x).stop

(
Tdef(\x, {
inf.do{
  4.do{"----------------///-------------".postln;
  0.05.wait};
  10.do{"===============;;;;;=============".postln;
  0.05.wait};
  10.do{"***************////##############".postln;
  0.15.wait};
  }
}
)
)
Tdef(\x).play
Tdef(\x).stop


s.boot
s.quit


/*-----------------------------------*/

(
if(
  2.0.rand.postln > 1, 
  {"La expresión es cierta"},
  {"La expresión es falsa"};
)
)

(
  if(1000.rand > 900, {"mayor que 900"},
  {
    var opciones;
    opciones=[\aditiva, \substractiva];

    if(opciones.choose==\aditiva, 
      {"aditiva".postln;
        a=Mix.fill(10, {SinOsc.ar(exprand(30.0, 300.0), 0, 0.07)},
        {"substractiva".postln;
        a=Mix.fill(10, {BPF.ar(BrownNoise.ar, f=exprand(300.0, 3000.0), 0.5/f, 4)})}
      );
      a!2}.scope
    )
  }
)
)

(
x={|n| 
	if(n>10, 
		{"Es mayor que 10"}, 
		{"Es menor a 10"}
	)
};
)


x.value(10)

/*::::::::::::::::::::::::::::::::::::::::::*/

(
a={|n| 
	if(n>10, 
		{"Es mayor a 10"}, 
		{"es menor a 10"}
	)
};


Tdef(\hu,
	{inf.do{
		a.value(rrand(2, 20)).postln;
		0.5.wait
	}
})
)

Tdef(\hu).play;
Tdef(\hu).stop;

(
Tdef(\reloj, {
	var contador=0;
		inf.do{
			contador = contador + 1;
			contador.postln;
			0.1.wait;
		}
	})
)

Tdef(\reloj).play;
Tdef(\reloj).stop;


/*::::::::::::::::::::::::::::::::::::::::::*/

(
a=3;

switch(a, 
	0,{"a es igual a cero".postln;},
	1,{"a es igual a uno".postln;},
	2,{"a es igual a dos".postln;},
	3,{"a es igual a tres".postln;},
	4,{"a es igual a cuatro".postln;},
	);
)


(
SynthDef(\switch, {|freq=100|
	var sig, env;
	sig=Pulse.ar(freq, Line.kr(0.5, 0.01, 0.1))!2;
	env=EnvGen.kr(Env.perc(0, 0.1, 0.1), doneAction:2);
	Out.ar(0, sig*env);
	}).send(s);

Synth(\switch)
)

(
a=0;

switch(a, 
	0,{"a es igual a cero".postln;Synth(\switch, [\freq, 100])},
	1,{"a es igual a uno".postln;Synth(\switch, [\freq, 2000])},
	2,{"a es igual a dos".postln;Synth(\switch, [\freq, 300])},
	3,{"a es igual a tres".postln;Synth(\switch, [\freq, 400])},
	4,{"a es igual a cuatro".postln;Synth(\switch, [\freq, 500])},
	24,{"a es igual a veinteycuatro".postln;Synth(\switch, [\freq, 1500])},
	);
)


/*::::::::::::::::::::::::::::::::::::::::::*/


(
a=3;
	if(a==0,{"a es igual a cero".postln;Synth(\switch, [\freq, 100])});
	if(a==1,{"a es igual a uno".postln;Synth(\switch, [\freq, 2000])});
	if(a==2,{"a es igual a dos".postln;Synth(\switch, [\freq, 300])});
	if(a==3,{"a es igual a tres".postln;Synth(\switch, [\freq, 400])});
	if(a==4,{"a es igual a cuatro".postln;Synth(\switch, [\freq, 500])});
	if(a==24,{"a es igual a veinteycuatro".postln;Synth(\switch, [\freq, 1500])});
)

(
SynthDef(\puls, {|freq|
	var sig, env;
	sig=Pulse.ar(300, Line.kr(0.5, 0.01, 0.1));
	env=EnvGen.kr(Env.perc(0, 0.1, 0.1), doneAction:2);
	Out.ar(0, sig*env);
	}).send(s);
)



/*::::::::::::::::::::::::::::::::::::::::::*/

(
SynthDef(\sin, {|freq|
	var sig, env;
	sig=SinOsc.ar(2000,0,0.3);
	env=EnvGen.kr(Env.perc(0, 0.1, 0.1), doneAction:2);
	Out.ar(0, sig*env);
}).send(s);
)

Synth(\sin).play;





/*::::::::::::::::::::::::::::::::::::::::::*/

b=Buffer.read(s,"holabeats.wav")
a=Buffer.read(s,"holabeats.wav")


(
	{
		var numeroDeCanales, numeroDeBuffer;

		numeroDeCanales=b.numChannels;
		numeroDeBuffer=b.bufnum;

		PlayBuf.ar(numeroDeCanales, numeroDeBuffer, loop:1)
	}.scope;


)


b.bufnum

b.query

/*::::::::::::::::::::::::::::::::::::::::::*/

a.numFrames_

(
SynthDef(\sample, {|frecuencia=1, posc=0, trigger=1, rate=1|
	var sen, env;
	sen=PlayBuf.ar(1, a.bufnum, rate, Impulse.kr(frecuencia), posc);
	sen=sen*SinOsc.ar(MouseY.kr(20, 1));
	sen=Pan2.ar(sen, LFNoise2.kr(10), 0.9);
	env=EnvGen.kr(Env([0.0, 1.0, 1.0, 0.0], 
			frecuencia.reciprocal*[0.05, 0.9, 0.05]
			), trigger, doneAction:2);
	Out.ar(0, sen*env)
}).send(s);
)

Synth(\sample)

s.scope


(
Tdef(\hu, {var suma=0;
	inf.do{suma=suma+1;
	Synth(\sample, [\frecuencia, rrand(2, 5),\posc, rrand(0, 107520), 
		\rate, (suma%2+0.5)*1.2]);
		0.2.wait}}
)
)

Tdef(\hu).quant_(0).play;
Tdef(\hu).stop;

(
Tdef(\hu, {var suma=0;
	inf.do{suma=suma+1;
	Synth(\sample, [\frecuencia, 0.1,\posc, suma%50*10, 
		\rate, (suma%10-0.5)*0.5]);
		0.5.wait}}
)
)

(
Tdef(\hu, {var suma=0;
	inf.do{suma=suma+1;
	Synth(\sample, [\frecuencia, (suma%7+0.3)*1.3,\posc, suma%50*14, 
		\rate, 1.3]);
		0.25.wait}}
)
)

s.quit



a=[1, 2, 3, 4, 5]

a

a=[1, 2, 'tango', 4, 'ranchera']

Array.geom(5, 1, 0.3)

Array.fib(36)


Array.fib(5, 7, 32)

Array.rand(8, 1, 100)

Array.rand2(8, 1, 100)

Array.linrand(8, 1, 100)

Array.exprand(8, 1, 100)


Array.series(5, 1, 0.3).first
Array.series(5, 1, 0.3).last
Array.series(5, 1, 0.3).choose

Array.series(10, 2, 20).wchoose([0.3, 0.02, 0.08, 0.1])
[0.3, 0.02, 0.08, 0.1, 1].sum



Array.series(5, 1, 0.3).size


(
a=[2, 3, 4, 14, 1000, 'si'];

Tdef(\no, {var cont=0;
	inf.do{
		a[cont%a.size].postln;
		cont=cont+1;
		0.3.wait;
	}
}).play
)

Tdef(\no).play

(
SynthDef(\sin, {|amp=0.8|
	var sen, env;
	sen=Pan2.ar(SinOsc.ar(1200, 0, amp), 0, 0.9);
	env=EnvGen.kr(Env.perc(0, 0.3), doneAction:2);
	Out.ar(0, sen*env)
}).send(s)
)

/*********************************/


Synth(\sin)



(

a=Array.geom(15, 0.1, 1.16).pyramid;

Tdef(\gi, {
	inf.do{
		Synth(\sin, [\amp, a.choose]);
		0.07.wait;
	}
})
)

Tdef(\gi).play

/*********************************/


a=Buffer.read(s,"holabeats.wav")

a.numFrames_

497114

(
SynthDef(\sample, {|posc, amp=0.1|
	var sen, env;
	sen=PlayBuf.ar(1, a.bufnum, 1.6, Impulse.kr(1), posc)*amp;
	env=EnvGen.kr(Env([0, 1, 1, 0], [1*0.025, 1*0.95, 1*0.025]), doneAction:2);
	Out.ar(0, sen*env)
}).send(s)
)

Synth(\sample)

a=Array.geom(20, 50, 1.442);
a[4]

a=Array.series(10, 50, 12100).pyramid;
a=Array.series(10, 50, 12100);

(

a=Array.series(10, 81050, 3220).reverse();
b=Array.geom(15, 0.1, 1.16).reverse();

Tdef(\di, {
	var cont=0;
	inf.do{
		cont=cont+1;
		Synth(\sample, [\posc, a[cont % a.size], \amp, b[cont % b.size]]);
		0.12.wait;
	}
})

)

Tdef(\di).play;



s.boot;
s.kill


{SinOsc.ar(700,0,1)}.play


Server.default.options.device = "my_synth"




(
Tdef(\x, {
    50.do{
        [0,1,2,3].scramble.postln;
        0.05.wait;
    }
});
)

Tdef(\x).play
Tdef(\x).stop

(
SynthDef(\uno, {|out=0|
    var sen, env;
    sen=SinOsc.ar(720,0,0.8)!2;
    env=EnvGen.kr(Env.perc(0,0.1),doneAction:2);
    Out.ar(out, sen*env);
}).send(s)
)

Synth(\uno)

(
Tdef(\x,{
    inf.do{
        Synth(\uno);
        0.5.wait;
    }
})
)

Tdef(\x).quant_(0).play;
Tdef(\x).stop;


(
SynthDef(\cuatro2, {|out=0, gate=1, frecuencia=100, mul=0.6|
    var sen, env;
    sen=Saw.ar(XLine.kr(12200, 120, 0.13), mul)!2;
    env=EnvGen.kr(Env.perc(0, 0.15), gate, doneAction:2);
    Out.ar(out, sen*env)
}).send(s)
)

Synth(\cuatro2)


(
Tdef(\gh, {
    inf.do{
        Synth(\cuatro2);
        0.58.wait;
    }
})
)

Tdef(\gh).play;
Tdef(\gh).stop;



(
SynthDef(\tres,{|out=0, frecuencia=100, mul=0.8|
    var sen, env;
    sen=SinOsc.ar(frecuencia, 0, mul);
    env=EnvGen.kr(Env.perc(0, 0.1),doneAction:2);
    Out.ar(out, sen*env)
}).send(s)
)

(
Tdef(\x2, {
    inf.do{
        3.do{
            Synth(\tres, [\frecuencia, rrand(200, 300), \mul, rrand(0, 0.8)]);
            "-----------/////------------------------".scramble.postln;
        0.1.wait;
        
        
        };
       3.do{
            Synth(\tres, [\frecuencia, 1300, \mul, rrand(0, 0.8)]);
            "-----------;;;;;------------------------".scramble.postln;
            0.07.wait;
       }; 
       5.do{
            Synth(\tres, [\frecuencia, rrand(2700, 3500), \mul, rrand(0, 0.8)]);
            "*******///////###".scramble.postln;
            0.17.wait;
       }
    }
})
)

Tdef(\x2).play;
Tdef(\x2).stop;

/* -----------------------------------------*/

(
SynthDef(\cuatro,{|out=0, gate=1, frecuencia=100, mul=0.8|
    var sen, env;
    sen=Saw.ar(frecuencia, mul)!2;
    env=EnvGen.kr(Env.perc(0.06, 0.15), gate, doneAction:2);
    Out.ar(out, sen*env)
}).send(s)
)


(
Tdef(\x2, {
    inf.do{
        3.do{
            Synth(\tres, [\frecuencia, rrand(200, 300), \mul, rrand(0, 0.4)]);
            "-----------/////------------------------".scramble.postln;
        0.1.wait;
        
        
        };
       2.do{
            Synth(\tres, [\frecuencia, 130, \mul, rrand(0, 0.4)]);
            "-----------;;;;;------------------------".scramble.postln;
            0.06.wait;
       }; 
       4.do{
            Synth(\tres, [\frecuencia, rrand(2700, 3500), \mul, rrand(0, 0.4)]);
            "*******///////###".scramble.postln;
            0.17.wait;
       }
    }
})
)

Tdef(\x2).play;
Tdef(\x2).stop;




/* -----------------------------------------*/


(
Tdef(\x2, {
    inf.do{
        3.do{
            Synth(\tres, [\frecuencia, rrand(200, 300), \mul, rrand(0, 0.4)]);
            "-----------/////------------------------".scramble.postln;
        0.1.wait;
        
        
        };
       2.do{
            Synth(\tres, [\frecuencia, 130, \mul, rrand(0, 0.4)]);
            "-----------;;;;;------------------------".scramble.postln;
            0.06.wait;
       }; 
       4.do{
            Synth(\tres, [\frecuencia, rrand(2700, 3500), \mul, rrand(0, 0.4)]);
            "*******///////###".scramble.postln;
            0.17.wait;
       }
    }
})
)

Tdef(\x2).play;
Tdef(\x2).stop;

/* -----------------------------------------*/


(
Tdef(\x2, {
    inf.do{
        3.do{
            Synth(\cuatro, [\frecuencia, 4000, \mul, rrand(0, 0.4)]);
            "-----------/////------------------------".scramble.postln;
        0.071.wait;
        
        
        };
       8.do{
            Synth(\cuatro, [\frecuencia, 1300, \mul, rrand(0, 0.4)]);
            "-----------;;;;;------------------------".scramble.postln;
            0.17.wait;
       }; 
       14.do{
            Synth(\cuatro, [\frecuencia, 45, \mul, rrand(0, 0.4)]);
            "*******///////###".scramble.postln;
            0.07.wait;
       }
    }
})
)

Tdef(\x2).play;
Tdef(\x2).stop;


/* -----------------------------------------*/



(
SynthDef(\cinco, {|out=0, frecuencia=100, cutoff, amp=0.3, gate=1|
    var sen, env;
        sen=Saw.ar(frecuencia, amp)!2;
        env=EnvGen.kr(Env.asr(0.3, 1, 2), gate, doneAction:2);
        Out.ar(out, sen*env);
}).send(s);
)


a=Synth(\cinco)
a.set(\gate, 0)


(
Tdef(\x3, { a=Synth(\cinco);
    inf.do{
        a.set(\frecuencia, rrand(1000, 120));
        0.3.wait;
    }
})
)



Tdef(\x3).play;
Tdef(\x3).stop;
a.set(\gate, 0)



(
SynthDef(\seis, {|out=0, frecuencia=100, cutoff=300, amp=0.3, gate=1|
    var sen, env, filtro;
        sen=Saw.ar(frecuencia, amp)!2;
        env=EnvGen.kr(Env.asr(0.3, 1, 2), gate, doneAction:2);
        filtro=RLPF.ar(sen, cutoff, 0.9);
        Out.ar(out, filtro*env);
}).send(s);
)



d=Synth(\seis)
d.set(\gate, 0)


(
Tdef(\x3, { //a=Synth(\cinco);
    inf.do{
        a.set(\frecuencia, rrand(1000, 220), \cutoff, 8000);
        0.1.wait;
    }
})
)
Tdef(\x3).play;
Tdef(\x3).stop;
a.set(\gate, 0)




(
Tdef(\x3, { 
    inf.do{
        a.set(\frecuencia, rrand(200, 420), \cutoff, [12000, 8400, 7500, 3500, 6700, 6000].choose);
        0.1.wait;
    }
})
)


Tdef(\x3).play;
Tdef(\x3).stop;
a.set(\gate, 0)
d=Synth(\seis)
d.set(\gate, 0)


/*++++++++++++++++++++++++++++++++*/


(
Tdef(\x3, { 
    inf.do{
        a.set(\frecuencia, [60, 62, 64, 65, 67, 69, 71].choose);
        0.1.wait;
    }
})
)

a=Synth(\cinco)
Tdef(\x3).play;
Tdef(\x3).stop;
a.set(\gate, 0);



/*++++++++++++++++++++++++++++++++*/


(
Tdef(\x3, { 
    inf.do{
        3.do{a.set(\frecuencia, [60, 3453, 62.204, 64.32333, 65.5324, 67.209, 69.42, 72].choose, \cutoff, [2300, 2400, 600, 3400, 1500, 2700, 3000].choose);
        0.2.wait;};
        4.do{a.set(\frecuencia, [120, 632, 614, 65, 67, 269, 741].choose, \cutoff, [14200, 4040, 6500, 8400, 5500, 6700, 3000].choose);
        0.1.wait;};
        12.do{a.set(\frecuencia, [610, 622, 64, 635, 367, 69, 71].choose, \cutoff, [2200, 4400, 6600, 14040, 1500, 2700, 3000].choose);
        0.071.wait;};
        3.do{a.set(\frecuencia, [640, 62, 64, 665, 67, 639, 71].choose, \cutoff, [12200, 400, 600, 1400, 15300, 2700, 3000].choose);
        0.11.wait;};
    }
})
)

a=Synth(\cinco)
Tdef(\x3).play;
Tdef(\x3).stop;
a.set(\gate, 0);


/*++++++++++++++++++++++++++++++++*/


(
SynthDef(\seis, {|out=0, frecuencia=60, cutoff=300, amp=0.21, gate=1|
    var sen, env, filtro;
        sen=Saw.ar(frecuencia, amp)!2;
        filtro=RLPF.ar(sen, MouseX.kr(200, 15000), 0.9);
        env=EnvGen.kr(Env.asr(0.3, 1, 2), gate, doneAction:2);
        Out.ar(out, filtro*env);
}).send(s);
)


b=Synth(\seis)
b.set(\gate, 0);



(
Tdef(\x4, { 
    inf.do{
         1+(10.rand).do{b.set(\frecuencia, [60, 65].choose);0.19.wait};           1+(5.rand).do{b.set(\frecuencia, [66, 67].choose);0.19.wait};            1+(7.rand).do{b.set(\frecuencia, [61, 65].choose);0.19.wait};
    }
})
)

Tdef(\x4).play;
Tdef(\x4).stop;
a.set(\gate, 0);


/*++++++++++++++++++++++++++++++++*/


(
SynthDef(\bombo, {|out=0, frecuencia=60, gate=1|
    var sen, env;
        sen=Pan2.ar(SinOsc.ar(frecuencia, pi*0.25, 0.8), 0, 0.9);
        env=EnvGen.kr(Env.perc(0, 0.13), gate, doneAction:2);
        Out.ar(out, sen*env);
}).send(s);
)



(
SynthDef(\tarola, {|out=0, frecuencia=660, gate=1|
    var sen, env, ruido;
        ruido=LPF.ar(WhiteNoise.ar(0.34), XLine.kr(1200, 200, 0.2), 0.9);
        sen=Pan2.ar(SinOsc.ar(frecuencia, 0, 0.114) + ruido, 0, 0.8);
        env=EnvGen.kr(Env.perc(0, 0.153), gate, doneAction:2);
        Out.ar(out, sen*env);
}).send(s);
)

(
SynthDef(\hi, {|out=0, gate=1|
    var sen, env;
        sen=HPF.ar(WhiteNoise.ar(0.5), 2000, 0.9);
        env=EnvGen.kr(Env.perc(0, 0.13), gate, doneAction:2);
        Out.ar(out, sen*env, 0, 0.5);
}).send(s);
)


(
SynthDef(\seis, {|out=0, frecuencia=60, cutoff=300, amp=0.21, gate=1|
    var sen, env, filtro;
        sen=Saw.ar(frecuencia, amp)!2;
        filtro=RLPF.ar(sen, MouseX.kr(200, 15000), 0.9);
        env=EnvGen.kr(Env.asr(0.3, 1, 2), gate, doneAction:2);
        Out.ar(out, filtro*env);
}).send(s);
)

(
b=Synth(\seis);
(
Tdef(\bat, {
        inf.do{
              2.do{Synth(\bombo);
               0.19.wait;
}}
})
);

Tdef(\bat).play;

(
Tdef(\hihat, {
    inf.do{Synth(\hi);
        0.19.wait;}}
    
    )
);

Tdef(\hihat).play;

(

Tdef(\x4, {
    inf.do{
        1+(10.rand).do{b.set(\frecuencia, [60, 65].choose);0.19.wait};
        1+(5.rand).do{b.set(\frecuencia, [66, 67].choose);0.19.wait};
        1+(7.rand).do{b.set(\frecuencia, [61, 65].choose);0.19.wait};
    }
})

);

Tdef(\x4).play;

)

Tdef(\bat).stop;
Tdef(\hihat).stop;
Tdef(\x4).stop;
b.set(\gate, 0);


s.recSampleFormat="int16"




/*===========================================*/



SynthDef(\bajo_electrico, {
    // Parámetros del bajo eléctrico
    arg freq = 100,          // Frecuencia fundamental del bajo
    dur = 1,             // Duración de la nota en segundos
    amp = 0.5,           // Amplitud de la nota
    release = 0.2,       // Tiempo de liberación del envolvente de amplitud
    cutoffFreq = 80,     // Frecuencia de corte del filtro de paso bajo
    res = 0.7;           // Resonancia del filtro de paso bajo
    
    // Oscilador de onda sinusoidal para el bajo eléctrico
    var osc = Saw.ar(freq);
    
    // Envoltorio de amplitud para el ataque y la liberación de la nota
    var env = EnvGen.kr(Env.perc(0.01, release), doneAction: 2);
    
    // Aplicar el filtro de paso bajo al oscilador
    var filtro = LPF.ar(osc, cutoffFreq, res);
    
    // Aplicar la envolvente de amplitud al sonido filtrado
    var sonido = filtro * env * amp;
    
    // Salida de audio del synth
Out.ar(0, sonido);
}).add;
)))))})


// Crear un synth para el bajo eléctrico
(
Synth(\bajo_electrico, [
    \freq, 80,        // Frecuencia fundamental
    \dur, 1,          // Duración de la nota en segundos
    \amp, 0.5,        // Amplitud de la nota
    \release, 0.2,    // Tiempo de liberación del envolvente de amplitud
    \cutoffFreq, 80,  // Frecuencia de corte del filtro de paso bajo
    \res, 0.7         // Resonancia del filtro de paso bajo
]);
)
]))


a=Synth(\bajo_electrico)
a.play



+++++++++++++++++++++++++++++++++++++++++++++++



// Define el SynthDef para el bajo eléctrico
SynthDef(\bajo_electrico, {
    // Parámetros del bajo eléctrico
    arg freq = 100,          // Frecuencia fundamental del bajo
        dur = 1,             // Duración de la nota en segundos
        amp = 0.5,           // Amplitud de la nota
        release = 0.2,       // Tiempo de liberación del envolvente de amplitud
        cutoffFreq = 80,     // Frecuencia de corte del filtro de paso bajo
        res = 0.7;           // Resonancia del filtro de paso bajo
                    
        // Oscilador de onda sinusoidal para el bajo eléctrico
        var osc = Saw.ar(freq);
                    
        // Envoltorio de amplitud para el ataque y la liberación de la nota
        var env = EnvGen.kr(Env.perc(0.01, release), doneAction: 2);
                    
        // Aplicar el filtro de paso bajo al oscilador
        var filtro = LPF.ar(osc, cutoffFreq, res);
                    
        // Aplicar la envolvente de amplitud al sonido filtrado
        var sonido = filtro * env * amp;
                    
        // Salida de audio del synth
        Out.ar(0, sonido);
}).add;
                
// Define el Tdef para tocar ciclos de notas para el bajo eléctrico
(
Tdef(\bajo_ciclos, {
// Define los ciclos de notas para el bajo eléctrico
    Pbind(
        \instrument, \bajo_electrico,  // Utiliza el SynthDef del bajo eléctrico
        \degree, Pseq([0, 2, 3, 5], inf),  // Secuencia de grados de la escala (en semitonos)
        \dur, 0.5,  // Duración de cada nota
        \amp, 0.4   // Amplitud de cada nota
        ).play;
});
)
                        
// Inicia el Tdef para tocar los ciclos de notas del bajo eléctrico
Tdef(\bajo_ciclos).start;

(

SynthDef(\eje1, {|freq=440, out=1|
    var sen;
    sen=SinOsc.ar(freq, 0, 1);
    Out.ar(out, sen);
}).send(s);

)

Synth(\eje1);

a.stop;




(
SynthDef(\mi_segundo_synth, {|frecuencia=100, amplitud=0.6, gate=1|
  var sen, env, trig;
  sen=Saw.ar(frecuencia*[0.9888, 1.011], amplitud);
  env=EnvGen.kr(Env.asr(3.6,1,4.5), gate, doneAction:2);
  Out.ar(0,sen*env)
}).send(s)
)



(
Tdef(\eje2, {
SynthDef(\eje1, {|freq=440, out=1|
    var sen;
    sen=SinOsc.ar(freq, 0, 1);
    Out.ar(out, sen);
}).send(s);


Synth(\eje1);


  })


)

Tdef(\eje2).play
Tdef(\eje2).stop





s.boot
s.quit


(

SynthDef(\fading_sin, {
    |out=0, freq=440, dur=10|
    var sig = SinOsc.ar(freq) * Line.kr(1, 0, dur);
    Out.ar(out, sig)
}).add;

)



(

a=Synth(\fading_sin); 1.5.wait;
b=Synth(\fading_sin); 4.5.wait;
c=Synth(\fading_sin); 2.5.wait;

)







(

Synth(\fading_sin); 
Synth(\fading_sin); 
Synth(\fading_sin); 

)


(

SynthDef(\sinSynth, {
    |freq=440, amp=0.1, dur=1|
    var sig;
    sig=SinOsc.ar(freq)*amp;
    sig=sig * EnvGen.kr(Env.perc(0.01, dur - 0.01), doneAction:2);
    Out.ar(0, sig);
}).add;

)

p=Pbind(
    \instrument, \sinSynth, 
    \dur, Pseq([0.25, 0.5, 0.75, 1], inf),
    \freq, Pseq([440, 660, 550, 880], inf),
    \amp, 0.2
);

p.play;
p.stop;
