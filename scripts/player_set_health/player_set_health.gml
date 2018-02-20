var amount = argument0;

var health_packet = buffer_create(1, buffer_grow, 1);
buffer_write(health_packet, buffer_string, "health");
buffer_write(health_packet, buffer_s32, amount);

network_write(Network.socket, health_packet);