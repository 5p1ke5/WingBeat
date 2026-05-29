var _clouds = 200;
for (var _i = 0; _i < _clouds; _i++) 
{
	var _cloud = instance_create_layer(irandom(room_width), irandom(room_height), "Clouds", obj_cloud);
	
	with (_cloud)
	{
		image_xscale = irandom_range(2, 4);
		image_yscale = irandom_range(1, 2);
		while (place_meeting(x, y, obj_cloud))
		{
			x = irandom(room_width);
			y = irandom(room_height);
		}
	}
}