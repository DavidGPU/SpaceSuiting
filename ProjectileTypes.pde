
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

// RANDOM PLAYER PROJECTILE
class RandomPlayerProjectile extends PlayerProjectile {
  long timeToEnd;

  float changedVelocity;
  RandomPlayerProjectile(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox, PVector gravity, int damage) {
    super(position, velocity, orientation, scale, spriteName, hitbox, gravity, damage);
  }

  void update() {
    float movementXChance = random(10);
    float movementYChance = random(10);
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
    if (millis() - timeToEnd >= 1000)
      hit = true;
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

// HIVE ENEMY PROJECTILE

class HiveEnemyProjectile extends CommonEnemyProjectile {
  long lastSpawnPlus;
  int bulletSpawnPlus;
  long lastSpawnX;
  int bulletSpawnX;
  float speedPlus;
  float speedX;

  HiveEnemyProjectile(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox, PVector gravity, int bulletSpawnPlus, int bulletSpawnX, float speedPlus, float speedX) {
    super(position, velocity, orientation, scale, spriteName, hitbox, gravity);
    this.bulletSpawnPlus = bulletSpawnPlus;
    this.bulletSpawnX = bulletSpawnX;
    this.speedPlus = speedPlus;
    this.speedX = speedX;
  }

  void update() {
    super.update();
    if (millis() - lastSpawnPlus > bulletSpawnPlus)
      shootPlus();
    if (millis() - lastSpawnX > bulletSpawnX)
      shootX();
  }
  void shootPlus() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y += 20;
    bulletPosition.x += 0;
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, speedPlus), 0, 2, "ep_littlegrey.png", new BoundingBox(new PVector(0, 0), new PVector(10, 10)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, -speedPlus), 0, 2, "ep_littlegrey.png", new BoundingBox(new PVector(0, 0), new PVector(10, 10)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(speedPlus, 0), 0, 2, "ep_littlegrey.png", new BoundingBox(new PVector(0, 0), new PVector(10, 10)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-speedPlus, 0), 0, 2, "ep_littlegrey.png", new BoundingBox(new PVector(0, 0), new PVector(10, 10)), new PVector(0, 0)));
    lastSpawnPlus = millis();
  }
  void shootX() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y += 20;
    bulletPosition.x += 0;
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(speedX, speedX), 0, 2, "ep_littlegrey.png", new BoundingBox(new PVector(0, 0), new PVector(10, 10)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-speedX, -speedX), 0, 2, "ep_littlegrey.png", new BoundingBox(new PVector(0, 0), new PVector(10, 10)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(speedX, -speedX), 0, 2, "ep_littlegrey.png", new BoundingBox(new PVector(0, 0), new PVector(10, 10)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-speedX, speedX), 0, 2, "ep_littlegrey.png", new BoundingBox(new PVector(0, 0), new PVector(10, 10)), new PVector(0, 0)));
    lastSpawnX = millis();
  }
}
