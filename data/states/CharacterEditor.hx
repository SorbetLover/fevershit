// var bfRef:Character;

// function create(){
//     bfRef = new Character(0,0,"bf-demon");
//     bfRef.setPosition(0,0);
// }
// function postCreate(){
//     bfRef.cameras = [charCamera];
//     insert(members.indexOf(character) - 1, bfRef );
//     bfRef.alpha = 0.3;
//     bfRef.debugMode = true;
//     bfRef.setPosition(character.x, character.y);
// }
// var uhh:FlxPoint = new FlxPoint(0,0);
// var lastAnim:String;
// function update(){
//     anima(character.getAnimName());
//     if(FlxG.keys.justPressed.SPACE){
//         lastAnim = "";
//         anima(character.getAnimName());
//     }

// }
// function anima(anim){
//     if(lastAnim != anim) 
//         bfRef.playAnim(anim);
//         lastAnim = anim;
// }