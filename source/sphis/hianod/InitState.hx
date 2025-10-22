package sphis.hianod;

import flixel.FlxG;
import flixel.FlxState;
import flixel.system.debug.console.ConsoleUtil;
import sphis.hianod.scripts.ScriptHandler;

class InitState extends FlxState
{
	override function create()
	{
		super.create();

		ConsoleUtil.registerObject('GameInfo', GameInfo);
		ConsoleUtil.registerObject('ScriptHandler', ScriptHandler);

		ScriptHandler.loadScripts();

		FlxG.switchState(() -> new PlayState());
	}
}
