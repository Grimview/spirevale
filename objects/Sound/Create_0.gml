/// @description Insert description here
// You can write your code in this editor
emitter = audio_emitter_create();
audio_falloff_set_model(audio_falloff_exponent_distance);
audio_emitter_falloff(emitter, 64, 100, 1);

emitter2 = audio_emitter_create();
audio_emitter_falloff(emitter2, 64, 100, 1);

audio_play_sound_on(emitter, a_fx_stream, true, 10);
audio_play_sound_on(emitter2, a_fx_datastream, true, 5);