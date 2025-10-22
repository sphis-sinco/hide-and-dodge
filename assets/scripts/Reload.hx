import flixel.FlxG;
import sphis.hianod.events_packets.EventPacket;
import sphis.hianod.scripts.Script;
import sphis.sclait.modding.PolymodHandler;

class Reload extends Script
{
	override public function new()
	{
		super('reload');
	}

	override function receiveEventPacket(event_pack:EventPacket)
	{
		super.receiveEventPacket(event_pack);

		if (event_pack.id == 'pre_update' && (FlxG.keys.justReleased.F4 || (FlxG.keys.pressed.SHIFT && FlxG.keys.justReleased.FOUR)))
			PolymodHandler.forceReloadAssets();
	}
}
