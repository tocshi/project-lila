event_inherited();

target = noone;
dest_x = x;
dest_y = y;
aggrorange = 512;
aggrorange_orig = 512;
movedir = 0;
num_atks = irandom_range(2, 4);
cur_atk = 0;
is_burrowed = true;
image_alpha = 0;
shoot_dir = 0;
has_attacked = false;
tick = 0;
start_moving_tick = 0;
is_unburrowing = false;

ACQUIRE_TARGET_TIME = 100;
BASE_BURROW_TIME = 30;
BURROW_TIME = 10;
MAX_BURROW_TICKS = 200;
MOVING_SPREAD = 10;
STILL_SPREAD = 5;

