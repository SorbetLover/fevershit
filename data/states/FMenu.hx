import funkin.editors.EditorPicker;

import funkin.menus.ModSwitchMenu;
var tunnelBG:FunkinSprite;
var train:FunkinSprite;
var tunnelBG2:FunkinSprite;

var options:FunkinSprite;
var freeplay:FunkinSprite;
var extra:FunkinSprite;

var trainHB:FlxSprite;
var optionsHB:FlxSprite;
var freeplayHB:FlxSprite;
var extraHB:FlxSprite;

import funkin.options.OptionsMenu;

var trainCame:Bool = false;

function create(){

		// if(FlxG.sound.music.playing == false){
			CoolUtil.playMenuSong(false);
			FlxG.sound.music.volume = 0.6;
		// }
		FlxG.mouse.visible = true;
		tunnelBG = new FlxSprite().loadGraphic(Paths.image("f/newMain/subway_bg_2"));
		add(tunnelBG);

		train = new FunkinSprite(220,90);
		train.scale.set(1.25,1.25);
		train.frames = Paths.getFrames("f/newMain/trainmenu");
		train.animation.addByPrefix('come', 'Train come', 24, false);
		train.animation.addByPrefix('nsel', 'Train notselected', 24, false);
		train.animation.addByPrefix('sel', 'Train selected', 24, false);
		train.addOffset("sel", 0, 31);
		train.addOffset("conf", 0, 12);
		train.animation.addByPrefix('conf', 'Train confirm', 24, false);
		train.playAnim("come");
		add(train);


		tunnelBG2 = new FlxSprite().loadGraphic(Paths.image("f/newMain/subway_bg"));
		add(tunnelBG2);


		options = new FunkinSprite(915, 560);
		options.frames = Paths.getFrames("f/newMain/options");

		options.animation.addByPrefix('conf', 'options confirm', 24, false);
		options.animation.addByPrefix('nsel', 'options notselected', 24, false);
		options.animation.addByPrefix('sel', 'options selected', 24, false);
		options.addOffset("nsel", 0, -34);

		options.playAnim("nsel");

		add(options);


		freeplay = new FunkinSprite(1110, 160);
		
		freeplay.frames = Paths.getFrames("f/newMain/freeplay");

		freeplay.animation.addByPrefix('conf', 'freeplay confirm', 24, false);
		freeplay.animation.addByPrefix('nsel', 'freeplay notselected', 24, false);
		freeplay.animation.addByPrefix('sel', 'freeplay selected', 24, false);
		// freeplay.addOffset("nsel", -256, -170);

		freeplay.playAnim("nsel");

		// freeplay.updateHitbox();
		freeplay.addOffset("sel", 255, 170);
		freeplay.addOffset("conf", 255, 170);

		add(freeplay);


		extras = new FunkinSprite(840,200);
		extras.frames = Paths.getFrames("f/newMain/extra");
		add(extras);

		extrastxt = new FunkinSprite(980,150);
		extrastxt.visible = false;
		extrastxt.scale.set(0.4,0.4);
		extrastxt.frames = Paths.getFrames("f/newMain/extratext");
		add(extrastxt);
		extrastxt.animation.addByPrefix('idle', 'extra text', 24, false);
		extrastxt.playAnim("idle");

		
		extras.animation.addByPrefix('conf', 'extras confirm', 24, false);
		extras.animation.addByPrefix('nsel', 'extras notselected', 24, false);
		extras.animation.addByPrefix('sel', 'extras selected', 24, false);
		extras.addOffset("sel", 258,257);

		


		extraHB = new FlxSprite(835,200).makeGraphic(160,200);
		add(extraHB);
		extraHB.visible = false;
		trainHB = new FlxSprite(425, 150).makeGraphic(350,400);
		add(trainHB);	
		// trainHB.alpha = 0.6;
		trainHB.visible = false;

		freeplayHB = new FlxSprite(1100, 155).makeGraphic(500,230);
		add(freeplayHB);	
		freeplayHB.visible = false;
		optionsHB = new FlxSprite(900, 550).makeGraphic(400,200);
		add(optionsHB);	
		optionsHB.visible = false;
		
		for(o in [tunnelBG, tunnelBG2, train, options, freeplay, extrastxt]){
			o.antialiasing = true;
			o.updateHitbox();
		}



}
var confirmed = false;

function update(){

	if(trainCame == false && train.animation.finished == true){
		trainCame = true;
	}
    if (FlxG.keys.justPressed.SEVEN) {
		persistentUpdate = false;
		persistentDraw = true;
		openSubState(new EditorPicker());
	}

	if (controls.SWITCHMOD) {
		openSubState(new ModSwitchMenu());
		persistentUpdate = false;
		persistentDraw = true;
	}

	if(controls.BACK){
		FlxG.switchState(new TitleState());
	}
	if(controls.RESET){
		FlxG.switchState(new MainMenuState());

	}
if(FlxG.onMobile == false){
	if(FlxG.mouse.overlaps(trainHB)){
		if(train.getAnimName() != "sel" && confirmed == false && trainCame == true){
			train.playAnim("sel", false);
			FlxG.sound.play(Paths.sound("menu/subway-interact"));

		}
		if(FlxG.mouse.justPressed){
			confirmed = true;
			train.playAnim("conf",false);
			new FlxTimer().start(1, function(u:FlxTimer){
				FlxG.switchState(new StoryMenuState());
			});
		}
	}
	else if(trainCame == true) {
		train.playAnim("nsel", false);

	}

	if(FlxG.mouse.overlaps(optionsHB)){
		if(options.getAnimName() != "sel" && confirmed == false){
			options.playAnim("sel", false);
		FlxG.sound.play(Paths.sound("menu/sewer-interact"));

		}
		if(FlxG.mouse.justPressed){
			confirmed = true;
			options.playAnim("conf",false);
			new FlxTimer().start(1, function(u:FlxTimer){
				FlxG.switchState(new OptionsMenu());
			});
		}
	}
	else {
		options.playAnim("nsel", false);
	}



	if(FlxG.mouse.overlaps(freeplayHB)){
		if(freeplay.getAnimName() != "sel" && confirmed == false){
			freeplay.playAnim("sel", false);
			FlxG.sound.play(Paths.sound("menu/general-interact"));

		}
		if(FlxG.mouse.justPressed){
			confirmed = true;
			freeplay.playAnim("conf",false);
			new FlxTimer().start(0.2, function(u:FlxTimer){
				FlxG.switchState(new FreeplayState());
			});
		}
	}
	else {
		freeplay.playAnim("nsel", false);
	}
	
	if(FlxG.mouse.overlaps(extraHB)){
		if(extras.getAnimName() != "sel" && confirmed == false){
			extras.playAnim("sel", false);
			extrastxt.playAnim("idle", false);
					extrastxt.visible = true;
			FlxG.sound.play(Paths.sound("menu/general-interact"));

		}
		if(FlxG.mouse.justPressed){
			confirmed = true;
			extras.playAnim("conf",false);
			new FlxTimer().start(1, function(u:FlxTimer){
			});
		}
	}
	else {
		extras.playAnim("nsel", false);
		extrastxt.visible = false;

	}
}
    if(FlxG.onMobile) for (touch in FlxG.inputs.touch.touches) {
		if(touch.justPressed){
			var point = new FlxPoint(touch.screenX, touch.screenY);
				if(trainHB.overlapsPoint(point)){
					FlxG.switchState(new StoryMenuState());			
				}
				if(optionsHB.overlapsPoint(point)){
						FlxG.switchState(new OptionsMenu());			
				}
				if(freeplayHB.overlapsPoint(point)){
					FlxG.switchState(new FreeplayState());
				}
				if(extraHB.overlapsPoint(point)){
					
				}
		
		}
	
}