/// @function player_set_exp(skill, amount);
/// @description Increase or decrease the player's thirst
/// by a certain amount.
/// @arg amount The amount to change the player's thirst by.
var skill = argument0;
var amount = argument1;

var exp_packet = buffer_create(1, buffer_grow, 1);
buffer_write(exp_packet, buffer_string, "exp");
buffer_write(exp_packet, buffer_string, skill);
buffer_write(exp_packet, buffer_s32, amount);

network_write(Network.socket, exp_packet);