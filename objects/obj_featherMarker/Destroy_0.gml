/// @description When destroys creates a feather object with this marker's index on it.
var _feather = instance_create_depth(x, y, depth, obj_feather);
var _index = index;

with (_feather)
{
	index = _index;
}