/// @description Insert description here
// You can write your code in this editor
with (other) {
	instance_create_layer(x, y, "Instances", Woodbit);
	audio_play_sound(a_fx_chop, 5, false);
	
	player_set_exp("woodcutting", reward);
}

instance_destroy();