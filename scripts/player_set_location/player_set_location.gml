var xx = argument0;
var yy = argument1;
var dir = argument2;

var pos_packet = buffer_create(1, buffer_grow, 1);
buffer_write(pos_packet, buffer_u8, POSITION);
buffer_write(pos_packet, buffer_u16, xx);
buffer_write(pos_packet, buffer_u16, yy);
buffer_write(pos_packet, buffer_u16, dir);

network_write(Client.socket, pos_packet);