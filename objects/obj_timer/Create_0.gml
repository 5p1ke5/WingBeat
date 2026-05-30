/// @desc Timer should be initialized in creation code.
/* eg...
var _endFunction = function()
{
	instance_destroy(obj_player);
}

timer_initialize(game_get_speed(gamespeed_fps), _endFunction);
*/