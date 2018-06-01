// MOTHER PROJECTILE
abstract class Projectile extends GameObject {
  PVector gravity;

  Projectile(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox, PVector gravity) {
    super(position, velocity, orientation, scale, spriteName, hitbox);
    this.gravity = gravity;
  }



  void update() {
    velocity.add(gravity);
    super.update();
    for (Enemy e : enemies) {
      if (e.position.y > 400 ) {
      }
    }
  }

  void display() {
    pushMatrix();
    translate(position.x, position.y);    
    pushStyle();
    imageMode(CENTER);
    image(sprite, 0, 0);
    popStyle();

    popMatrix();
  }
}

// PLAYER PROJECTILE

class PlayerProjectile extends Projectile {
  int damage;
  boolean hit = false;

  PlayerProjectile(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox, PVector gravity, int damage) {
    super(position, velocity, orientation, scale, spriteName, hitbox, gravity);
    this.damage = damage;
  }

  void update() {
    for (Enemy e : enemies) {
      if (isCollidingWith(e)) {
        hit = true;
      }
    }
    for (Enemy vfr : bossEnemies1) {
      if (isCollidingWith(vfr)) {
        hit = true;
      }
    }
    for (Enemy vfr : bossEnemies2) {
      if (isCollidingWith(vfr)) {
        hit = true;
      }
    }
    super.update();
  }
}

// MOTHER ENEMY PROJECTILE

abstract class MotherEnemyProjectile extends Projectile {

  boolean hit = false;

  MotherEnemyProjectile(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox, PVector gravity) {
    super(position, velocity, orientation, scale, spriteName, hitbox, gravity);
  }

  void update() {
    for (Spaceship s : spaceships) {
      if (isCollidingWith(s)) {
        hit = true;
      }
    }

    super.update();
  }
}

// COMMON ENEMY PROJECTILE

class CommonEnemyProjectile extends MotherEnemyProjectile {

  CommonEnemyProjectile(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox, PVector gravity) {
    super(position, velocity, orientation, scale, spriteName, hitbox, gravity);
  }
}

// RANDOM ENEMY PROJECTILE
class RandomEnemyProjectile extends CommonEnemyProjectile {

  float changedVelocity;
  RandomEnemyProjectile(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox, PVector gravity, float changedVelocity) {
    super(position, velocity, orientation, scale, spriteName, hitbox, gravity);
    this.changedVelocity = changedVelocity;
  }
  
   void update() {
    float movementXChance = random(3);
    float movementYChance = random(3);
    super.update();
    if (movementXChance < 1 && position.x < width - 100)
      velocity.x = changedVelocity;
    if (movementXChance > 1 && movementXChance < 2 && position.x > 100)
      velocity.x = -changedVelocity;
    if (movementXChance > 2)
      velocity.x = 0;
    if (movementYChance < 1)
      velocity.y = changedVelocity;
    if (movementXChance < 1 && movementYChance > 2  && position.y > 100)
      velocity.y = -changedVelocity;
          if (movementYChance > 2)
      velocity.y = 0;

   } 
}
