///set_missile_traits(missile_type)

switch(argument0) {
    case MISS.bullet:
        speed = 16;
        image_index = 0;
        force = 5;
        break;
    case MISS.grenade:
        speed = 12;
        gravity = 0.4;
        image_index = 1;
        explosion_radius = 32;
        force = 8;
        break;
    case MISS.rocket:
        speed = 4;
        gravity = 0.2;
        gravity_direction = direction;
        sprite_index = s_missile_rocket;
        image_speed = 0.4;
        explosion_radius = 48;
        force = 10;
        break;
    case MISS.blade:
        speed = 8;
        image_index = 2;
        spin = 20;
        force = 5;
        break;
    case MISS.laser:
        speed = 0;
        x_laser_start = x - lengthdir_x(8, direction);
        y_laser_start = y - lengthdir_y(8, direction);
        x_laser_end = x_laser_start;
        y_laser_end = y_laser_start;
        force = 5;
        break;
    case MISS.energy:
        speed = 8;
        image_index = 3;
        spin = 20;
        force = 15;
        break;
    case MISS.piercer:
        speed = 10;
        sprite_index = s_missile_piercer;
        image_speed = 1;
        force = 5;
        break;
}

