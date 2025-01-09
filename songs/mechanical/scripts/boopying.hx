var shit:Bool = false;
function beatHit(curBeat){
if(curBeat % 4 == 0){
    switch(shit){
        case false:
            iconP2.angle = 10;
            iconP1.angle = -10;
            shit = true;

        case true:
            iconP2.angle = -10;
            iconP1.angle = 10;
            shit = false;
    }
}
}