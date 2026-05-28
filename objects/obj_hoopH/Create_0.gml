block1 = instance_create_depth(x, y, depth, BLOCK);
block2 = instance_create_depth(bbox_right - 6, y, depth, BLOCK);

with (block1)
{
	image_yscale = 0.25; 
	image_xscale = 0.1; 
}

with (block2)
{
	image_yscale = 0.25; 
	image_xscale = 0.1; 
}