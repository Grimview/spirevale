/// @description Insert description here
// You can write your code in this editor
draw_rectangle(x, y, x + width, y + height, false);

draw_set_colour(c_black);
draw_rectangle(x, y, x + width, y + 24, true);

draw_text(x + width / 2, y + 12, string(npc));
draw_set_colour(c_white);

if (surface_exists(surface)) {	
	surface_set_target(surface);
	draw_clear_alpha(c_white, 0);
	
	draw_set_colour(c_black);
	
	var w = surface_get_width(surface);
	
	draw_text(x - w / 2, y, name);
	
	draw_text_ext(x  - w / 2, y + 24, description, 12, w - 24);
	
	var h = string_height_ext(description, 12, w - 24);
	
	draw_text(x - w / 2, y + 48 + h, "Quest Objectives");
	
	draw_set_colour(c_white);
	
	surface_reset_target();
	
	draw_surface(surface, x, y);
} else {
	surface = surface_create(width, height);
	
	surface_set_target(surface);
	draw_clear_alpha(c_white, 0);
	surface_reset_target();
}