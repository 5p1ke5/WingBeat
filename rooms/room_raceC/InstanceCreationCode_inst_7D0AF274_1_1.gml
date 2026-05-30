//If the player finishes the race in time destroys self

var _function = function()
{
	instance_destroy(obj_timerDraw);
	instance_destroy();
}


zone_initialize(_function);