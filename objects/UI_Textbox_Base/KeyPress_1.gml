/// @description Insert description here
// You can write your code in this editor
if (focused) {
	if (keyboard_key == vk_backspace) {
		text = string_copy(text, 1, string_length(text) - 1);
	} else {
		text += keyboard_string;
		keyboard_string = "";
	}
}