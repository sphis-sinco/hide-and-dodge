package sphis.hianod;

import flixel.FlxG;
import flixel.FlxState;
import flixel.system.debug.console.ConsoleUtil;

class InitState extends FlxState
{
	override function create()
	{
		super.create();

		ConsoleUtil.registerObject('GameInfo', GameInfo);

		FlxG.switchState(() -> new PlayState());
	}
}
