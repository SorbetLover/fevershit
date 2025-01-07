import flixel.text.FlxTextBorderStyle;
import flixel.addons.display.FlxBackdrop;
import funkin.backend.MusicBeatState;
import flixel.util.FlxAxes;
import funkin.backend.utils.DiscordUtil;

static var initialized:Bool = false;
var pressedEnter:Bool = false;
var transitioning:Bool = false;

var logoBl:FlxSprite;
var textGroup:FlxGroup;
var logoBl:FlxSprite;
var titleText:FlxSprite;
var tee:FlxSprite;
var curWacky:Array<String> = [];
var ngSpr:FlxSprite;

var steps = 0;
function create() {
	Conductor.changeBPM(120);
	if(!initialized)
		CoolUtil.playMenuSong(true);
	
	FlxG.mouse.visible = false;

	textGroup = new FlxGroup();

    bg = new FlxSprite().loadGraphic(Paths.image("f/title/bg"));
	add(bg);
	bg.x -= 30;

	tee = new FlxSprite();
	tee.frames = Paths.getFrames("f/title/tea");
	tee.animation.addByPrefix('tea',"tea", 24, false);
	add(tee);
		tee.animation.play("tea");

	fee = new FlxSprite();
	fee.frames = Paths.getFrames("f/title/fever");
	fee.animation.addByPrefix('fever',"fever standing", 24, false);
	add(fee);
		fee.animation.play("fever");



	logoBl = new FlxSprite(100,60).loadGraphic(Paths.image('f/title/logo'));
	add(logoBl);
	logoBl.visible = true;
	// logoBl.screenCenter(FlxAxes.X);
	logoBl.antialiasing = true;
    // logoBl.scale.set(0.6, 0.6);
    // logoBl.blend = 0;

	ugh = new FlxSprite().loadGraphic(Paths.image("f/title/front"));
	add(ugh);
	ugh.x = 535;
	ugh.y = 605;

	tee.scale.set(0.68,0.68);
	tee.x = 860;
	tee.y = 180;

	fee.scale.set(0.68,0.68);
	fee.x = 670;
	fee.y = 170;

	for(e in [bg, logoBl,fee,tee, ugh]){ e.visible = false; }
	titleText = new FlxSprite(100, 576);
	titleText.frames = Paths.getSparrowAtlas('menus/titlescreen/titleEnter');
	titleText.animation.addByPrefix('idle', "Press Enter to Begin", 24);
	titleText.animation.addByPrefix('press', "ENTER PRESSED", 24);
	titleText.antialiasing = true;
	titleText.animation.play('idle');
	titleText.updateHitbox();
	//add(titleText);


		ngSpr = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image('teamfever'));
		add(ngSpr);
		ngSpr.visible = false;
		ngSpr.setGraphicSize(Std.int(ngSpr.width * 0.9));
		ngSpr.updateHitbox();
		ngSpr.screenCenter();
		ngSpr.antialiasing = true;

		ngSpr.y += 150;


    var stupidArray:Array<String> = CoolUtil.coolTextFile(Paths.txt('introText'));
	if (stupidArray.contains('')) stupidArray.remove('');
	curWacky = stupidArray[FlxG.random.int(0, stupidArray.length-1)].split('--');

    if (initialized){
        skipIntro();
    }else{
        initialized = true;
    }
	// curWacky = FlxG.random.getObject(getIntroTextShit());


	add(textGroup);
	Conductor.changeBPM(120);

}
function stepHit(curStep) {
    steps = curStep;
} 

function update(elapsed:Float) {

	logoBl.scale.x = FlxMath.lerp(logoBl.scale.x, 1, 0.05);
	logoBl.scale.y = logoBl.scale.x; 

	if(FlxG.keys.justPressed.R){
		FlxG.switchState(new ModState("FTitle"));
	}
	if (controls.ACCEPT && !skippedIntro) skipIntro();
	else if (controls.ACCEPT && skippedIntro && !pressedEnter){
        if (Options.flashingMenu)
            FlxG.camera.flash(FlxColor.WHITE, 1);

		pressedEnter = transitioning = true;

        titleText.animation.play('press');
		CoolUtil.playMenuSFX(1);

        // FlxTween.tween(logoBl, {y: logoBl.y + 800}, 1, {ease: FlxEase.expoIn, startDelay: 0.5});
        // FlxTween.tween(titleText, {y: titleText.y + 800}, 1, {ease: FlxEase.expoIn, startDelay: 0.2});
		// for(e in [fee,tee,ugh,bg]){
        // 	FlxTween.tween(e, {y: e.y - 900}, 1, {ease: FlxEase.expoIn, startDelay: 0.2});
		// }

		new FlxTimer().start(1.5, function() {
			FlxG.switchState(new MainMenuState());
		});
	} else if (controls.ACCEPT && transitioning){
		FlxG.camera.stopFX();
		FlxG.switchState(new MainMenuState());
	}




}

function goToMainMenu() {
    FlxG.switchState(new MainMenuState());
}

function createCoolText(textArray:Array<String>) {
	for (i => text in textArray) {
		if (text == "" || text == null) continue;
        var money:Alphabet = new Alphabet(0, (i * 60) + 200, text, true, false);
        money.screenCenter(FlxAxes.X);
        textGroup.add(money);
	}
}

function addMoreText(text:String) {
    var coolText:Alphabet = new Alphabet(0, (textGroup.length * 60) + 200, text, true, false);
    coolText.screenCenter(FlxAxes.X);
    textGroup.add(coolText);
}

function deleteCoolText() {
	while (textGroup.members.length > 0) {
		textGroup.members[0].destroy();
		textGroup.remove(textGroup.members[0], true);
	}
}

function beatHit(curBeat:Int) {
	// FlxTween.tween(FlxG.camera, {zoom: 1.02}, 1, {ease: FlxEase.expoOut, type: FlxTween.BACKWARD});
	tee.animation.play("tea", true);
	fee.animation.play("fever");
	
	if(curBeat % 2 == 0){
	logoBl.scale.set(1.05,1.05);

	}	
	if(skippedIntro) return;
	switch (curBeat)
	{
        case 1:		createCoolText(['Friday Night', 'Fever Dev Team']);
        case 3:		addMoreText('presents');
        case 4:		deleteCoolText();
        case 5:		createCoolText(['In collaboration ','with']);
        case 6:		ngSpr.visible = true;
        case 7:		deleteCoolText(); ngSpr.visible = false;




				case 8 | 12 | 15 | 18 | 21 | 24:
					createCoolText([curWacky[0]]);
				case 10 | 13 | 16 | 19 | 22 | 25:
					addMoreText(curWacky[1]);
				case 11 | 14 | 17 | 20 | 23 | 26:
					var stupidArray:Array<String> = CoolUtil.coolTextFile(Paths.txt('introText'));
					if (stupidArray.contains('')) stupidArray.remove('');
					curWacky = stupidArray[FlxG.random.int(0, stupidArray.length-1)].split('--');
					deleteCoolText();
				case 28:
					deleteCoolText();
					createCoolText(['Friday']);
				case 29:
					addMoreText('Night');
				case 30:
					addMoreText('Fever');
				case 31:
					addMoreText("Frenzy");
				case 32:
					skipIntro();
        
	}

	
}


var skippedIntro:Bool = false;

function skipIntro() {
	if (!skippedIntro) {
		
	for(e in [bg, logoBl,fee,tee, ugh]){ e.visible = true; }
        FlxG.camera.flash(FlxColor.WHITE, 1);
        remove(textGroup);
        add(titleText);
        skippedIntro = true;
    }
}