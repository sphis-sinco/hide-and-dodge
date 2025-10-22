package sphis.hianod.scripts;

import sphis.hianod.events_packets.EventPacket;

class ScriptHandler
{
	public static var scripts:Array<Script> = [];

	public static function clearScripts() {}

	public static function loadScripts()
	{
		clearScripts();
	}

	public static function sendEventPacket(event_packet:EventPacket) {}
}
