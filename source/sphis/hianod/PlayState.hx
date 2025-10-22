package sphis.hianod;

import flixel.FlxState;
import flixel.util.FlxTimer;

class PlayState extends FlxState
{
	public var time_starting_value:Int = 60;
	public var time_left:Int = 0;

	override public function create()
	{
		super.create();

		time_left = time_starting_value;
		new FlxTimer().start(1, function(timer:FlxTimer)
		{
			time_left -= 1;
			dispatchEvent('time_decrease');
		}, time_starting_value);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}

	public var null_events:Array<String> = [];

	public function dispatchEvent(event_id:String)
	{
		if (null_events.contains(event_id))
			return;

		switch (event_id)
		{
			case 'time_decrease':
				var event_data = {
					time_starting_value: this.time_starting_value,
					time_left: this.time_left
				};
				trace(event_data);

			default:
				trace('Could not dispatch event: ' + event_id);
				null_events.push(event_id);
		}
	}
}
