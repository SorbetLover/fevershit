function onNoteCreation(e){
    if(e.note.isSustainNote){
        if(e.note.prevNote.isSustainNote == false) e.note.prevNote.colorTransform.color = 0xFFFFFF;
        // e.note.noteAngle = 10;
    }
}
var jancu = 0;
var shit = 0;
function update(elapsed){
    jancu += elapsed;
    shit = 0 + 50 * Math.sin(jancu);
    // trace(shit);
    for(i in 0...strumLines.members[0].notes.length){
        strumLines.members[0].notes.members[i].noteAngle = shit / 10;
        strumLines.members[1].notes.members[i].noteAngle = shit / 10;
    }
    // trace(strumLines.members[0].notes.members[0]);
}