/// @description Insert description here
// You can write your code in this editor
if (show) {
	draw_rectangle(x - width / 2, y - height / 2, x + width / 2, y + height / 2, false);
	
	draw_set_colour(c_black);
	
	draw_text(x - width / 2 + 8, y - height / 2 + 8, "Woodcutting: " + string(Player.woodcutting) + "/" + string(Player.maxWoodcutting))
	
	draw_set_colour(c_white);
}