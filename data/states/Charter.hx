import funkin.backend.assets.ModsFolder;





function update(){

    if(FlxG.keys.justPressed.J){
        File.saveContent("mods/" + ModsFolder.currentModFolder + "/songs/" + PlayState.SONG.meta.name + "/bpm.txt", Conductor.bpm);
    }
}