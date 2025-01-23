import funkin.backend.shaders.WiggleEffect.WiggleEffectType;
import funkin.backend.shaders.WiggleEffect;
import openfl.filters.ShaderFilter;

var wiggleEffect:WiggleEffect;
function postCreate(){
    wiggleEffect = new WiggleEffect();
	wiggleEffect.effectType = WiggleEffectType.WAVY;
	wiggleEffect.waveAmplitude = 0.05;
	wiggleEffect.waveFrequency = 3;
	wiggleEffect.waveSpeed = 1;
    stage.getSprite("week2bghallowpainting").shader = wiggleEffect.shader;

    boyfriend.gameOverCharacter = "hallow-death";
    gameOverSong = "gameOverHallow";
    retrySFX = "gameOver-EndHallow";
    lossSFX = "deaths/general";
    GameOverSubstate.script = "data/scripts/GH";
}
function onNoteHit(e){
    if(e.noteType == "hallow"){
        e.animCancelled = true;
        // boyfriend.debugMode = true;
        boyfriend.playAnim("fever dodge");
        // trace("CU");
    }
}
// function onNoteCreation(e){
//     if(e.note.strumRelativePos <= 750 * PlayState.instance.inst.pitch && e.noteType == "hallow"){
//         spawnfuck();
//         trace("CU");
//     }

// }

function onNoteCreation(e){
    if(e.noteType == "hallow"){
        e.note.extra.set("animPlayed", false);
    }
}
function update(elapsed){
    wiggleEffect.update(elapsed);
    strumLines.members[1].notes.forEachAlive(function(note:Note){
        if(note.extra.get("animPlayed") == false && note.strumRelativePos <= 950 * PlayState.instance.inst.pitch && note.noteType == "hallow"){
            new FlxTimer().start(0.8, function(asd:FlxTimer){spawnfuck();});
            note.extra.set("animPlayed", true);
        }
    });
}
function onPlayerMiss(e){
    if(e.noteType == "hallow"){
        health = 0;
    }
}
function spawnfuck(){
    var fuck = new FunkinSprite();
    fuck.frames = Paths.getFrames("mechanicShit/paintingShit");
    add(fuck);
    fuck.x = boyfriend.x - 50;
    // fuck.y += 200;
    fuck.animation.addByPrefix("paintingShit", "paintingShit", 30, false);
    fuck.playAnim("paintingShit");

    new FlxTimer().start(2, function(h:FlxTimer){
        fuck.destroy();
    });
}