var character_packet = buffer_create(1, buffer_grow, 1);

buffer_write(character_packet, buffer_u8, CHARACTER);

network_write(Client.socket, character_packet);