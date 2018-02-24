/// @description Insert description here
// You can write your code in this editor
switch (async_load[? "type"]) {
	case network_type_data:
		buffer_copy(async_load[? "buffer"], 0, async_load[? "size"], savedBuffer, buffer_tell(savedBuffer));
		buffer_seek(savedBuffer, buffer_seek_relative, async_load[? "size"] + 1);
		
		while (true) {
			var size = buffer_peek(savedBuffer, reading, buffer_u8);
			
			if (buffer_get_size(savedBuffer) >= reading + size) {
				buffer_copy(savedBuffer, reading, size, cutbuffer, 0);
				buffer_seek(cutbuffer, 0, 1);
				
				handle_packet(cutbuffer);
				
				if (buffer_get_size(savedBuffer) != reading + size) {
					reading += size;
				} else {
					buffer_resize(savedBuffer, 1);
					reading = 0;
					break;
				}
			} else {
				break;
			}
		}
	break;
}