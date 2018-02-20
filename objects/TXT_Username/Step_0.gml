/// @description Insert description here
// You can write your code in this editor
event_inherited();

if (focused) {
	if (keyboard_check_released(vk_tab)) {
		TXT_Password.focused = true;
		focused = false;
	}
}