package sphis.hianod.events_packets;

class TimeDecreaseEventPacket extends EventPacket
{
	override public function new(time_starting_value:Int, time_left:Int)
	{
		super('time_decrease', {time_starting_value: time_starting_value, time_left: time_left});
	}
}
