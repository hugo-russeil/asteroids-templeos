#include "./graphicsHandling.HC"

class Keys{
    Bool up, down, left, right, space;
};

U0 HandleInput(Keys *keys){
    if (keys->space){
        ShootBullet;
    }
    if (keys->up){
        x += speed * Cos(angle);
        y += speed * Sin(angle);
    }
    if (keys->down){
        x -= speed * Cos(angle);
        y -= speed * Sin(angle);
    }
    if (keys->left){
        angle -= 0.1;
    }
    if (keys->right){
        angle += 0.1;
    }
}