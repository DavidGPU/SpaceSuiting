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
class SpaceBeeGold extends Spaceship {

  SpaceBeeGold(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox, int hp, int damageLevel, int damage) {
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
    if (zKeyPressed && millis() - lastProjectile > 80) {
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
    if (zKeyPressed && millis() - lastProjectile6 > 200 && damageLevel >= 175) {
      this.shoot6();
    }
    if (zKeyPressed && millis() - lastProjectile7 > 300 && damageLevel >= 200) {
      this.shoot7();
    }
  } 

  void shoot() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 60;
    bulletPosition.x += 10;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -1), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, -0.2), damage));
    lastProjectile = millis();
  }
  void shoot2() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 60;
    bulletPosition.x += 10;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(5, -10), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-5, -10), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(7, -10), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-7, -10), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile2 = millis();
  }
  void shoot3() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 60;
    bulletPosition.x += 10;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(3, 10), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-3, 10), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, 10), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, -0.1), damage));
    lastProjectile3 = millis();
  }
  void shoot4() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 60;
    bulletPosition.x += 10;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-10, 0), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, -0.08), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(10, 0), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, -0.08), damage));
    lastProjectile4 = millis();
  }
  void shoot5() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 60;
    bulletPosition.x += 10;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(2, 15), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, -0.1), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-2, 15), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, -0.1), damage));
    lastProjectile5 = millis();
  }
  void shoot6() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 0;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(7, 0), HALF_PI, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, -0.3), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-7, 0), HALF_PI, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, -0.3), damage));
    lastProjectile6 = millis();
  }
  void shoot7() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 0;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -5), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, -0.1), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -5), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, -0.2), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -5), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, -0.3), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -5), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, -0.4), damage));
    lastProjectile7 = millis();
  }
}
class SpaceBeeReaper extends Spaceship {

  SpaceBeeReaper(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox, int hp, int damageLevel, int damage) {
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
    if (zKeyPressed && millis() - lastProjectile > 1300) {
      this.shoot();
    }
    if (zKeyPressed && millis() - lastProjectile2 > 800 && damageLevel >= 15) {
      this.shoot2();
    }
    if (zKeyPressed && millis() - lastProjectile3 > 600 && damageLevel >= 40) {
      this.shoot3();
    }
    if (zKeyPressed && millis() - lastProjectile4 > 150 && damageLevel >= 75) {
      this.shoot4();
    }
    if (zKeyPressed && millis() - lastProjectile5 > 200 && damageLevel >= 115) {
      this.shoot5();
    }
    if (zKeyPressed && millis() - lastProjectile6 > 200 && damageLevel >= 175) {
      this.shoot6();
    }
    if (zKeyPressed && millis() - lastProjectile7 > 200 && damageLevel >= 200) {
      this.shoot7();
    }
  } 

  void shoot() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 60;
    bulletPosition.x += 10;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -5), 0, 2, "pp_reaper.png", new BoundingBox(new PVector(0, 0), new PVector(36, 36)), new PVector(0, 0), damage));
    lastProjectile = millis();
  }
  void shoot2() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 60;
    bulletPosition.x += 10;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(5, -5), 0, 2, "pp_reaper.png", new BoundingBox(new PVector(0, 0), new PVector(36, 36)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-5, -5), 0, 2, "pp_reaper.png", new BoundingBox(new PVector(0, 0), new PVector(36, 36)), new PVector(0, 0), damage));
    lastProjectile2 = millis();
  }
  void shoot3() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 60;
    bulletPosition.x += 10;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(3, -5), 0, 2, "pp_reaper.png", new BoundingBox(new PVector(0, 0), new PVector(36, 36)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-3, -5), 0, 2, "pp_reaper.png", new BoundingBox(new PVector(0, 0), new PVector(36, 36)), new PVector(0, 0), damage));
    lastProjectile3 = millis();
  }
  void shoot4() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 60;
    bulletPosition.x += 10;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -7.5), 0, 2, "pp_reaper.png", new BoundingBox(new PVector(0, 0), new PVector(36, 36)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, 5), 0, 2, "pp_reaper.png", new BoundingBox(new PVector(0, 0), new PVector(36, 36)), new PVector(0, 0), damage));
    lastProjectile4 = millis();
  }
  void shoot5() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 60;
    bulletPosition.x += 10;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(6, 7.5), 0, 2, "pp_reaper.png", new BoundingBox(new PVector(0, 0), new PVector(36, 36)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-6, 7.5), 0, 2, "pp_reaper.png", new BoundingBox(new PVector(0, 0), new PVector(36, 36)), new PVector(0, 0), damage));
    lastProjectile5 = millis();
  }
  void shoot6() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 0;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(4, 0), HALF_PI, 2, "pp_reaper.png", new BoundingBox(new PVector(0, 0), new PVector(36, 36)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-4, 0), HALF_PI, 2, "pp_reaper.png", new BoundingBox(new PVector(0, 0), new PVector(36, 36)), new PVector(0, 0), damage));
    lastProjectile6 = millis();
  }
  void shoot7() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 0;
    bulletPosition.x += 0;
    float projx = random(-8, 8);
    float projy = random(-8, 8);
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(projx, projy), 0, 2, "pp_reaper.png", new BoundingBox(new PVector(0, 0), new PVector(36, 36)), new PVector(0, 0), damage));
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
class SpotNickGold extends Spaceship {

  SpotNickGold(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox, int hp, int damageLevel, int damage) {
    super(position, velocity, orientation, scale, spriteName, hitbox, hp, damageLevel, damage);
  }
  
    float normalSpeed() {
    return 7;
  }
  float focusSpeed() {
    return 2.5;
  }


  void update() {
    super.update();
    if (zKeyPressed && millis() - lastProjectile > 100) {
      this.shoot();
    }
    if (zKeyPressed && millis() - lastProjectile2 > 100 && damageLevel >= 15) {
      this.shoot2();
    }
    if (zKeyPressed && millis() - lastProjectile3 > 100 && damageLevel >= 40) {
      this.shoot3();
    }
    if (zKeyPressed && millis() - lastProjectile4 > 100 && damageLevel >= 75) {
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
    bulletPosition.y -= 30;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(1, -5), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(-0.1, -0.1), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-1, -5), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0.1, -0.1), damage));
    lastProjectile = millis();
  }
  void shoot2() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 30;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(1.2, -5), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(-0.1, -0.1), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-1.2, -5), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0.1, -0.1), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -5), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, -0.1), damage));
    lastProjectile2 = millis();
  }
  void shoot3() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 30;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(2, -5), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(-0.1, -0.1), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-2, -5), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0.1, -0.1), damage));
    lastProjectile3 = millis();
  }
  void shoot4() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 30;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(2.5, -5), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(-0.1, -0.1), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-2.5, -5), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0.1, -0.1), damage));
    lastProjectile4 = millis();
  }
  void shoot5() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 30;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(3, -5), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(-0.1, -0.1), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-3, -5), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0.1, -0.1), damage));
    lastProjectile5 = millis();
  }
  void shoot6() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 30;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(4, -5), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(-0.1, -0.1), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-4, -5), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0.1, -0.1), damage));
    lastProjectile6 = millis();
  }
  void shoot7() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 30;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(3.5, -5), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(-0.1, -0.1), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-3.5, -5), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0.1, -0.1), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(4.5, -5), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(-0.1, -0.1), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-4.5, -5), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0.1, -0.1), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0.1, -5), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(-0.1, -0.1), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-0.1, -5), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0.1, -0.1), damage));
    lastProjectile7 = millis();
  }
}
class SpotNickSand extends Spaceship {

  SpotNickSand(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox, int hp, int damageLevel, int damage) {
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
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(1, -10), 0, 2, "pp_sand.png", new BoundingBox(new PVector(0, 0), new PVector(8, 8)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-1, -10), 0, 2, "pp_sand.png", new BoundingBox(new PVector(0, 0), new PVector(8, 8)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -8), 0, 2, "pp_sandbig.png", new BoundingBox(new PVector(0, 0), new PVector(78, 76)), new PVector(0, 0), damage));
    lastProjectile = millis();
  }
  void shoot2() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 30;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(2, -10), 0, 2, "pp_sand.png", new BoundingBox(new PVector(0, 0), new PVector(8, 8)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-2, -10), 0, 2, "pp_sand.png", new BoundingBox(new PVector(0, 0), new PVector(8, 8)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -9), 0, 2, "pp_sandbig.png", new BoundingBox(new PVector(0, 0), new PVector(76, 76)), new PVector(0, 0), damage));
    lastProjectile2 = millis();
  }
  void shoot3() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 30;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(3, -10), 0, 2, "pp_sand.png", new BoundingBox(new PVector(0, 0), new PVector(8, 8)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-3, -10), 0, 2, "pp_sand.png", new BoundingBox(new PVector(0, 0), new PVector(8, 8)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -7), 0, 2, "pp_sandbig.png", new BoundingBox(new PVector(0, 0), new PVector(76, 76)), new PVector(0, 0), damage));
    lastProjectile3 = millis();
  }
  void shoot4() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 30;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(4, -10), 0, 2, "pp_sand.png", new BoundingBox(new PVector(0, 0), new PVector(8, 8)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-4, -10), 0, 2, "pp_sand.png", new BoundingBox(new PVector(0, 0), new PVector(8, 8)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -6), 0, 2, "pp_sandbig.png", new BoundingBox(new PVector(0, 0), new PVector(76, 76)), new PVector(0, 0), damage));
    lastProjectile4 = millis();
  }
  void shoot5() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 30;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(5, -10), 0, 2, "pp_sand.png", new BoundingBox(new PVector(0, 0), new PVector(8, 8)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-5, -10), 0, 2, "pp_sand.png", new BoundingBox(new PVector(0, 0), new PVector(8, 8)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -10), 0, 2, "pp_sandbig.png", new BoundingBox(new PVector(0, 0), new PVector(76, 76)), new PVector(0, 0), damage));
    lastProjectile5 = millis();
  }
  void shoot6() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 30;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(6, -10), 0, 2, "pp_sand.png", new BoundingBox(new PVector(0, 0), new PVector(8, 8)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-6, -10), 0, 2, "pp_sand.png", new BoundingBox(new PVector(0, 0), new PVector(8, 8)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -5), 0, 2, "pp_sandbig.png", new BoundingBox(new PVector(0, 0), new PVector(76, 76)), new PVector(0, 0), damage));
    lastProjectile6 = millis();
  }
  void shoot7() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 30;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0.5, -10), 0, 2, "pp_sand.png", new BoundingBox(new PVector(0, 0), new PVector(8, 8)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-0.5, -10), 0, 2, "pp_sand.png", new BoundingBox(new PVector(0, 0), new PVector(8, 8)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -3), 0, 2, "pp_sandbig.png", new BoundingBox(new PVector(0, 0), new PVector(76, 76)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -2), 0, 2, "pp_sandbig.png", new BoundingBox(new PVector(0, 0), new PVector(76, 76)), new PVector(0, 0), damage));
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
class MightShooterGold extends Spaceship {

  MightShooterGold(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox, int hp, int damageLevel, int damage) {
    super(position, velocity, orientation, scale, spriteName, hitbox, hp, damageLevel, damage);
  }
  
    float normalSpeed() {
    return 4;
  }
  float focusSpeed() {
    return 2;
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
    bulletPosition.y -= 90;
    bulletPosition.x += 0;
    PVector bulletPosition2 = new PVector(position.x, position.y);
    bulletPosition2.y -= 90;
    bulletPosition2.x -= 20;
    PVector bulletPosition3 = new PVector(position.x, position.y);
    bulletPosition3.y -= 90;
    bulletPosition3.x += 20;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -25), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition2, new PVector(0, -25), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition3, new PVector(0, -25), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile = millis();
  }
  void shoot2() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 90;
    bulletPosition.x += 0;
    PVector bulletPosition2 = new PVector(position.x, position.y);
    bulletPosition2.y -= 90;
    bulletPosition2.x -= 20;
    PVector bulletPosition3 = new PVector(position.x, position.y);
    bulletPosition3.y -= 90;
    bulletPosition3.x += 20;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -24), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition2, new PVector(0, -24), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition3, new PVector(0, -24), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile2 = millis();
  }
  void shoot3() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 90;
    bulletPosition.x += 0;
    PVector bulletPosition2 = new PVector(position.x, position.y);
    bulletPosition2.y -= 90;
    bulletPosition2.x -= 20;
    PVector bulletPosition3 = new PVector(position.x, position.y);
    bulletPosition3.y -= 90;
    bulletPosition3.x += 20;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -23), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition2, new PVector(0, -23), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition3, new PVector(0, -23), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile3 = millis();
  }
  void shoot4() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 90;
    bulletPosition.x += 0;
    PVector bulletPosition2 = new PVector(position.x, position.y);
    bulletPosition2.y -= 90;
    bulletPosition2.x -= 20;
    PVector bulletPosition3 = new PVector(position.x, position.y);
    bulletPosition3.y -= 90;
    bulletPosition3.x += 20;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -22), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition2, new PVector(0, -22), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition3, new PVector(0, -22), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile4 = millis();
  }
  void shoot5() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 90;
    bulletPosition.x += 0;
    PVector bulletPosition2 = new PVector(position.x, position.y);
    bulletPosition2.y -= 90;
    bulletPosition2.x -= 20;
    PVector bulletPosition3 = new PVector(position.x, position.y);
    bulletPosition3.y -= 90;
    bulletPosition3.x += 20;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -21), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition2, new PVector(0, -21), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition3, new PVector(0, -21), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile5 = millis();
  }
  void shoot6() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 90;
    bulletPosition.x += 0;
    PVector bulletPosition2 = new PVector(position.x, position.y);
    bulletPosition2.y -= 90;
    bulletPosition2.x -= 20;
    PVector bulletPosition3 = new PVector(position.x, position.y);
    bulletPosition3.y -= 90;
    bulletPosition3.x += 20;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -20), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition2, new PVector(0, -20), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition3, new PVector(0, -20), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile6 = millis();
  }
  void shoot7() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 90;
    bulletPosition.x += 0;
    PVector bulletPosition2 = new PVector(position.x, position.y);
    bulletPosition2.y -= 90;
    bulletPosition2.x -= 20;
    PVector bulletPosition3 = new PVector(position.x, position.y);
    bulletPosition3.y -= 90;
    bulletPosition3.x += 20;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -26), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition2, new PVector(0, -26), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition3, new PVector(0, -26), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile7 = millis();
  }
}
class MightShooterIce extends Spaceship {

  MightShooterIce(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox, int hp, int damageLevel, int damage) {
    super(position, velocity, orientation, scale, spriteName, hitbox, hp, damageLevel, damage);
  }
  
    float normalSpeed() {
    return 4;
  }
  float focusSpeed() {
    return 2.5;
  }


  void update() {
    super.update();
    if (zKeyPressed && millis() - lastProjectile > 2000) {
      this.shoot();
    }
    if (zKeyPressed && millis() - lastProjectile2 > 3000 && damageLevel >= 15) {
      this.shoot2();
    }
    if (zKeyPressed && millis() - lastProjectile3 > 2666 && damageLevel >= 40) {
      this.shoot3();
    }
    if (zKeyPressed && millis() - lastProjectile4 > 4000 && damageLevel >= 75) {
      this.shoot4();
    }
    if (zKeyPressed && millis() - lastProjectile5 > 4222 && damageLevel >= 115) {
      this.shoot5();
    }
    if (zKeyPressed && millis() - lastProjectile6 > 2048 && damageLevel >= 175) {
      this.shoot6();
    }
    if (zKeyPressed && millis() - lastProjectile7 > 2444 && damageLevel >= 200) {
      this.shoot7();
    }
  } 

  void shoot() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 100;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -3), 0, 2, "pp_iceball.png", new BoundingBox(new PVector(0, 0), new PVector(130, 130)), new PVector(0, 0), damage));
    lastProjectile = millis();
  }
  void shoot2() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 100;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -3), 0, 2, "pp_iceball.png", new BoundingBox(new PVector(0, 0), new PVector(130, 130)), new PVector(0, 0), damage));
    lastProjectile2 = millis();
  }
  void shoot3() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 100;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -3), 0, 2, "pp_iceball.png", new BoundingBox(new PVector(0, 0), new PVector(130, 130)), new PVector(0, 0), damage));
    lastProjectile3 = millis();
  }
  void shoot4() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 100;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -3), 0, 2, "pp_iceball.png", new BoundingBox(new PVector(0, 0), new PVector(130, 130)), new PVector(0, 0), damage));
    lastProjectile4 = millis();
  }
  void shoot5() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 100;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -3), 0, 2, "pp_iceball.png", new BoundingBox(new PVector(0, 0), new PVector(130, 130)), new PVector(0, 0), damage));
    lastProjectile5 = millis();
  }
  void shoot6() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 100;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -3), 0, 2, "pp_iceball.png", new BoundingBox(new PVector(0, 0), new PVector(130, 130)), new PVector(0, 0), damage));
    lastProjectile6 = millis();
  }
  void shoot7() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 100;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -3), 0, 2, "pp_iceball.png", new BoundingBox(new PVector(0, 0), new PVector(130, 130)), new PVector(0, 0), damage));
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
    bulletPosition.y -= 40;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -10), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(4, -10), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-4, -10), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile = millis();
  }
  void shoot2() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 40;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(5, -12), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-5, -12), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -12), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile2 = millis();
  }
  void shoot3() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 40;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(3, -9), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-3, -9), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -9), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile3 = millis();
  }
  void shoot4() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 40;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -15), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, 15), 0, 2, "pp_green.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile4 = millis();
  }
  void shoot5() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 40;
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
class TriShooterNeon extends Spaceship {

  TriShooterNeon(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox, int hp, int damageLevel, int damage) {
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
    bulletPosition.y -= 40;
    bulletPosition.x += 0;
    playerProjectiles.add(new RandomPlayerProjectile(bulletPosition, new PVector(0, -50), 0, 2, "pp_neon.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new RandomPlayerProjectile(bulletPosition, new PVector(4, -50), 0, 2, "pp_neon.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new RandomPlayerProjectile(bulletPosition, new PVector(-4, -50), 0, 2, "pp_neon.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile = millis();
  }
  void shoot2() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 40;
    bulletPosition.x += 0;
    playerProjectiles.add(new RandomPlayerProjectile(bulletPosition, new PVector(5, -12), 0, 2, "pp_neon.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new RandomPlayerProjectile(bulletPosition, new PVector(-5, -12), 0, 2, "pp_neon.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new RandomPlayerProjectile(bulletPosition, new PVector(0, -12), 0, 2, "pp_neon.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile2 = millis();
  }
  void shoot3() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 40;
    bulletPosition.x += 0;
    playerProjectiles.add(new RandomPlayerProjectile(bulletPosition, new PVector(3, -9), 0, 2, "pp_neon.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new RandomPlayerProjectile(bulletPosition, new PVector(-3, -9), 0, 2, "pp_neon.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new RandomPlayerProjectile(bulletPosition, new PVector(0, -9), 0, 2, "pp_neon.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile3 = millis();
  }
  void shoot4() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 40;
    bulletPosition.x += 0;
    playerProjectiles.add(new RandomPlayerProjectile(bulletPosition, new PVector(0, -15), 0, 2, "pp_neon.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new RandomPlayerProjectile(bulletPosition, new PVector(0, 15), 0, 2, "pp_neon.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile4 = millis();
  }
  void shoot5() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 40;
    bulletPosition.x += 0;
    playerProjectiles.add(new RandomPlayerProjectile(bulletPosition, new PVector(6, 15), 0, 2, "pp_neon.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new RandomPlayerProjectile(bulletPosition, new PVector(-6, 15), 0, 2, "pp_neon.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new RandomPlayerProjectile(bulletPosition, new PVector(7, 15), 0, 2, "pp_neon.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new RandomPlayerProjectile(bulletPosition, new PVector(-7, 15), 0, 2, "pp_neon.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile5 = millis();
  }
  void shoot6() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 0;
    bulletPosition.x += 0;
    playerProjectiles.add(new RandomPlayerProjectile(bulletPosition, new PVector(7, 5), HALF_PI, 2, "pp_neon.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new RandomPlayerProjectile(bulletPosition, new PVector(-7, 5), HALF_PI, 2, "pp_neon.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile6 = millis();
  }
  void shoot7() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 0;
    bulletPosition.x += 0;
    playerProjectiles.add(new RandomPlayerProjectile(bulletPosition, new PVector(14, -12), 0, 2, "pp_neon.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new RandomPlayerProjectile(bulletPosition, new PVector(-14, -12), 0, 2, "pp_neon.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new RandomPlayerProjectile(bulletPosition, new PVector(14, -10), 0, 2, "pp_neon.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    playerProjectiles.add(new RandomPlayerProjectile(bulletPosition, new PVector(-14, -10), 0, 2, "pp_neon.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, 0), damage));
    lastProjectile7 = millis();
  }
}
class TriShooterGold extends Spaceship {

  TriShooterGold(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox, int hp, int damageLevel, int damage) {
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
    bulletPosition.y -= 40;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -10), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, -0.1), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(4, -10), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, -0.1), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-4, -10), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, -0.1), damage));
    lastProjectile = millis();
  }
  void shoot2() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 40;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -10), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, -0.1), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(4, -10), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, -0.1), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-4, -10), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, -0.1), damage));
    lastProjectile2 = millis();
  }
  void shoot3() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 40;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -10), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, -0.1), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(4, -10), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, -0.1), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-4, -10), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, -0.1), damage));
    lastProjectile3 = millis();
  }
  void shoot4() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 40;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -10), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, -0.1), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(4, -10), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, -0.1), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-4, -10), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, -0.1), damage));
    lastProjectile4 = millis();
  }
  void shoot5() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 40;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -10), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, -0.1), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(4, -10), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, -0.1), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-4, -10), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, -0.1), damage));
    lastProjectile5 = millis();
  }
  void shoot6() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 0;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -10), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, -0.1), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(4, -10), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, -0.1), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-4, -10), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, -0.1), damage));
    lastProjectile6 = millis();
  }
  void shoot7() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y -= 0;
    bulletPosition.x += 0;
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(0, -10), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, -0.1), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(4, -10), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, -0.1), damage));
    playerProjectiles.add(new PlayerProjectile(bulletPosition, new PVector(-4, -10), 0, 2, "pp_gold.png", new BoundingBox(new PVector(0, 0), new PVector(12, 20)), new PVector(0, -0.1), damage));
    lastProjectile7 = millis();
  }
}
