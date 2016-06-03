/// respawn_player(number)

var number = argument0;

// select a random spawn point
var spawn = instance_find(o_spawn_player, random(instance_number(o_spawn_player) - 1));
// create player
var player = instance_create(spawn.x, spawn.y, o_player);
player.number = number;
player.x_scale = iif(spawn.x < room_width/2, 1, -1);
player.pad_num = global.players[number, PLR.pad_num];
player.color = global.player_colors[global.players[number, PLR.color_index]];
// particles
particle_burst(o_part_ctrl.type_missile_hit, 100, player.color, 360, spawn.x, spawn.y);
