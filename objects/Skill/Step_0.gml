/// @description Insert description here
// You can write your code in this editor
if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), x - padding_left, y - padding_top, x + padding_right, y + padding_bottom + 8)) {
	if !(activated) {
		audio_play_sound(a_fx_hover, 10, false);
		activated = true;
	}
	
	if (x < x_position + x_offset) {
		x += x_offset / room_speed * 12;
	} else {
		x = x_position + x_offset;
	}
} else {
	if (activated) {
		audio_play_sound(a_fx_release, 10, false);
		activated = false;
	}
	
	if (x > x_position) {
		x -= x_offset / room_speed * 12;
	} else {
		x = x_position;
	}
}