package sphis.hianod;

import flixel.FlxG;
import flixel.FlxState;
import flixel.system.debug.console.ConsoleUtil;
import sphis.hianod.scripts.ScriptHandler;
import sphis.sclait.modding.PolymodHandler;

class InitState extends FlxState
{
	override function create()
	{
		super.create();

		ConsoleUtil.registerObject('GameInfo', GameInfo);
		ConsoleUtil.registerObject('ScriptHandler', ScriptHandler);

		PolymodHandler.forceReloadAssets();

		FlxG.switchState(() -> new PlayState());
	}
}
