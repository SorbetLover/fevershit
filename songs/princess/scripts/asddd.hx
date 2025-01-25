var bopTiming:Array<Array<Float>> = [
    // [curStep >=, curStep <, angle]
    [0, 128, 0.45],
    [128, 256, 1.35],
    [320, 384, 1.35],
    [384, 417, 0.45],
    [417, 449, 1.35],
    [480, 512, 0.45],
    [641, 768, 0.45],
    [832, 897, 1.35],
    [1024, 1152, 0.45],
    [1152, 1212, 1.35],
    [1221, 1281, 1.35],
    [1313, 1344, 1.35],
    [1376, 1408, 1.35],
    [1408, 1468, 0.45],
    [1473, 1500, 0.45],
    [1505, 1522, 0.45]
];
var angletarget = 0;
function update(){
        camHUD.angle = FlxMath.lerp(camHUD.angle, angletarget, 0.2);
}

function stepHit(curStep){
    switch (curStep)
    {
        case 112:
            defaultCamZoom += 0.0565;
        case 117:
            defaultCamZoom += 0.03;
        case 121:
            defaultCamZoom += 0.03;
        case 125:
            defaultCamZoom += 0.1;
        // case 1212:
        //     createText("ha", 0.67);
        // case 1214:
        //     createText("ha!", 0.75);
        // case 1536:
        //     for (i in st)
        //         i.visible = false;
        case 1568:
            for (i in [healthBar, healthBarBG, scoreTxt, iconP1, iconP2])
                i.visible = false;
    }
}
var ss = true;
function beatHit(curBeat){
    if(curBeat % 1 == 0 && !startingSong){
        angletarget = ss ? -1 : 1;
        ss = !ss;
    }
}