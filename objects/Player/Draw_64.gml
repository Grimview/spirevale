/// @description Insert description here
// You can write your code in this editor
draw_set_alpha(0.35);
draw_rectangle(8, 8, 136, 32, false);
draw_rectangle(8, 36, 136, 60, false);
draw_rectangle(8, 64, 136, 88, false);

draw_set_colour(c_green);
draw_set_alpha(0.65);

var wb = (wellbeing / maxWellbeing) * 100;
draw_healthbar(12, 12, 132, 28, wb, c_white, c_red, c_green, 0, false, false);

var th = (thirst / maxThirst) * 100;
draw_healthbar(12, 40, 132, 56, th, c_white, c_red, c_blue, 0, false, false);

var hu = (hunger / maxHunger) * 100;
draw_healthbar(12, 68, 132, 84, hu, c_white, c_red, c_yellow, 0, false, false);

draw_set_alpha(1);
draw_set_colour(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(72, 20, string(wellbeing));

draw_text(72, 48, string(thirst));

draw_text(72, 76, string(hunger));

draw_set_halign(fa_left);
draw_set_valign(fa_top);

if (current_action == action.drink) {
	draw_text(window_get_width() / 2, window_get_height() / 2, "Press E to drink");
}