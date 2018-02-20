/// @description Insert description here
// You can write your code in this editor
event_inherited();

if (focused) {
	if (keyboard_key == vk_backspace) {
		display = string_copy(display, 1, string_length(display) - 1);
	} else {
		display += "*";
	}
}