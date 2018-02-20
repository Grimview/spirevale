/// @description Insert description here
// You can write your code in this editor
draw_self();

if (focused) {
	draw_rectangle(x, y, x + (16 * image_xscale), y + (16 * image_yscale), 2);
}

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if (string_length(text) > 0 || focused) {
	draw_text_transformed(x, y, string(text), 0.9, 0.9, 0);
} else {
	draw_text_transformed(x, y, string(placeholder), 0.9, 0.9, 0);
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);