/// @function timer_initialize()
/// @description intializes variables for a timer.
/// @param _duration number of frames for the timer to count down. Positive = active, 0 = going off, -1 = inactive.
/// @param _time Starting time for the timer. Defaults to _duration.
/// @param _loop Should the timer loop. Defaults to false.
function timer_initialize(_duration, _endFunction = noone, _time = _duration, _loop = false)
{
	duration = _duration;
	time = _time;
	loop = _loop;
	endFunction = _endFunction;
}

/// @function timer_step(_decrement = 1)
/// @description decrements a timer during the step event. If end of timer is reached, calls endfunction and loops if flagged to do so, then returns true. Otherwise returns false.
function timer_step(_decrement = 1)
{
	if (time > 0)
	{
		time -= _decrement;	
	}
	
	if (time <= 0)
	{
		if (endFunction != noone) {endFunction();}
		timer_reset();
		return true;
	}
	
	return false;
}

/// @function timer_reset()
/// @description Resets the timer. Should usually go in Event 13
function timer_reset()
{
	if (loop)
	{
		time = duration;	
	}
}