/// @desc draw self, the number of stars needed if necessary.
draw_self();

if (feathers > global.feathers)
{
	draw_text_ext_colour(x, y, string(feathers), string_height(feathers), sprite_width, c_red, c_red, c_red, c_red, 1);	
}