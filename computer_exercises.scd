s.boot;

{SinOsc.ar(LFNoise0.ar([10, 15], 400, 800), 0, 0.9)}.play;




(
{
RLPF.ar(
    LFSaw.ar([8, 12], 0, 0.9),
    LFNoise1.ar([2, 3].choose, 1500, 1600),
    0.05,
    mul: 0.4
)
}.play;
)



{SinOsc.ar(LFNoise0.ar(10, 400, 800), 0, 0.9)}.play;





{SinOsc.ar}.play;






(
{

RLPF.ar(
    LFSaw.ar([8, 12], 0, 0.2),
    abs(LFNoise1.ar([2,3].choose, 1500, 1600)),
    0.05
)
}.play;
)


//////Rissing Bubbles


(
    {
        CombN.ar(
            SinOsc.ar(
                LFNoise1.kr(
                    4, 
                    24, 
                    LFSaw.kr(
                        [8, 7.23],
                        0,
                        3,
                        80
                    )
                ).midicps,
                0,
                0.4
            ),
            0.2,
            0.2,
            4
        )
    }.play
)

////////////////
(
    {RLPF.ar(
        LFSaw.ar([8, 12], 0, 0.2),
        LFNoise1.ar([2, 3].choose, 1500, 1600),
        0.05,
        0.4
    )
    }.play;
)


/////////////////


(
    {
        SinOsc.ar(LFNoise0.ar([10, 15], 400, 800), 0, 0.3)
    }.play;
)


/////////////////



(
    {
        MIDIOut.noteOn(0, 60, 100)
    
    
    }.play;


)



(
    {
        SinOsc.ar(
            rrand(
            100,
            200
        )
    )
}.play;
)



(
    {CombN.ar(
        WhiteNoise.ar(0.1),
               [1, 2, 3, 4],
               XLine.kr(0.0001, 0.01,20),
               -0.2
           )
    }.play;
)


/////////////////////7


(
	{
		SinOsc.ar(500, 0, 1)
	}.scope(1);
)

(
	{
		WhiteNoise.ar(0.7)
	}.scope(1);
)



(
	{
		Out.ar(0, In.ar(MouseY.kr(15, 23).div(1), 1)*0.8)
	}.scope;
	{
		Out.ar(16, [SinOsc.ar, Saw.ar, Pulse.ar,
		LFTri.ar, LFNoise0.ar(200), Dust.ar(100),
		PinkNoise.ar, WhiteNoise.ar])
	}.play;
)


(
	{
		a=SinOsc.ar(400, mul: 0.3);
		b=SinOsc.ar(400, MouseX.kr(0, 2pi), mul: 0.3);
		[a + b, 0, a, b]
	}.scope;


)

/// 0 phase

(
	{
		SinOsc.ar(SinOsc.ar(0.3, 0, 7, 72).round(1).midicps, 0, 0.7)
	}.play;
)

/// 0.5pi phase

(
	{
		SinOsc.ar(SinOsc.ar(0.3, 0.5pi, 7, 72).round(1).midicps, 0, 0.7)
	}.play;
)


/// 1pi phase

(
	{
		SinOsc.ar(SinOsc.ar(0.3, 1pi, 7, 72).round(1).midicps, 0, 0.7)
	}.play;
)


/// 1.5pi phase

(
	{
		SinOsc.ar(SinOsc.ar(0.3, 1.5pi, 7, 72).round(1).midicps, 0, 0.7)
	}.play;
)

s.recSampleFormat="int16";
s.recChannels=1;

s.prepareForRecord("audio1");

s.prepareForRecord("recordings/audio1");

s.record;

s.stopRecording;

/// Chunk

// 1
(
	{
		var out, delay;
		out = SinOsc.ar(
			abs(
				LFNoise1.kr(
					0.5,
					600,
					LFSaw.kr(
						1.5,
						mul: 50,
						add: 500
					)
				)
			),
			0,
			0.1
		);
	delay = CombN.ar(out,
		0.3,
		[1.35, 0.7],
		6
	);
	Pan2.ar(out, 0) + delay
	}.play;
)
// 2
(
	{
		Mix.ar(
			Array.fill(5,
				{Pan2.ar(
					SinOsc.ar(SinOsc.ar(1/10, rrand(0, 0.6), 200, 500)),
					1.0.rand)
				})
		)*0.02
	}.play
)


// 3

(
	{
		var trig, out, delay;
		trig = Impulse.kr(6);
		out = Blip.ar(
			TRand.kr(48, 72, trig).midicps,
			TRand.kr(1, 12, trig),
			max(0, TRand.kr(-0.5, 0.4, trig))
		);

		out = Pan2.ar(out, TRand.kr(-1.0, 1.0, trig));
		out = out*EnvGen.kr(Env.perc(0, 1), trig);
		out = Mix.ar({out}.dup(6))*0.2;
		delay = CombL.ar(out, 2.0, 4/6, 6);
		out + delay;
	}.play;
)

// 4

(
	{
		Mix.ar(
			Array.fill(5, 
				{arg c;
					SinOsc.ar(
						LFSaw.ar((c*0.2 + 1)/3, mul: 500, add: 700)
					)
				}
			
			)
		
		)*0.1
	
	}.play

)
