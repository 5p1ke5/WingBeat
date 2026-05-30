/// @desc If this was the last hoop in the room destroys the timer.
event_inherited();
show_debug_message(instance_number(obj_hoopH))

if (instance_number(obj_hoopH) == 1)
{
	instance_destroy(obj_timer);	
}