import flx3d.Flx3DView;

import away3d.entities.Mesh;
import away3d.primitives.CubeGeometry;
function postCreate(){
    cube = new Mesh();
 

    scene3D = new Flx3DView(0, 0, FlxG.width / 2  + 200, FlxG.height / 2); // This is what's creating the 3D world
    scene3D.scale.set(2,2);
    scene3D.x += 900;
    scene3D.y += 500;
    // scene3D.screenCenter();
    
    // add(scene3D); // The 3D View works just like any other sprite so it will have to be added like one
    insert(members.indexOf(boyfriend)-1, scene3D);
    scene3D.addChild(cube);
    
    scene3D.addModel(Paths.obj('Nyanses'), function(model){
        if(Std.string(model.asset.assetType) == 'mesh'){
            model.asset.scale(80);
            model.asset.y -= 0;
            model.asset.z = 0;
            cube = model.asset;
        }
    }, Paths.image("models/nyanses/y804000_01"), false);
    // cube.rotationX = 90;
}
var delt = 0;
function update(elapsed){
    delt +=elapsed*2;
    // cube. += 30 * elapsed;
    cube.rotationY += 300 * elapsed;
    // cube.rotationZ += 30 * elapsed;
    // cube.rotationX += 30 * elapsed;
    // cube.rotationX = -20;
    // cube.x -= 2;
    cube.x = 0 + 700 * Math.sin(delt);
    cube.y = 0 + 100 * Math.cos(delt* 5);

    // if(FlxG.keys.pressed.A){
    //     scene3D.camera.x += 300*elapsed;
    // }
    // if(FlxG.keys.pressed.D){
    //     scene3D.camera.x -= 300*elapsed;
    // }

}