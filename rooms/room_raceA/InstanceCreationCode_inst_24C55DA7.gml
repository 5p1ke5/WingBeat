//When this zone is touched, destroys self and creates a 20 seconds timer.
//When the timer's duration is finished, if the feather has not been collected destoys the player object.
//Otherwise just makes the timer destroy itself.

var _function = function()
{
	var _timer = instance_create_depth(x, y, depth, obj_timerDraw);
	
	with (_timer)
	{
		var _raceEnd = function()
		{
			instance_destroy(obj_player);
		}
		
		timer_initialize(game_get_speed(gamespeed_fps) * 20, _raceEnd);	
	}
	
	instance_destroy();
}


zone_initialize(_function);