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
