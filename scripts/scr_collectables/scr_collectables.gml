/// @function feather_initialize(_index)
/// @desc Initializes variables for a feather object. If the feather has already been collected destroys it. This should be called in creation code.
/// @param _index The index for the feather object to be at.
function feather_initialize(_index)
{
	index = _index;
	
	if (global.feathersFound[index])
	{
		instance_destroy();	
	}
}

///@function feather_collect()
///@desc Destroys the feather object, plays sfx, sets array position at feather index to true.
function feather_collect()
{
	audio_play_sound(sfx_feather, 1, false);
	global.feathersFound[index] = true;
	instance_destroy();
}