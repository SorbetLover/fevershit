function beatHit(curBeat){
	if(PlayState.instance.curSong == "star-baby") switch (curBeat)
					{
						case 128:
							defaultCamZoom += 0.17;
							FlxTween.color(spooky, 0.45, FlxColor.WHITE, FlxColor.fromString("#828282"));
							FlxTween.color(gf, 0.45, FlxColor.WHITE, FlxColor.fromString("#828282"));
							// useDirectionalCamera = true;
								if(dad.curCharacter != "frazz/veigar"){dad.cameraOffset = FlxPoint.weak(100,200);} else { dad.cameraOffset = FlxPoint.weak(0,30);}
						case 192:
							defaultCamZoom -= 0.17;
							FlxTween.color(spooky, 0.45, FlxColor.fromString("#828282"), FlxColor.WHITE);
							FlxTween.color(gf, 0.45, FlxColor.fromString("#828282"), FlxColor.WHITE);
							// useDirectionalCamera = false;
							
								if(dad.curCharacter != "frazz/veigar"){dad.cameraOffset = FlxPoint.weak(100,100);} else { dad.cameraOffset = FlxPoint.weak(100,10);}
						default:
							if (curBeat % 2 == 0 && curBeat > 128 && curBeat < 192)
							{
								FlxG.camera.zoom += 0.015;
								camHUD.zoom += 0.03;
							}
					}

	if(PlayState.instance.curSong == "last-meow"){
		if(curStep >= 0 && curStep < 126 || curStep >= 1102 && curStep < 1150 || curStep >= 1214 && curStep < 1246){
			defaultCamZoom = 0.61;
			defaultHudZoom = 1;
		}
		if (curStep >= 126 && curStep < 632 || curStep >= 734 && curStep < 766 || curStep >= 798 && curStep < 830 || curStep >= 862 && curStep < 894 || curStep >= 926 && curStep < 958 || curStep >= 990 && curStep < 1102 || curStep >= 1150 && curStep < 1198 || curStep >= 1246 && curStep < 1278 || curStep >= 1374 && curStep < 1406 || curStep >= 1438 && curStep < 1470){
			defaultCamZoom = 0.62;
			defaultHudZoom = 1.01;
		}

		if(curStep >= 638 && curStep < 734 || curStep >= 1278 && curStep < 1374){
			defaultCamZoom = 0.6350;
			defaultHudZoom = 1.02;
		}

	}
}

function update(){
	currentBeat = (songPos / 1000)*(Conductor.bpm/15);
	var dd = 0;
	if(PlayState.instance.curSong == "last-meow"){
		for(i in strumLines.members[0].members){
			dd++;
			i.x = (i.x+5 * Math.sin((currentBeat + dd*10) * 3.14159));
			i.y = (i.y+2 * Math.sin((currentBeat + dd*15) * 3.14159));
		}
		dd = 0;
	}
}

function postCreate(){
	if(dad.curCharacter == "frazz/veigar"){
		strumLines.members[0].characters[0].x += 500;
		strumLines.members[0].characters[0].y += 600;
		dad.scale.set(1.2,1.2);
		dad.cameraOffset = FlxPoint.weak(100,10);
	}
}