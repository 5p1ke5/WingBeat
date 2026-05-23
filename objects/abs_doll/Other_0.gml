/// @desc if outside the room dies.

if (y > room_height)
{
	y = 100;
}

if (y < 0)
{
	y = room_height - 100;
}

if (x > 0)
{
	x = 100;	
}

if (x < 0)
{
	x = room_width - 100;	
}