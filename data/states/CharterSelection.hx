import funkin.editors.EditorPicker;
import funkin.editors.ui.UISubstateWindow;


function update(){
	if (FlxG.keys.justPressed.SEVEN) {
		persistentUpdate = false;
		persistentDraw = true;
		openSubState(new EditorPicker());
	}
	if(FlxG.keys.justPressed.TWO){
		openSubState(new UISubstateWindow(true, "SongImport"));
	}
}

