block1 = instance_create_depth(x, y, depth, BLOCK);
block2 = instance_create_depth(x, bbox_bottom - 6, depth, BLOCK);

with (block1)
{
	image_yscale = 0.1; 
	image_xscale = 0.25; 
}

with (block2)
{
	image_yscale = 0.1; 
	image_xscale = 0.25; 
}