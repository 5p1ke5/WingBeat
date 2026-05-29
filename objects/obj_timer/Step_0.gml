/// @desc Decrements timer. If timer goes off, calls user event 0.
var _timerTriggered = timer_step();

if (_timerTriggered)
{
	event_user(0);
}