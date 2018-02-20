/// @description Insert description here
// You can write your code in this editor
event_inherited();

if (string_length(TXT_Username.text) > 0 && string_length(TXT_Password.text) > 0) {
	var hashed_password = md5_string_unicode(TXT_Username.text + TXT_Password.text);
	
	var register_packet = buffer_create(1, buffer_grow, 1);
	buffer_write(register_packet, buffer_string, "register");
	buffer_write(register_packet, buffer_string, TXT_Username.text);
	buffer_write(register_packet, buffer_string, hashed_password);
	
	network_write(Network.socket, register_packet);
} else {
	show_message("Error: Username or password cannot be blank...");
}