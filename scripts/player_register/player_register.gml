/// @description player_register(firstName, lastName, month, day, year, email, password);
/// @function player_register
/// @arg firstName
/// @arg lastName
/// @arg month
/// @arg day
/// @arg year
/// @arg email
/// @arg password
var firstName = argument0;
var lastName = argument1;
var month = argument2;
var day = argument3;
var year = argument4;
var email = argument5;
var password = argument6;

if (string_length(email) > 0 && string_length(password) > 0) {
	var hashed_password = md5_string_unicode(email + password);
	
	var register_packet = buffer_create(1, buffer_grow, 1);

	buffer_write(register_packet, buffer_u8, REGISTER);
	buffer_write(register_packet, buffer_string, firstName);
	buffer_write(register_packet, buffer_string, lastName);
	buffer_write(register_packet, buffer_string, month);
	buffer_write(register_packet, buffer_string, day);
	buffer_write(register_packet, buffer_string, year);
	buffer_write(register_packet, buffer_string, email);
	buffer_write(register_packet, buffer_string, hashed_password);
	
	network_write(Client.socket, register_packet);
} else {
	// Show notification that email or password can not be blank.
}