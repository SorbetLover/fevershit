var zooms(default, set):Float = 0.5;
var bigscreen = false;
var pdad;
var pbf;
var bf;

var defstage:Array = [];
var zardee:Array = [];
var volcano:Array = [];
var alley;
var boardwalk:Array = [];
var week1:Array = [];
var week5;
var school:Array = [];
var churche:Array = [];
var matt:Array = [];

var takigf:Character;
var chroma:CustomShader;
var cho(default, set):Bool = false;
function create(){
    bigscreen = (FlxG.width >= 1280);
    pdad = strumLines.members[0].characters[1];
    pbf = strumLines.members[1].characters[1];
    bf = boyfriend;
    remove(pdad);
    remove(pbf);
    remove(dad);
    remove(boyfriend);

            sky = new FlxSprite(-450, -355).loadGraphic(Paths.image('stages/roboStage/ROBO_BG_SKY'));
            bg = new FlxSprite(-450, -335).loadGraphic(Paths.image("stages/roboStage/ROBO_BG"));
            rail = new FlxSprite(-450 + 660, -355 + 413).loadGraphic(Paths.image('stages/roboStage/rail'));
            city = new FlxSprite(-450, -355).loadGraphic(Paths.image('stages/roboStage/ROBO_BG_CITY'));
            // overlay = new FlxSprite(-450, -355).loadGraphic(Paths.image('stages/roboStage/ROBO_BG_OVERLAY'));
            wires = new FlxSprite(-450, -355).loadGraphic(Paths.image('stages/roboStage/ROBO_BG_WIRES'));
            defstage = [sky, city,  rail, bg, wires];
            for(i in defstage){
                add(i);
                i.alpha = 0.00001;
                i.scale.set(1.85,1.85);
            }
            var zardybg:FlxSprite = new FlxSprite(164.4, 0 ).loadGraphic(Paths.image('stages/roboStage/zardy_bg'));
            zardybg.antialiasing = true;
            zardybg.scrollFactor.set(0.75, 0.3);

            var zardytown:FlxSprite = new FlxSprite(140.65, 1.1 ).loadGraphic(Paths.image('stages/roboStage/zardy_fevertown'));
            zardytown.antialiasing = true;
            zardytown.scrollFactor.set(0.6, 1);

            var zardyforeground:FlxSprite = new FlxSprite(161.65, 6.15 ).loadGraphic(Paths.image('stages/roboStage/zardy_foreground'));
            zardyforeground.antialiasing = true;
            zardyforeground.scrollFactor.set(1, 1);

            zardee = [zardybg, zardytown, zardyforeground];
            for(i in zardee){
                add(i);
                i.x -= 500;
                i.alpha = 0.00001;
            }
            var trickyBG:FlxSprite = new FlxSprite(-728, -230).loadGraphic(Paths.image('stages/roboStage/rockymountains'));
			trickyBG.antialiasing = true;
			trickyBG.scrollFactor.set(0.9, 0.9);
			trickyBG.scale.set(1.25, 1.25);

			var trickySky:FlxSprite = new FlxSprite(-728, -230).loadGraphic(Paths.image('stages/roboStage/rockysky'));
			trickySky.antialiasing = true;
			trickySky.scrollFactor.set(0.7, 0.7);
			trickySky.scale.set(1.25, 1.25);

            volcano = [trickySky, trickyBG];

            for(i in volcano){
                add(i);
                i.alpha = 0.00001;
                i.scale.set(1.25,1.25);
                i.x += 200;
            }
            

            alley = new FlxSprite(-728, -230).loadGraphic(Paths.image('stages/roboStage/alleyway'));
			alley.antialiasing = true;
			// alley.scrollFactor.set(0.9, 0.9);
			alley.scale.set(1.25, 1.25);
            add(alley);
            alley.y += 200;

			for (i in ["sky", "city", "water", "boardwalk"])
			{
				var spr = new FlxSprite(-300, -300).loadGraphic(Paths.image("stages/week4/" + i));
				spr.scale.set(1.4, 1.4);
				spr.antialiasing = true;
                boardwalk.push(spr);
                add(spr);
			}


			var bg:FlxSprite = new FlxSprite(-720, -450).loadGraphic(Paths.image("stages/w1city"), true, 2560, 1400);
			bg.animation.add('idle', [3], 0);
			bg.animation.play('idle');
			bg.scale.set(0.3, 0.3);
			bg.antialiasing = true;
			bg.scrollFactor.set(0.9, 0.9);

			var w1city = new FlxSprite(bg.x, bg.y).loadGraphic(Paths.image("stages/w1city"), true, 2560, 1400);
			w1city.animation.add('idle', [0, 1, 2], 0);
			w1city.animation.play('idle');
			w1city.scale.set(bg.scale.x, bg.scale.y);
			w1city.antialiasing = true;
			w1city.scrollFactor.set(0.9, 0.9);
			w1city.ID = 42069;

			var stageFront:FlxSprite = new FlxSprite(-730, 530).loadGraphic(Paths.image('stages/room/stagefront'));
			stageFront.setGraphicSize(Std.int(stageFront.width * 1.1));
			stageFront.updateHitbox();
			stageFront.antialiasing = true;
			stageFront.scrollFactor.set(0.9, 0.9);
			stageFront.active = false;

			var stageCurtains:FlxSprite = new FlxSprite(-500, -300).loadGraphic(Paths.image('stages/room/stagecurtains'));
			stageCurtains.setGraphicSize(Std.int(stageCurtains.width * 0.9));
			stageCurtains.updateHitbox();
			stageCurtains.antialiasing = true;
			stageCurtains.scrollFactor.set(0.9, 0.9);
			stageCurtains.active = false;

            for(i in [bg, w1city, stageFront, stageCurtains]){
                add(i);
                i.alpha = 0.00001;
                week1.push(i);
                i.y += 200;
                i.x += 100;
            }

            var wbg5 = new FlxSprite(-820, -400).loadGraphic(Paths.image("stages/week5/yukichi"));
            wbg5.antialiasing = true;
            add(wbg5);
            wbg5.alpha = 0.00001;
            week5 = wbg5;
            ////

            var bgSky = new FlxSprite(0, -200).loadGraphic(Paths.image('stages/weeb/weebSky'));
			bgSky.scrollFactor.set(0.9, 0.9);

			var repositionShit = -200;

			var bgSchool:FlxSprite = new FlxSprite(repositionShit, 0).loadGraphic(Paths.image('stages/weeb/weebSchool'));

			var bgStreet:FlxSprite = new FlxSprite(repositionShit).loadGraphic(Paths.image('stages/weeb/weebStreet'));

			var widShit = Std.int(bgSky.width * 6);

			bgSky.setGraphicSize(widShit);
			bgSchool.setGraphicSize(widShit);
			bgStreet.setGraphicSize(widShit);

			bgSky.updateHitbox();
			bgSchool.updateHitbox();
			bgStreet.updateHitbox();

			var bgFront:FlxSprite = new FlxSprite(repositionShit).loadGraphic(Paths.image('stages/weeb/weebfront'));

			var bgOverlay:FlxSprite = new FlxSprite(repositionShit).loadGraphic(Paths.image('stages/weeb/weeboverlay'));
			bgOverlay.scrollFactor.set(0.9, 0.9);

			bgFront.setGraphicSize(widShit);
			bgOverlay.setGraphicSize(widShit);

			bgFront.updateHitbox();
			bgOverlay.updateHitbox();
            school = [bgSky, bgSchool, bgStreet, bgFront, bgOverlay];
            for(i in school){
                add(i);
                i.alpha = 0.00001;
                i.scale.set(6.5,6.5);
                i.y += 100;

            }

            remove(bgOverlay);

            var church = new FlxSprite(-948, -779).loadGraphic(Paths.image('stages/week2/bg_taki'));
			church.antialiasing = true;
            add(church);
            church.x += 150;
            church.y += 150;
            
            takigf = new Character(300,100,"taki_gf", false);
            add(takigf);

            churche = [takigf, church];

            var mattbg:FlxSprite = new FlxSprite(-200, -230).loadGraphic(Paths.image('stages/roboStage/matt_bg'));
			mattbg.antialiasing = true;
			mattbg.scrollFactor.set(0.4, 0.4);
			mattbg.scale.set(1.05, 1.05);

			var mattfg:FlxSprite = new FlxSprite(mattbg.x, mattbg.y).loadGraphic(Paths.image('stages/roboStage/matt_foreground'));
			mattfg.antialiasing = true;
			mattfg.scrollFactor.set(0.9, 0.9);
			mattfg.scale.set(1.05, 1.05);

			var mattcrowd:FlxSprite = new FlxSprite(mattbg.x - 55, mattbg.y - 15);
			mattcrowd.frames = Paths.getSparrowAtlas('stages/roboStage/matt_crowd');
			mattcrowd.animation.addByPrefix('bop', 'robo crowd hehe', 24, false);
			mattcrowd.antialiasing = true;
			mattcrowd.scrollFactor.set(0.85, 0.85);

			var spotlight:FlxSprite = new FlxSprite(mattbg.x, mattbg.y).loadGraphic(Paths.image('stages/roboStage/matt_spotlight'));
			spotlight.antialiasing = true;
			spotlight.scrollFactor.set(0.73, 0.73);

            matt = [mattbg, mattcrowd, mattfg, spotlight];
            for(i in matt){
                add(i);
                i.y += 200;
            }
    add(dad);
    add(boyfriend);
    add(pdad);
    add(pbf);
    pdad.alpha = 0.00001;
    pbf.alpha = 0.00001;
    switchStage("default");
    add(bgOverlay);

    pdad.y += 500;
    pbf.y += 200;
    pbf.x += 300;

    chroma = new CustomShader("chromaticAberration");
    camGame.addShader(chroma);
    chroma.blueOff = [0,0];
    chroma.redOff = [0,0];
    chroma.greemOff = [0,0];
}
function postCreate() {
    camHUD.visible = false;
    defaultCamZoom = 0.5;
    camGame.zoom = defaultCamZoom;
    dad.cameraOffset = FlxPoint.get(300, 0);
    bf.cameraOffset = FlxPoint.get(-300, 0);
    // cho = true;
}   

function set_cho(cff){
    if(cff == true){
        chroma.redOff[0] = 0.0065;
        chroma.blueOff[0] = -0.0065;
    } else {
        chroma.redOff[0] = 0;
        chroma.blueOff[0] = 0;
        
    }
}
function switchStage(name:String = "default"){
    xablau();
    if(name != "default"){
        camHUD.visible = true;
    }
    switch(name){
        default: switchStage("default");
        case "default":
            dad.cameraOffset = FlxPoint.get(300,0);
            for(i in defstage){
                i.alpha = 1;
            }
            dad.x = 100;
            dad.y = 400;
            bf.y =  100;
            bf.x = 900;
            zooms = 0.5;
        case "zardy":
            for(i in zardee){
                i.alpha = 1;
            }
            zooms = 0.9;
            bf.cameraOffset = FlxPoint.get(bigscreen ? -700 : -500,100);
            dad.cameraOffset = FlxPoint.get(bigscreen ? 230 : 10, 200);
        case "tricky":
            for(i in volcano){
                i.alpha = 1;
            }
            zooms = 0.7;
            bf.cameraOffset = FlxPoint.get(bigscreen ? -600 : 0,100);
            dad.cameraOffset = FlxPoint.get(bigscreen ? 230 : 10,200);
        case "whitty":
            alley.alpha = 1;
            zooms = 0.7;
            bf.cameraOffset.x -= 200;
        case "boardwalk":
            for(i in boardwalk){
                i.alpha = 1;
            }
            zooms = 0.7;
        case "week1":
            for(i in week1){
                i.alpha = 1;
            }
            zooms = 0.9;
            dad.cameraOffset.x = 350;
            bf.cameraOffset.x = -500;
            bf.cameraOffset.y += 50;
        case "week5":
            week5.alpha = 1;
            zooms = 0.6;
        case "school":
            for(i in school){
                i.alpha = 1;
            }
            zooms = 0.9;
            // pdad.cameraOffset.y = -300;
            // pbf.cameraOffset.set(-300,-300);
        case "church":
            for(i in churche){
                i.alpha = 1;
            }
            zooms = 0.7;

        case "matt":
            for(i in matt){
                i.alpha = 1;
            }
            zooms = 1;
    }

}
function set_zooms(th){
    defaultCamZoom = th;
    FlxG.camera.zoom = th;
    trace("merda", th);
}
// var cuzinho(default,set):Int = 0;
// function set_cuzinho(){
//     trace("ai meu cur");
// }
var snapthing = null;
function xablau(){
    dad.alpha = 1;
    bf.alpha = 1;
    pdad.alpha = 0.001;
    pbf.alpha = 0.001;

    ///taki o tatu pra tu
    for(i in defstage){
        i.alpha = 0.00001;
    }
    for(i in zardee){
        i.alpha = 0.00001;
    }
    for(i in volcano){
        i.alpha = 0.00001;
    }
    alley.alpha = 0.00001;
    for(i in boardwalk){
        i.alpha = 0.00001;
    }
    for(i in week1){
        i.alpha = 0.00001;
    }
    week5.alpha = 0.00001;
    for(i in school){
        i.alpha = 0.0001;
    }
    for(i in churche){
        i.alpha = 0.0001;
    }

    for(i in matt){
        i.alpha = 0.0001;
    }
    dad.cameraOffset = FlxPoint.get(300, 0);
    dad.cameraOffset = FlxPoint.get(300, 0);
    dad.cameraOffset = FlxPoint.get(300, 0);
    dad.cameraOffset = FlxPoint.get(300, 0);
    dad.cameraOffset = FlxPoint.get(300, 0);
    dad.cameraOffset = FlxPoint.get(300, 0);
    dad.cameraOffset = FlxPoint.get(300, 0);

}  

function beatHit(){
    matt[1].animation.play("bop");
    if(curBeat >= 32){
        camHUD.visible = true;
    }
    switch(curBeat){
        case 32:
            switchStage("zardy");
            camHUD.visible = true;
        case 64:
            defaultCamZoom -= bigscreen ? 0 : 0.22;            
        case 88:
            defaultCamZoom += 0.3;
        case 92 | 104 | 123 | 464 | 470 | 472 | 475 | 488 | 491:
            defaultCamZoom += curBeat > 480 ? 0.05 : 0.085;
        case 96 | 463:
            switchStage("tricky");
        case 128:
            switchStage('whitty');
        case 144 | 288:
            switchStage('boardwalk');
        case 160 | 592:
            switchStage();
        case 224 | 560:
            switchStage('week1');
        case 256 | 432:
            switchStage('week5');
        case 320:
            switchStage("school");
            bf.alpha = 0.00001;
            dad.alpha = 0.00001;
            pbf.alpha = 1;
            pdad.alpha = 1;
            
        case 355 | 359 | 387 | 391:
        
            if (curBeat == 355 || curBeat == 359){
                cho = true;
                snapthing = false;
            } else {
                snapthing = true;
            }
        

        case 356 | 360 | 388 | 392:
            cho = false;
            snapthing = null;
            zooms = 0.5;
            FlxG.camera.focusOn(camFollow.getPosition());
        case 336: switchStage();
 
            remove(pbf);
            remove(pdad);
            // dad.cameraOffset = FlxPoint.get(300,0);
    dad.cameraOffset = FlxPoint.get(300, 0);
    dad.cameraOffset = FlxPoint.get(300, 0);
    dad.cameraOffset = FlxPoint.get(300, 0);
    dad.cameraOffset = FlxPoint.get(300, 0);
    dad.cameraOffset = FlxPoint.get(300, 0);
    dad.cameraOffset = FlxPoint.get(300, 0);
    dad.cameraOffset = FlxPoint.get(300, 0);
    dad.cameraOffset = FlxPoint.get(300, 0);
    dad.cameraOffset = FlxPoint.get(300, 0);
    dad.cameraOffset = FlxPoint.get(300, 0);
    dad.cameraOffset = FlxPoint.get(300, 0);
    dad.cameraOffset = FlxPoint.get(300, 0);
    dad.cameraOffset = FlxPoint.get(300, 0);

        case 400:
            switchStage("church");

        case 496:
            switchStage("matt");
    }
}

function postUpdate(){
    // inst.pause() ;
    // vocals.pause();

    // if(FlxG.keys.justPressed.E){
    //     var cu = FlxG.random.float(0.5,1.2);
    //     trace(cu);
    //     zooms = cu;
    // }

    if(snapthing){
        camFollow.setPosition(900,700);
        FlxG.camera.focusOn(camFollow.getPosition());
        FlxG.camera.zoom = 1.1;
    } else if(snapthing == false) {
        FlxG.camera.zoom = 1.1;
        camFollow.setPosition(400, 700);
        FlxG.camera.focusOn(camFollow.getPosition());

    }

}
