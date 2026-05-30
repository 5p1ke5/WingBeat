/// @desc If this was the last hoop in the room destroys the timer. Repleacs feathermarker with a feather if one exists.
event_inherited();

if (instance_number(obj_hoopH) == 1)
{
	instance_destroy(obj_timer);
	instance_destroy(obj_featherMarker);
}