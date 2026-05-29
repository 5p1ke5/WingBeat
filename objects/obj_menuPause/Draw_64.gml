// @description Displays text on how to display the game.
draw_set_halign(fa_center);
draw_set_font(fnt_default);

var _text = "PAUSE"
var _textX = window_get_width() / 2;
var _textY = window_get_height() / 16;
var _textHeight = string_height(_text) * 2;

var _featherX = window_get_width() / 2;
var _featherY = window_get_height() / 4;
var _featherHeight = sprite_get_height(spr_feather) * 2;


draw_text_ext_transformed(_textX, _textY, _text, _textHeight, room_width, 4, 4, 0);

draw_sprite_ext(spr_feather, 0, _featherX, _featherY, 2, 2, 0, c_white, 1);
draw_text_ext_transformed(_featherX, _featherY + _featherHeight, "Feathers - " + string(global.feathers),_textHeight, room_width/3, 2, 2, 0);