import flixel.tweens.FlxTweenType;


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
}

var startingpart = true;
var secondpart = false;
var _elapsed = 0;

var pongpong:FlxTween;
var ooff:Float;
function update(elapsed){
    _elapsed += elapsed;
    if(!startingSong && startingpart){
        var bleh = 0;
        var amp = 60;
        for(i in 0...4){
            if(i % 2 == 0){
                strumLines.members[0].members[i].x = strumX[i] + amp * Math.sin(_elapsed * 3);
                strumLines.members[1].members[i].x = strumX[i + 2 * 2] + amp * Math.sin(_elapsed * 3);
            } else {
                strumLines.members[0].members[i].x = strumX[i] + amp * Math.sin(_elapsed * -3);
                strumLines.members[1].members[i].x = strumX[i + 2 * 2] + amp * Math.sin(_elapsed * -3);
            }
        }
    } else if(!startingSong && secondpart){
        // var bleh = 8.02 / 2;
        // var amp = 5;

        var bleh = 8;
        var amp = 10;
        for(i in 0...4){
            if(i % 2 == 0){
                strumLines.members[0].members[i].x = strumX[i] + amp * Math.sin(_elapsed * -bleh);
                strumLines.members[1].members[i].x = strumX[i + 2 * 2] + amp * Math.sin(_elapsed * -bleh);

                
            } else {
                strumLines.members[0].members[i].x = strumX[i] + amp * Math.sin(_elapsed * bleh);
                strumLines.members[1].members[i].x = strumX[i + 2 * 2] + amp * Math.sin(_elapsed * bleh);
            }
        }
    }
}

function postUpdate(){
    for(i in 0...4){
        strumLines.members[0].members[i].y = 50 - ooff;
        strumLines.members[1].members[i].y = 50 - ooff;
    }
}
function stepHit(curStep){
    switch(curStep){
        case 240: 
        startingpart = false;
        for(i in 0...4){
            FlxTween.tween(strumLines.members[0].members[i], {x: strumX[i]}, Conductor.crochet / 1000 / 2);
            FlxTween.tween(strumLines.members[1].members[i], {x: strumX[i + 2 * 2]}, Conductor.crochet / 1000 / 2);
        }
        case 384:
            secondpart = true;
            // pongpong = FlxTween.num(ooff, 60, Conductor.crochet / 1000 / 1.2, {type: FlxTweenType.PINGPONG}, function(eh){
                // ooff = eh;
            // });
        
    }
}