/// @description Insert description here
// You can write your code in this editor
if (surface_exists(surface)) {	
	surface_set_target(surface);
	draw_clear_alpha(c_white, 0.35);
	
	var width = surface_get_width(surface);
	var height = surface_get_height(surface);
	
	draw_set_colour(c_black);
	draw_set_alpha(0.35);
	draw_rectangle(width - 24, 0, width, height, false);
	draw_set_alpha(1);
	
	draw_set_colour(c_white);
	
	draw_triangle(width - 12, 4, width - 4, 20, width - 20, 20, false);
	
	draw_rectangle(width - 20, 24, width - 4, height - 24, false);
	
	draw_triangle(width - 20, height - 20, width - 4, height - 20, width - 12, height - 4, false);
	
	draw_set_colour(c_black);
	
	var width = window_get_width() / 3;
	draw_text_ext(0, pos_y, "Hello, World! This is a test to see if clipping will work on surfaces!", 12, width);
	draw_set_colour(c_white);
	
	surface_reset_target();
	var height = window_get_height() - surface_get_height(surface) - 8;
	draw_surface(surface, 8, height);
} else {
	var width = window_get_width() / 3 + 24;
	
	surface = surface_create(width, 120);
	surface_set_target(surface);
	draw_clear_alpha(c_white, 0.35);
	surface_reset_target();
}