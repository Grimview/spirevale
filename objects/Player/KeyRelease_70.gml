/// @description Function key logic.
// You can write your code in this editor
switch (current_action) {
	case action.drink:
		player_set_thirst(5);
		audio_play_sound(a_fx_slurp, 10, false);
	break;
}