/// @desc Draws time.
draw_set_font(fnt_default);
draw_set_halign(fa_center);

draw_text_transformed_colour(window_get_width()/2, window_get_height()/10, "Time: " + string(time), 2, 2, 0, c_white, c_white, c_white, c_white, 1);