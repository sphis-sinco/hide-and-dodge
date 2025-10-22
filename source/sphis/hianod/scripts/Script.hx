package sphis.hianod.scripts;

import sphis.hianod.events_packets.EventPacket;

class Script
{
	public var id:String;

	public function new(id:String)
	{
		this.id = id;
	}

	public function receiveEventPacket(event_pack:EventPacket) {}
}
