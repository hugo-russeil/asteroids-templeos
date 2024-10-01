#ifndef ASTEROID_HH
#define ASTEROID_HH

class Asteroid {
    I16 x;
    I16 y;
    U8 z;
    F64 angle;
    F64 displayAngle;
    U8 speed;
    Bool active;
    U8 size;
};

extern Asteroid asteroids[20];

U0 InitialiseAsteroids();
U0 ActivateAsteroid();
U0 SplitAsteroid(U8 index);
U0 hasBeenShot(U8 index);
U0 UpdateAsteroids();

#endif // ASTEROID_HH