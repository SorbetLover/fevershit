var shader2:CustomShader;
var multer:Float = 1;
var roter:Float = 0;
function create(){
    shader2 = new CustomShader("camDupe");
    shader2.renderScale = [multer, multer];
    FlxG.camera.addShader(shader2);
    // camHUD.addShader(shader2);

}
function postUpdate(){
    multer = FlxMath.lerp(multer, 1, 0.03);
    roter = FlxMath.lerp(roter, 0, 0.03);
    // strumLines.members[3].cpu = true;

    shader2.renderScale = [multer, multer];
    shader2.renderRot = roter;
}

var shit:Bool = false;
function beatHit(curBeat){
    if(curBeat % 4 == 0){
        switch(shit){
            case false:
                roter = -0.06;
                shit = true;

            case true:
                roter = 0.06;
                shit = false;
        }
}
    if(curBeat % 4 == 0){
        multer = 1.14;
    }
}