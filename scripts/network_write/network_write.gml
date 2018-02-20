/// arg socket
/// arg buffer of data to send
var packetSize = buffer_tell(argument1);
var bufPacket = buffer_create(1, buffer_grow, 1);

buffer_write(bufPacket, buffer_u8, packetSize + 1);
buffer_copy(argument1, 0, packetSize, bufPacket, 1);
buffer_seek(bufPacket, 0, packetSize + 1);

network_send_raw(argument0, bufPacket, buffer_tell(bufPacket));

buffer_delete(argument1);
buffer_delete(bufPacket);