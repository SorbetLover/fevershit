var tunnelBG:FlxSprite;
var train:FlxSprite;
var tunnelBG2:FlxSprite;
function create(){
		tunnelBG = new FlxSprite().loadGraphic(Paths.image("f/newMain/subway_bg_2"));
		add(tunnelBG);

		train = new FlxSprite(250,150);
		train.scale.set(1.32,1.32);
		train.frames = Paths.getFrames("f/newMain/trainmenu");
		add(train);
		// train.screenCenter();
		train.animation.addByPrefix('come', 'Train come', 24, false);
		train.animation.addByPrefix('nsel', 'Train notselected', 24, false);
		train.animation.addByPrefix('sel', 'Train selected', 24, false);
		train.animation.play("come");

		tunnelBG2 = new FlxSprite().loadGraphic(Paths.image("f/newMain/subway_bg"));
		add(tunnelBG2);

}

function update(){
	if(controls.BACK){
		FlxG.switchState(new TitleState());
	}
	if(controls.RESET){
		FlxG.switchState(new MainMenuState());

	}
}