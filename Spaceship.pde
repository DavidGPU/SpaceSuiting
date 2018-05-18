abstract class Spaceship extends GameObject {
  ArrayList<Item> items; //passive items, I want this to be a roguelite, unused because I don't know how to program it
  float scale;
  long lastProjectile;
  long lastProjectile2;
  long lastProjectile3;
  long lastProjectile4;
  long lastProjectile5;
  long lastProjectile6;
  long lastProjectile7;
  long lastProjectileCrim;
  int points;
  int hp;
  int damageLevel;
  int damage;
  int crimDelay = 2000; //my only way to make a passive and here it is
  boolean hasCrim;
  abstract float normalSpeed();
  abstract float focusSpeed();

  Spaceship(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox, int hp, int damageLevel, int damage) {
    super(position, velocity, orientation, scale, spriteName, hitbox);
    this.hp = hp;
    this.damageLevel = damageLevel;
    this.damage = damage;
  }
  boolean isDead() {
    return hp <= 0;
  }

  void update() {
    for (CommonEnemyProjectile ep : commonEnemyProjectiles) {
      if (this.isCollidingWith(ep)) {
        hp -= 1;
        damageLevel -= 2;
      }
    }
    for (DamageCollectible dc : damageCollectibles) {
      if (this.isCollidingWith(dc)) {
        damageLevel += 1;
      }
    }
    for (HealthCollectible hc : healthCollectibles) {
      if (this.isCollidingWith(hc)) {
        hp += 1;
      }
    }
    for (HealthCollectibleForSale hcfs : healthCollectiblesForSale) {
      if (this.isCollidingWith(hcfs) && hcfs.collected) {
        hp += 1;
      }
    }
    for (SuperDamageCollectibleForSale sdcfs : superDamageCollectiblesForSale) {
      if (this.isCollidingWith(sdcfs) && sdcfs.collected) {
        damageLevel += 20;
      }
    }

    for (CrimnerForSale cfs : crimnersForSale) {
      if (this.isCollidingWith(cfs) && cfs.collected) {
        hasCrim = true;
        crimDelay *= 0.75;
      }
    }


    if (leftKeyPressed && this.position.x >= 30 && ! shiftKeyPressed) {
      moveBy(-normalSpeed(), 0);
    }
    if (rightKeyPressed && this.position.x <= width - 30 && ! shiftKeyPressed) {
      moveBy(normalSpeed(), 0);
    }
    if (upKeyPressed && this.position.y >= 30 && ! shiftKeyPressed) {
      moveBy(0, -normalSpeed());
    }
    if (downKeyPressed && this.position.y <= height - 30 && ! shiftKeyPressed) {
      moveBy(0, normalSpeed());
    }
    if (leftKeyPressed && this.position.x >= 30 && shiftKeyPressed) {
      moveBy(-focusSpeed(), 0);
    }
    if (rightKeyPressed && this.position.x <= width - 30 && shiftKeyPressed) {
      moveBy(focusSpeed(), 0);
    }
    if (upKeyPressed && this.position.y >= 30 && shiftKeyPressed) {
      moveBy(0, -focusSpeed());
    }
    if (downKeyPressed && this.position.y <= height - 30 && shiftKeyPressed) {
      moveBy(0, focusSpeed());
    }
    if (hasCrim && millis() - lastProjectileCrim > crimDelay) {
      this.shootCrim();
    }
    hitbox.position.set(position);
  }

  void moveBy(float newX, float newY) {
    position.x += newX;
    position.y += newY;
  }

  void rotateTo(float newOrientation) {
    orientation = newOrientation;
  }

  void scaleTo(float newScale) {
    scale = newScale;
  }

  void shootCrim() {
    float projPos = random(0, 1400);
    playerProjectiles.add(new PlayerProjectile(new PVector(projPos, 1000), new PVector(0, -15), 0, 2, "pp_crimner.png", new BoundingBox(new PVector(0, 0), new PVector(32, 90)), new PVector(0, 0), damage));
    lastProjectileCrim = millis();
  }

  void display() {
    pushMatrix();
    translate(position.x, position.y);
    rotate(orientation);

    pushStyle();
    imageMode(CENTER);
    image(sprite, 0, 0);
    popStyle();

    popMatrix();
  }
}

class SpaceBee extends Spaceship {

  SpaceBee(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox, int hp, int damageLevel, int damage) {
    super(position, velocity, orientation, scale, spriteName, hitbox, hp, damageLevel, damage);
  }
  
    float normalSpeed() {
    return 6;
  }
  float focusSpeed() {
    return 3;
  }


  void update() {
    super.update();
    if (zKeyPressed && millis() - lastProjectile > 150) {
      this.shoot();
    }
    if (zKeyPressed && millis() - lastProjectile2 > 400 && damageLevel >= 15) {
      this.shoot2();
    }
    if (zKeyPressed && millis() - lastProjectile3 > 300 && damageLevel >= 40) {
      this.shoot3();
    }
    if (zKeyPressed && millis() - lastProjectile4 > 75 && damageLevel >= 75) {
      this.shoot4();
    }
    if (zKeyPressed && millis() - lastProjectile5 > 100 && damageLevel >= 115) {
      this.shoot5();
    }
    if (zKeyPressed && millis() - lastProjectile6 > 100 && damageLevel >= 175) {
      this.shoot6();
    }
    if (zKeyPressed && millis() - lastProjectile7 > 100 && damageLevel >= 200) {
      this.shoot7();
    }
  } 

  void shoot() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 60;
    bulletPosition.x += 10;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -10), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile = millis();
  }
  void shoot2() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 60;
    bulletPosition.x += 10;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(5, -10), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-5, -10), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile2 = millis();
  }
  void shoot3() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 60;
    bulletPosition.x += 10;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(3, -10), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-3, -10), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile3 = millis();
  }
  void shoot4() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 60;
    bulletPosition.x += 10;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -15), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, 10), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile4 = millis();
  }
  void shoot5() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 60;
    bulletPosition.x += 10;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(6, 15), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-6, 15), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile5 = millis();
  }
  void shoot6() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 0;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(7, 0), HALF_PI, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-7, 0), HALF_PI, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile6 = millis();
  }
  void shoot7() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 0;
    bulletPosition.x += 0;
    float projx = random(-10, 10);
    float projy = random(-10, 10);
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(projx, projy), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile7 = millis();
  }
}
class SpotNick extends Spaceship {

  SpotNick(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox, int hp, int damageLevel, int damage) {
    super(position, velocity, orientation, scale, spriteName, hitbox, hp, damageLevel, damage);
  }
  
    float normalSpeed() {
    return 8;
  }
  float focusSpeed() {
    return 3;
  }


  void update() {
    super.update();
    if (zKeyPressed && millis() - lastProjectile > 150) {
      this.shoot();
    }
    if (zKeyPressed && millis() - lastProjectile2 > 150 && damageLevel >= 15) {
      this.shoot2();
    }
    if (zKeyPressed && millis() - lastProjectile3 > 150 && damageLevel >= 40) {
      this.shoot3();
    }
    if (zKeyPressed && millis() - lastProjectile4 > 150 && damageLevel >= 75) {
      this.shoot4();
    }
    if (zKeyPressed && millis() - lastProjectile5 > 150 && damageLevel >= 115) {
      this.shoot5();
    }
    if (zKeyPressed && millis() - lastProjectile6 > 150 && damageLevel >= 175) {
      this.shoot6();
    }
    if (zKeyPressed && millis() - lastProjectile7 > 150 && damageLevel >= 200) {
      this.shoot7();
    }
  } 

  void shoot() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 30;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(1, -10), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-1, -10), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile = millis();
  }
  void shoot2() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 30;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(1.2, -10), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-1.2, -10), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -10), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile2 = millis();
  }
  void shoot3() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 30;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(2, -10), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-2, -10), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile3 = millis();
  }
  void shoot4() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 30;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(2.5, -10), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-2.5, -10), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile4 = millis();
  }
  void shoot5() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 30;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(3, -10), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-3, -10), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile5 = millis();
  }
  void shoot6() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 30;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(4, -10), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-4, -10), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile6 = millis();
  }
  void shoot7() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 30;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(3.5, -10), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-3.5, -10), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(4.5, -10), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-4.5, -10), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0.1, -10), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-0.1, -10), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile7 = millis();
  }
}
class MightShooter extends Spaceship {

  MightShooter(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox, int hp, int damageLevel, int damage) {
    super(position, velocity, orientation, scale, spriteName, hitbox, hp, damageLevel, damage);
  }
  
    float normalSpeed() {
    return 5;
  }
  float focusSpeed() {
    return 3;
  }


  void update() {
    super.update();
    if (zKeyPressed && millis() - lastProjectile > 1000) {
      this.shoot();
    }
    if (zKeyPressed && millis() - lastProjectile2 > 1500 && damageLevel >= 15) {
      this.shoot2();
    }
    if (zKeyPressed && millis() - lastProjectile3 > 1333 && damageLevel >= 40) {
      this.shoot3();
    }
    if (zKeyPressed && millis() - lastProjectile4 > 1888 && damageLevel >= 75) {
      this.shoot4();
    }
    if (zKeyPressed && millis() - lastProjectile5 > 2111 && damageLevel >= 115) {
      this.shoot5();
    }
    if (zKeyPressed && millis() - lastProjectile6 > 1256 && damageLevel >= 175) {
      this.shoot6();
    }
    if (zKeyPressed && millis() - lastProjectile7 > 1222 && damageLevel >= 200) {
      this.shoot7();
    }
  } 

  void shoot() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 100;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -25), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile = millis();
  }
  void shoot2() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 100;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -25), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile2 = millis();
  }
  void shoot3() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 100;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -25), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile3 = millis();
  }
  void shoot4() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 100;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -25), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile4 = millis();
  }
  void shoot5() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 100;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -25), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile5 = millis();
  }
  void shoot6() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 100;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -25), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile6 = millis();
  }
  void shoot7() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 100;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -25), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile7 = millis();
  }
}


class TriShooter extends Spaceship {

  TriShooter(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox, int hp, int damageLevel, int damage) {
    super(position, velocity, orientation, scale, spriteName, hitbox, hp, damageLevel, damage);
  }
  
    float normalSpeed() {
    return 5;
  }
  float focusSpeed() {
    return 2.5;
  }


  void update() {
    super.update();
    if (zKeyPressed && millis() - lastProjectile > 200) {
      this.shoot();
    }
    if (zKeyPressed && millis() - lastProjectile2 > 300 && damageLevel >= 15) {
      this.shoot2();
    }
    if (zKeyPressed && millis() - lastProjectile3 > 400 && damageLevel >= 40) {
      this.shoot3();
    }
    if (zKeyPressed && millis() - lastProjectile4 > 250 && damageLevel >= 75) {
      this.shoot4();
    }
    if (zKeyPressed && millis() - lastProjectile5 > 100 && damageLevel >= 115) {
      this.shoot5();
    }
    if (zKeyPressed && millis() - lastProjectile6 > 150 && damageLevel >= 175) {
      this.shoot6();
    }
    if (zKeyPressed && millis() - lastProjectile7 > 120 && damageLevel >= 200) {
      this.shoot7();
    }
  } 

  void shoot() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 60;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -10), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(1, -10), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-1, -10), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile = millis();
  }
  void shoot2() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 60;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(5, -12), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-5, -12), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -12), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile2 = millis();
  }
  void shoot3() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 60;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(3, -9), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-3, -9), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -9), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile3 = millis();
  }
  void shoot4() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 60;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -15), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, 15), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile4 = millis();
  }
  void shoot5() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 60;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(6, 15), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-6, 15), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(7, 15), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-7, 15), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile5 = millis();
  }
  void shoot6() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 0;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(7, 5), HALF_PI, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-7, 5), HALF_PI, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile6 = millis();
  }
  void shoot7() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 0;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(14, -12), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-14, -12), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(14, -10), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-14, -10), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile7 = millis();
  }
}