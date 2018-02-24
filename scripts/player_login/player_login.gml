/// @description player_login(email, password);
/// @function player_login
/// @argument email
/// @argument password
var email = argument0;
var password = argument1;

if (string_length(email) > 0 && string_length(password) > 0) {
	var hashed_password = md5_string_unicode(email + password);
	
	instance_create_layer(x, y, "Instances", Client);

	var login_packet = buffer_create(1, buffer_grow, 1);

	buffer_write(login_packet, buffer_u8, LOGIN);
	buffer_write(login_packet, buffer_string, email);
	buffer_write(login_packet, buffer_string, hashed_password);

	network_write(Client.socket, login_packet);
} else {
	// Show notification that email or password can not be blank.
}