/// @description Insert description here
// You can write your code in this editor
var width, height;
width = sprite_get_width(sprite_index);
height = sprite_get_height(sprite_index);

if (point_in_rectangle(Player.x, Player.y, x - width, y - height, x + width, y + height)) {
	if (keyboard_check_released(vk_space)) {
		var quest_exists = instance_exists(Quest);
		
		if !(quest_exists) {
			instance_create_layer(x, y, "Instances", Quest);
		} else {
			with (Quest) {
				instance_destroy();
			}
		}
	}
}