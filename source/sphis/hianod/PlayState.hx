package sphis.hianod;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import sphis.hianod.events_packets.TimeDecreaseEventPacket;

class PlayState extends FlxState
{
	public var time_starting_value:Int = 60;
	public var time_left:Int = 0;

	public var environment_background:FlxSprite;
	public var environment_ground:FlxSprite;

	public var environment_rock_one:FlxSprite;
	public var environment_rock_two:FlxSprite;
	public var environment_rock_three:FlxSprite;

	public var player_character:FlxSprite;
	public var player_position_index:Int = 0;

	override public function create()
	{
		dispatchEvent('pre_create');
		super.create();

		time_left = time_starting_value;
		new FlxTimer().start(1, function(timer:FlxTimer)
		{
			time_left -= 1;
			dispatchEvent('time_decrease');

			if (time_left < 1)
				dispatchEvent('time_complete');
		}, time_starting_value);

		environment_background = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.GRAY);
		environment_ground = new FlxSprite().makeGraphic(FlxG.width, Std.int(FlxG.height / 4), FlxColor.WHITE);
		environment_rock_one = new FlxSprite().makeGraphic(160, 160, FlxColor.fromRGB(60, 60, 60));
		environment_rock_two = new FlxSprite().makeGraphic(160, 160, FlxColor.fromRGB(60, 60, 60));
		environment_rock_three = new FlxSprite().makeGraphic(160, 160, FlxColor.fromRGB(60, 60, 60));

		environment_background.screenCenter();

		environment_ground.screenCenter(X);
		environment_ground.y = FlxG.height - environment_ground.height;

		environment_rock_one.screenCenter();
		environment_rock_one.x -= environment_rock_one.width * 1.5;
		environment_rock_one.y += environment_rock_one.height / 4;

		environment_rock_two.screenCenter();
		environment_rock_two.y += environment_rock_two.height / 4;

		environment_rock_three.screenCenter();
		environment_rock_three.x += environment_rock_one.width * 1.5;
		environment_rock_three.y += environment_rock_three.height / 4;

		add(environment_background);
		add(environment_ground);
		add(environment_rock_one);
		add(environment_rock_two);
		add(environment_rock_three);

		player_character = new FlxSprite().makeGraphic(48, 48, FlxColor.RED);
		player_character.screenCenter();
		player_character.y += player_character.height * 2;
		add(player_character);

		dispatchEvent('post_create');
	}

	override public function update(elapsed:Float)
	{
		dispatchEvent('pre_update', {elapsed: elapsed});
		super.update(elapsed);
		dispatchEvent('post_update', {elapsed: elapsed});
	}

	public var null_events:Array<String> = [];

	public function dispatchEvent(event_id:String, ?optional_components:Dynamic)
	{
		if (null_events.contains(event_id))
			return;

		switch (event_id)
		{
			case 'time_decrease':
				var event_data = new TimeDecreaseEventPacket(this.time_starting_value, this.time_left);
				trace(event_data);

			default:
				trace('Could not dispatch event={id=' + event_id + ', optional_components=' + optional_components + '}');
				null_events.push(event_id);
		}
	}
}
