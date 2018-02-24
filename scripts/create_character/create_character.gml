var name = argument0;

var newcharacter_packet = buffer_create(1, buffer_grow, 1);

buffer_write(newcharacter_packet, buffer_u8, NEWCHARACTER);
buffer_write(newcharacter_packet, buffer_string, name);

network_write(Client.socket, newcharacter_packet);