package sphis.hianod;

import flixel.FlxState;
import flixel.util.FlxTimer;

class PlayState extends FlxState
{
	public var time_left:Int = 60;

	override public function create()
	{
		super.create();

		new FlxTimer().start(1, function(timer:FlxTimer)
		{
			time_left -= 1;
			dispatchEvent('time_decrease');
		}, time_left);
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

		trace('Dispatching event: ' + event_id);

		switch (event_id)
		{
			default:
				trace('Could not dispatch event: ' + event_id);
				null_events.push(event_id);
		}
	}
}
