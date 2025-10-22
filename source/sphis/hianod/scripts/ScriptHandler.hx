package sphis.hianod.scripts;

import sphis.hianod.events_packets.EventPacket;

class ScriptHandler
{
	public static var scripts:Array<Script> = [];

	public static function clearScripts()
	{
		scripts = [];
	}

	public static function loadScripts()
	{
		clearScripts();
	}

	public static function sendEventPacket(event_packet:EventPacket)
	{
		for (script in scripts)
			script.receiveEventPacket(event_packet);
	}
}
