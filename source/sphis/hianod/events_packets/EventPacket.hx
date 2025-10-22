package sphis.hianod.events_packets;

using StringTools;

class EventPacket
{
	public var id:String;
	public var data:Dynamic;

	public function new(id:String, data:Dynamic)
	{
		this.id = id;
		this.data = data;
	}

	public function toString()
	{
		var event_packet = 'event_packet={id=' + id + ', data=' + data + '}';
		return event_packet.replace(' : ', '=');
	}
}
