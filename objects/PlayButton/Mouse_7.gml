/// @description Insert description here
// You can write your code in this editor
event_inherited();

if (instance_exists(Characters)) {
	with (Characters) {
		if (selected) {
			Client.name = Characters.character;

			room_goto(rm_map_home);
		}
	}
}