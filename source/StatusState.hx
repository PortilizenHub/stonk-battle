package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;

class StatusState extends FlxState
{
	public static var msg:String = "Congrats! You've lost the stonk battle...";

	override public function create()
	{
		var mgs:FlxText = new FlxText(0, 0, 0, msg, 16);
		mgs.screenCenter();
		add(mgs);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		if (FlxG.keys.justPressed.ENTER)
			FlxG.switchState(new PlayState());

		super.update(elapsed);
	}
}
