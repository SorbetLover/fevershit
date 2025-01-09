
class MenuSprite extends FunkinSprite
{
	override public function new(x:Float, y:Float, bruh:String, anim:String)
	{
		super(x,y);
		new FunkinSprite();

		this.frames = Paths.getFrames(bruh);
		
	
	}
}