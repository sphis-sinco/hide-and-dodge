package sphis.hianod.events_packets;

using StringTools;

class EventPacket
{
	public var id:String;
	public var components:Dynamic;

	public function new(id:String, components:Dynamic)
	{
		this.id = id;
		this.components = components;
	}

	public function toString()
	{
		var event_packet = 'event_packet={id=' + id + ', components=' + components + '}';
		return event_packet.replace(' : ', '=');
	}
}
