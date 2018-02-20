/// @description Insert description here
// You can write your code in this editor
if (focused) {
	if (keyboard_check_released(vk_enter)) {
		if (string_length(TXT_Username.text) > 0 && string_length(TXT_Password.text) > 0) {
			var hashed_password = md5_string_unicode(TXT_Username.text + TXT_Password.text);
	
			var login_packet = buffer_create(1, buffer_grow, 1);
			buffer_write(login_packet, buffer_string, "login");
			buffer_write(login_packet, buffer_string, TXT_Username.text);
			buffer_write(login_packet, buffer_string, hashed_password);
	
			network_write(Network.socket, login_packet);
		} else {
			show_message("Error: Username or password cannot be blank.");
		}
	}
}