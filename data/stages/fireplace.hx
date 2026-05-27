var paste;
var pastem;
var fp = "stages/paste/";

var focusonpaste = false;
var firepl:FunkinSprite;
var shit = [];
var portal:FunkinSprite;
var hallow:FunkinSprite;
function img(thing:String = "buceta"){
    return Paths.image(fp + thing);
}
var otherpaste:Character;
var feverparry:Character;
function create(){
    /// precache ts to avoid lag
    var fuck = new FunkinSprite();
    fuck.frames = Paths.getFrames("mechanicShit/paintingShit");

    firepl = new FunkinSprite(0,-300).loadGraphic(img("bg"));
    insert(0, firepl);
    firepl.scale.set(1.35,1.35);

    portal = new FunkinSprite(0,0).loadGraphic(img("portal"));
    portal.scrollFactor.set(0,0);
    portal.screenCenter();
    insert(1, portal);

    hallow = new FunkinSprite(0,0).loadGraphic(img("hallow"));
    insert(2, hallow);
    shit.push(hallow);
    hallow.x = -300;
    hallow.y = -400;
    hallow.scale.set(1.85,1.85);
    shit.push(portal);

    otherpaste = new Character(-200,-300,"pasteanim");
    otherpaste.debugMode = true;
    otherpaste.visible = false;
    otherpaste.playAnim("smash");
    otherpaste.animation.pause();


    feverparry = new Character(800,0, "feveranim");
    feverparry.debugMode = true;
    add(feverparry);
    add(otherpaste);
    feverparry.visible = false;

}
var fzoom = 0.5;
var chn = false;
var dshit:FlxText;
function postCreate(){

    bf.y = -200;
    bf.x = 900;
    paste = strumLines.members[0].characters[0];
    pastem = strumLines.members[0].characters[1];
    FlxG.camera.zoom = 1;
    pastem.alpha = 0.001;

    portal.scale.set(1.5/fzoom,1.5/fzoom);
    pastem.x = -450;
    pastem.y = -350;
    dad.cameraOffset.y = -200;
    dad.cameraOffset.x = 250;
    bf.cameraOffset.x = -300;
    for(i in shit){
        i.alpha = 0.000001;
    }
    camGameZoomLerp = 0.2;

    dshit = new FlxText(300,FlxG.height / 2,1000,"0",40);
    dshit.scrollFactor.set(0,0);
    // add(dshit);
    camHUD.visible = false;
}

function stepHit(curStep){
    switch(curStep){
        case 545:
            focusonpaste = true;
        case 556:
            if(!chn){

                dad.playAnim("transition", true);
                dad.animation.finishCallback = function(a){
                    if(!chn){
                        paste.alpha = 0;
                        FlxG.camera.flash(0xFFFFFFFF, 1, false);
                        pastem.alpha = 1;
                        dad.animation.finishCallback = null;
                        defaultCamZoom = fzoom;
                        FlxG.camera.zoom = defaultCamZoom;
                        focusonpaste = false;
                        bgthing();

                    }
                }
            } else {
                focusonpaste = false;

            }
    }
}
function trans(){
        paste.alpha = 0;
        pastem.alpha = 1;
        dad.animation.finishCallback = null;
        defaultCamZoom = fzoom;
        FlxG.camera.zoom = defaultCamZoom;
        focusonpaste = false;
            
}
var drain = false;
var shk = false;
function beatHit(curBeat){
    switch(curBeat){
        case 364, 716:
            drain = true;
            pastem.playAnim("scream");
            camGame.shake(0.0125, 1.1);
            camHUD.shake(0.0152, 1.1);
            focusonpaste = true;
            shk = true;
            pastem.animation.finishCallback = function(a){
                drain = false;
                shk = false;
                focusonpaste = false;
                camHUD.visible = true;

            }
    }
    mbeat(curBeat);
}
function bgthing(){
        camHUD.visible = true;
    chn = true;
    firepl.visible = false;
    pastem.cameraOffset.x = -200;
    pastem.cameraOffset.y = 200;
    for(i in shit){
        i.alpha = 1;
        
    }
}
var shi = 0;
function postUpdate(elapsed){
    dshit.text = otherpaste.animation.curAnim.curFrame;
    if(FlxG.keys.pressed.A && FlxG.keys.pressed.S && FlxG.keys.pressed.K && FlxG.keys.pressed.L && bf.animation.name == "idle" && curBeat > 300){
        FlxG.camera.zoom = defaultCamZoom + 0.05;
    }
    if(drain == true){
        if(health >= 0.1){
            health -= 1.5 * elapsed;
        } else {
            focusonpaste = false;
        }
    }
    if(shk){
        shi = 1;
    } else {
        shi = FlxMath.lerp(shi,0, 1.5 * elapsed);
    }
    if(shi != 0){
        camGame.angle = FlxG.random.int(6,-6) *shi;
        camHUD.angle = (camGame.angle / 4) *shi;
    }   
    portal.angle += 18 *elapsed;
    if(( chn == false && curCameraTarget == 0) || focusonpaste){
        camFollow.setPosition(400,300);
    }
    if(!chn && FlxG.keys.justPressed.E){
        bgthing();

        trans();
    }

    strumLines.members[1].notes.forEachAlive(function(note:Note){
        if(note.extra.get("animPlayed") == false && note.strumRelativePos <= 950 * PlayState.instance.inst.pitch && note.extra.get("isHallow") == true){
            new FlxTimer().start(0.8, function(asd:FlxTimer){spawnfuck();});
            note.extra.set("animPlayed", true);
        }
    });
    if(FlxG.keys.justPressed.C){
        spawnfuck();
    }
    if(FlxG.keys.justPressed.ALT){
        player.cpu = true;
    }
    mupdate(elapsed);
}

function onNoteHit(e){
    if(e.note.extra.get("isHallow") == true){
        e.animCancelled = true;
        // boyfriend.debugMode = true;
        boyfriend.playAnim("fever dodge");
        // trace("CU");
    }
}

function spawnfuck(){
    // trace("cu");
    var fuck = new FunkinSprite();
    fuck.frames = Paths.getFrames("mechanicShit/paintingShit");
    add(fuck);
 
    fuck.x = boyfriend.x - 50;
    // fuck.y += 200;
    fuck.y -= 400;
    fuck.animation.addByPrefix("paintingShit", "paintingShit", 30, false);
    fuck.playAnim("paintingShit");
    FlxTween.tween(fuck, {y: fuck.y + 330}, 0.2, {startDelay:0.7, onComplete:function(){
        FlxTween.tween(fuck, {y: fuck.y - 330}, 0.2, {startDelay:0.2});
        FlxTween.tween(fuck, {x: fuck.x + 300}, 0.2, {startDelay:0.4});
    }});
    new FlxTimer().start(2, function(h:FlxTimer){
        fuck.destroy();
    });
}

function onNoteCreation(e){
    if(FlxG.random.bool(10) && e.strumLineID == 1 && e.note.sustainLength == 0 && !e.note.isSustainNote){
        e.note.extra.set("animPlayed", false);
        e.note.extra.set("isHallow", true);

        e.noteType = "hallow";
    }
}
function onPlayerMiss(e){
    if(e.note.extra.get("isHallow") == true){
        health = 0;
    }
}
var dodging = false;
var inmec = false;
var mecelap = 0;
var parried;
function triggerShit(){
    trace("i<3mustard.com");
    mecelap = 0;
    inmec = true;
}




var perfectpress = false;
function mupdate(elapsed){
    if(FlxG.keys.justPressed.SPACE){
        dodging = true;
        // bf.animation.finishCallback = function(A){
            // dodging = false;
        // }
        // perfectpress = true;
        // new FlxTimer().start(0.3, function(fd:FlxTimer){
        //     perfectpress = false;
        // });

        if(otherpaste.animation.curAnim.curFrame >= 10){
            bf.playAnim("fever parry", true);
            perfectpress = true;
        } else {
            bf.playAnim("fever dodge", true);

        }
    }
}
function mbeat(curBeat){
    if(inmec){
        switch(mecelap){
            case 0, 1, 2:
                if(mecelap == 0){
                    otherpaste.playAnim("smash");
                    otherpaste.animation.pause();
                }
                pastem.visible = false;
                otherpaste.visible = true;
                if(mecelap == 1) otherpaste.playAnim("smash");
                FlxG.sound.play(Paths.sound("alert"));
            case 3:
                if(!dodging && player.cpu == false){
                    gameOver();
                }
                if(perfectpress){
                    bf.visible = false;
                    feverparry.playAnim("parry", true);
                    feverparry.visible = true;
                    otherpaste.playAnim("parry", true);
                    perfectpress = false;
                    health += maxHealth / 4;
                    feverparry.animation.finishCallback = function(e){
                        feverparry.visible = false;
                        bf.visible = true;
                    }
                    FlxG.sound.play(Paths.sound("parry"));
                } else {
                    FlxG.sound.play(Paths.sound("smash"));

                }
            case 4:
                inmec = false;
                mecelap = 0;
                pastem.visible = true;
                otherpaste.visible = false;
                dodging = false;
        }
        mecelap++;
    }
}
