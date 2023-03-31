package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	public var green:FlxText;
	public var ren:FlxText;

	public var gren:Int = 500;
	public var red:Int = 500;

	public var frame:Int = 0;
	public var frameMAX:Int = 20;

	override public function create()
	{
		green = new FlxText(20, 20, 0, Std.string(gren), 32);
		green.color = 0x00ff00;
		add(green);

		ren = new FlxText(FlxG.width - 100, 20, 0, Std.string(red), 32);
		ren.color = 0xff0000;
		add(ren);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		green.text = Std.string(gren);
		ren.text = Std.string(red);

		if (FlxG.keys.justReleased.SPACE)
		{
			gren += 10;
			red -= 10;
		}

		frame++;

		if (frame > frameMAX)
		{
			frame = 0;

			red += 10;
			gren -= 10;
		}

		if (gren > 990 && red < 10 || gren < 10 && red > 990)
		{
			StatusState.msg = "Congrats! You've lost the stonk battle...";

			if (gren > 990 && red < 10)
				StatusState.msg = "Congrats! You've WON the stonk battle!";

			FlxG.switchState(new StatusState());
		}

		super.update(elapsed);
	}
}
