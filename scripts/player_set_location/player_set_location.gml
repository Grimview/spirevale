var xx = argument0;
var yy = argument1;
var dir = argument2;

var pos_packet = buffer_create(1, buffer_grow, 1);
buffer_write(pos_packet, buffer_string, "position");
buffer_write(pos_packet, buffer_s32, xx);
buffer_write(pos_packet, buffer_s32, yy);
buffer_write(pos_packet, buffer_s32, dir);

network_write(Network.socket, pos_packet);