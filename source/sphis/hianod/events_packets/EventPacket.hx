package sphis.hianod.events_packets;

using StringTools;

class EventPacket
{
	public var id:String;
	public var components:Dynamic = {};
	public var component_count(get, never):Int;

	function get_component_count():Int
		return Reflect.fields(components).length;

	public function new(id:String, components:Dynamic)
	{
		this.id = id;
		this.components = components;
	}

	public function toString()
	{
		var event_packet = 'event_packet={id=' + id + ', component_count=' + component_count + ', components=' + components + '}';
		return event_packet.replace(' : ', '=');
	}
}
