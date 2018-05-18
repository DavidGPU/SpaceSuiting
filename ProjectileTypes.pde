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