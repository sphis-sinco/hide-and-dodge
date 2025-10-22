package sphis.hianod.events_packets;

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
		return 'event_packet={id=' + id + ', data=' + data + '}';
	}
}
