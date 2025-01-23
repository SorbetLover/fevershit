var strumX = [];
var strumY = [];
function onStrumCreation(e){
    e.__doAnimation = false;
}
function postCreate(){
    for(i in 0...4){
        strumX[i] = strumLines.members[0].members[i].x;
        strumY[i] = strumLines.members[0].members[i].y;
    }
    var iee = 0;
    for(e in 4...8){
        strumX[e] = strumLines.members[1].members[iee].x;
        strumY[e] = strumLines.members[1].members[iee].y;
        iee++;
    }

        trace(strumX, strumY);
}
// function onSongStart(){
//     for(i in 0...3){
//         strumX[i] = strumLines.members[0].members[i].x;
//         strumX[i * 2] = strumLines.members[1].members[i].x;
//         strumY[i] = strumLines.members[0].members[i].y;
//         strumY[i * 2] = strumLines.members[1].members[i].y;
//     }
// }
var _elapsed = 0;
var strumOFF = 0;
var coolPart = false;
function postUpdate(elapsed){
    _elapsed += elapsed;
    strumOFF = FlxMath.lerp(strumOFF, 0, 0.05);
    // trace(strumOFF);
    if(!startingSong && !coolPart) for(i in 0...4){
        strumLines.members[0].members[i].x = strumX[i] + 25 * Math.sin(_elapsed * 10);
        strumLines.members[1].members[i].x = strumX[i + 2 * 2] + 25 * Math.sin(_elapsed * 10);

        strumLines.members[0].members[i].y = (strumY[i]  - strumOFF ) + 5 * i * Math.cos(_elapsed * 10);
        strumLines.members[1].members[i].y = (strumY[i + 2 * 2]  - strumOFF ) + 5 * i * Math.cos(_elapsed * 10);

    }
    if(!startingSong && coolPart){
        for(i in 0...4){
            
                var asd:Float = 30;
            if(i % 2 == 0){
                strumLines.members[0].members[i].y = 50 + 40 * Math.cos(_elapsed * Conductor.crochet / asd );
                strumLines.members[1].members[i].y = 50 + 40 * Math.cos(_elapsed * Conductor.crochet / asd );
            } else {
                strumLines.members[0].members[i].y = 50 - 40 * Math.cos(_elapsed * Conductor.crochet / asd );
                strumLines.members[1].members[i].y = 50 - 40 * Math.cos(_elapsed * Conductor.crochet / asd );
                
            }
        }
    }
}
var hm:Bool = false;

function stepHit(curStep){
    if(
        curStep == 12 ||
        curStep == 28 ||
        curStep == 44 ||
        curStep == 60 ||
        curStep == 76 ||
        curStep == 92 ||
        curStep == 108 ||
        
        curStep == 2172 ||
        curStep == 2188 ||
        curStep == 2204 ||
        curStep == 2220 ||
        curStep == 2236 ||
        curStep == 2252 ||
        curStep == 2268 ||
        curStep == 2284
    ){
        switch(hm){
            case false:
                strumOFF = -200;
            default:
                strumOFF = 200;
        }
        hm = !hm;
    }
    if(curStep == 1024){
        coolPart = true;
    }
    if(curStep == 1152){
        coolPart = false;
    }
}