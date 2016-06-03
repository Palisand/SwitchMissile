/// player_jump

v_speed = -jump_speed;
jumps_remaining--;
// particles
emit_thrust_trail = true;
alarm[2] = emit_thrust_trail_delay;
// gamepad vibration
vibration_right_motor = 0.2;
vibration_left_motor = 0.2;
// sound
audio_sound_pitch(snd_jump, 1 + random_range(-0.2, 0.2));
audio_play_sound(snd_jump, 0, false);
