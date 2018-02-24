var spawn_packet = buffer_create(1, buffer_grow, 1);

buffer_write(spawn_packet, buffer_u8, SPAWN);
buffer_write(spawn_packet, buffer_string, Client.name);

network_write(Client.socket, spawn_packet);