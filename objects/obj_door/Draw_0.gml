/// @desc draw self, the number of stars needed if necessary.
draw_self();

if (feathers > global.feathers)
{
	draw_set_font(fnt_speech)
	draw_text_ext_transformed_colour(x, y + 4, string(feathers), string_height(feathers), sprite_width, 0.6, 0.6, 0, c_red, c_red, c_red, c_red, 1);	
}