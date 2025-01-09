var peeps:FunkinSprite;
var classic:FlxSprite;
var frenzy:FlxSprite;
function create(){
		if(FlxG.sound.music.playing == false){
			CoolUtil.playMenuSong(false);
			FlxG.sound.music.volume = 0.6;
		}
	FlxG.save.data.INSS = false;
	bg = new FunkinSprite().loadGraphic(Paths.image("f/freeplay/bg"));
	add(bg);
	peeps = new FunkinSprite();
	peeps.frames = Paths.getFrames("f/freeplay/peeps");
	add(peeps);
	peeps.scale.set(0.67,0.67);
	peeps.x = FlxG.width / 2 - (peeps.width / 2) - 14;
	peeps.y = 13;
	peeps.animation.addByPrefix("peep", "people", 24, false);

	chair = new FunkinSprite().loadGraphic(Paths.image("f/freeplay/chairs"));
	add(chair);
	// chair.scale.set(0.67,0.67);
	chair.x = 320;
	
	chair.y = peeps.y + 120;


	feva = new Character(742, -235, "bf-freeplay", true);
	add(feva);

	peppa = new Character(154, 291, "pepper-freeplay", false);
	add(peppa);
	
	table = new FlxSprite(257, 385).loadGraphic(Paths.image('f/freeplay/table'));
	add(table);

	hands = new FlxSprite(259, 16);
	hands.frames = Paths.getFrames("characters/pepper/hands", "shared");
	hands.animation.addByPrefix("idle", "pepper", 24, false);
	hands.animation.play('idle');
	hands.scale.set(0.67, 0.67);
	hands.antialiasing = true;
	add(hands);

	classic = new FlxSprite(609, 456);
	classic.frames = Paths.getFrames("f/freeplay/classicm");
	classic.animation.addByPrefix("n", "Classicn", 0);
	classic.animation.addByPrefix("s", "Classics", 0);
	classic.animation.play('n');
	classic.scale.set(0.67, 0.67);
	classic.antialiasing = true;
	add(classic);

	frenzy = new FlxSprite(374, 456);
	frenzy.frames = Paths.getFrames("f/freeplay/frenzym");
	frenzy.animation.addByPrefix("n", "Frenzyn", 0);
	frenzy.animation.addByPrefix("s", "Frenzys", 0);
	frenzy.animation.play('n');
	frenzy.scale.set(0.67, 0.67);
	frenzy.antialiasing = true;
	add(frenzy);

	for(eee in members){
		eee.antialiasing = true;
	}
}

function beatHit(){
	if(curBeat % 2 ==  0)peeps.playAnim("peep");
}
var sel:Bool = true;
var canInteract:Bool = true;
function update(){
	canInteract = !FlxG.save.data.INSS;
	if(canInteract == true){

		if(FlxG.keys.justPressed.A || FlxG.keys.justPressed.D){
			sel = !sel;
		}
		switch(sel){
			case false:
				classic.animation.play("s", false);
				frenzy.animation.play("n", false);
				
				FlxG.save.data.Fmenu = false;
			case true:
				classic.animation.play("n", false);
				frenzy.animation.play("s", false);
				FlxG.save.data.Fmenu = true;
			
		}
		if(controls.ACCEPT){
			openSubState(new ModSubState("FFreeplayMenu"));
			canInteract = false;
			FlxG.save.data.INSS = true; 
		}
		if(controls.BACK){
			FlxG.switchState(new MainMenuState());
		}
		if(controls.RESET){
			FlxG.switchState(new FreeplayState());
		}
	}
}