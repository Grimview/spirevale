/// @description Insert description here
// You can write your code in this editor
draw_circle(x, y, listen_distance, true);

draw_self();

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_transformed(x, y - 36, display, 0.5, 0.5, 0);
draw_set_halign(fa_left);
draw_set_valign(fa_top);