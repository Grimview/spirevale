/// @description Insert description here
// You can write your code in this editor
if (hover) {
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_gray, 1);
} else {
	draw_self();
}

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text_transformed(x, y, string(text), 0.5, 0.5, 0);

draw_set_halign(fa_left);
draw_set_valign(fa_top);