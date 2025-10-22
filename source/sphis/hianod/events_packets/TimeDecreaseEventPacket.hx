package sphis.hianod.events_packets;

class TimeDecreaseEventPacket extends EventPacket
{
	public var time_starting_value:Int = 0;
	public var time_left:Int = 0;

	override public function new(time_starting_value:Int, time_left:Int)
	{
		this.time_starting_value = time_starting_value;
		this.time_left = time_left;

		super('time_decrease', {time_starting_value: this.time_starting_value, time_left: this.time_left});
	}
}
