#define handle_missile_collision
/// handle_missile_collision()
/* Destroy self and player on collision */

var player = collision_line(x, y, x + hspeed, y + vspeed, o_player, false, false);
var wall = collision_line(x, y, x + hspeed, y + vspeed, o_collision_wall, true, false);

if (player && player.number != owner_num) {
    has_collided = true;
    move_to_collider(player);
    missile_transfer_stats(player);
    with (player) {
        instance_destroy();
    }
    add_to_player_score(owner_num, 1);
    instance_destroy();
}
else if (wall) {
    has_collided = true;
    speed = 0;
    gravity = 0;
    move_to_collider(wall);
    instance_destroy();
}

#define handle_laser_collision
/// handle_laser_collision()

if (!collision_point(x_laser_end, y_laser_end, o_collision_wall, true, false) &&
    !collision_point(x_laser_end, y_laser_end, o_player, false, false)) {
    do {
        laser_dist_check++;
        x_laser_end = x + lengthdir_x(laser_dist_check, direction);
        y_laser_end = y + lengthdir_y(laser_dist_check, direction);
    } until (
        collision_point(x_laser_end, y_laser_end, o_collision_wall, true, false) ||
        collision_point(x_laser_end, y_laser_end, o_player, false, false) ||
        x_laser_end <= 0 || x_laser_end >= room_width ||
        y_laser_end <= 0 || y_laser_end >= room_height 
    );
    has_collided = true;
    
    var player = collision_point(x_laser_end, y_laser_end, o_player, false, false);
    if (player) {
        x = x_laser_end;
        y = y_laser_end;
        missile_transfer_stats(player);
        with (player) {
            instance_destroy();
        }
        add_to_player_score(owner_num, 1);
    }
    particle_burst(o_part_ctrl.type_missile_hit, 100, color, 360, x_laser_end, y_laser_end);
}

#define handle_blade_collision
/// handle_blade_collision()
/* Ricochet off walls and release particles while doing so */

var player = collision_line(x, y, x + hspeed, y + vspeed, o_player, false, false);
var wall = collision_line(x, y, x + hspeed, y + vspeed, o_collision_wall, true, false);

if (player && player.number != owner_num) {
    has_collided = true;
    move_to_collider(player);
    player.stuck = true;
    missile_transfer_stats(player);
    with (player) {
        instance_destroy();
    }
    add_to_player_score(owner_num, 1);
    instance_destroy();
}
else if (wall) {
    // set speeds to produce ricochet (will affect direction)
    if (collision_line(x, y, x + hspeed, y, wall, false, false)) {
        hspeed = -hspeed;
    }
    if (collision_line(x, y, x, y + vspeed, wall, false, false)) {
        vspeed = -vspeed;
    }
    // on ricochet:
    if (blade_ricochets < blade_ricochets_max) {
        blade_ricochets++;
        particle_burst(o_part_ctrl.type_missile_hit, 10, color, 360, x, y);
        particle_burst(o_part_ctrl.type_missile_hit, 10, color, direction, x, y);
        audio_sound_pitch(snd_blade_ricochet, 1 + random_range(-0.2, 0.2));
        audio_play_sound(snd_blade_ricochet, 0, false);
    }
    else {
        has_collided = true;
        speed = 0;
        instance_destroy();
    }
    move_to_collider(wall);
}

#define handle_piercer_collision
/// handle_piercer_collision()
/* Go through walls and players; destroyed only outside of room */

var player = collision_line(x, y, x + hspeed, y + vspeed, o_player, false, false);
var wall = collision_line(x, y, x + hspeed, y + vspeed, o_collision_wall, true, false);

if (player || wall) {
    audio_play_sound(snd_missile_pierce, 0, false);
}

if (player && player.number != owner_num) {
    missile_transfer_stats(player);
    with (player) {
        instance_destroy();
    }
    add_to_player_score(owner_num, 1);
}
else if (wall) {
    particle_burst(o_part_ctrl.type_missile_hit, 10, color, 360, x, y);
}
