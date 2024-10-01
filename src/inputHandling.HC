#include "./graphicsHandling.HC"

class Keys{
    Bool up, down, left, right, space;
};

U0 HandleInput(Keys *keys){
    if (keys->space){
        ShootBullet;
    }
    if (keys->up){
        if (speed < 10.0)
        speed += 1.0;
    }
    if (keys->down){
        if (speed > -10.0)
        speed -= 1.0;
    }
    if (keys->left){
        angle -= 0.15;
    }
    if (keys->right){
        angle += 0.15;
    }
}