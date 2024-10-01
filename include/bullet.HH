#ifndef BULLET_HH
#define BULLET_HH

#include "./spaceship.HH"

class Bullet {
    I16 x;
    I16 y;
    U8 z;
    F64 angle;
    U8 speed;
    Bool active;
};

extern Bullet bullets[10];

U0 InitialiseBullets();
U0 ShootBullet();
U0 UpdateBullets();

#endif // BULLET_HH