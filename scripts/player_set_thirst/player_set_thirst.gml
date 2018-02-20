/// @function player_set_thirst(amount);
/// @description Increase or decrease the player's thirst
/// by a certain amount.
/// @arg amount The amount to change the player's thirst by.
var amount = argument0;

var thirst_packet = buffer_create(1, buffer_grow, 1);
buffer_write(thirst_packet, buffer_string, "thirst");
buffer_write(thirst_packet, buffer_s32, amount);

network_write(Network.socket, thirst_packet);