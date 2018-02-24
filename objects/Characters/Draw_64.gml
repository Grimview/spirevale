draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(window_get_width() / 2, window_get_height() / 2, name);

draw_set_halign(fa_left);
draw_set_valign(fa_top);

if (instance_exists(buttonPlay)) {
	draw_sprite_ext(sprHeroDown, 0, window_get_width() / 2, window_get_height() / 2 - 48, 4, 4, image_angle, image_blend, image_alpha);
}