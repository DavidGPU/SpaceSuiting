// LILSHIP
class LilShip extends Enemy {

  LilShip(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox, int defense, int superDefense, int hp) {
    super(position, velocity, orientation, scale, spriteName, hitbox, defense, superDefense, hp);
  }
  
  int value() {
    return 10;
  }

  void update() {
    super.update();
    if (millis() - lastProjectile > 2000 && difficulty == 1)
      shootEasy();
    if (millis() - lastProjectile > 1500 && difficulty == 2)
      shootNormal();
    if (millis() - lastProjectile > 750 && difficulty == 3)
      shootHard();
  }

  void shootEasy() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y += 20;
    bulletPosition.x += 0;
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 1), 0, 2, "ep_littlegrey.png", new BoundingBox(new PVector(0, 0), new PVector(10, 10)), new PVector(0, 0)));
    lastProjectile = millis();
  }
  void shootNormal() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y += 20;
    bulletPosition.x += 0;
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 3), 0, 2, "ep_littlegrey.png", new BoundingBox(new PVector(0, 0), new PVector(10, 10)), new PVector(0, 0)));
    lastProjectile = millis();
  }
  void shootHard() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y += 20;
    bulletPosition.x += 0;
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 8), 0, 2, "ep_littlegrey.png", new BoundingBox(new PVector(0, 0), new PVector(10, 10)), new PVector(0, 0)));
    lastProjectile = millis();
  }
}

// ELITE LILSHIP
class EliteLilShip extends Enemy {

  EliteLilShip(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox, int defense, int superDefense, int hp) {
    super(position, velocity, orientation, scale, spriteName, hitbox, defense, superDefense, hp);
  }

  int value() {
    return 30;
  }

  void update() {
    super.update();
    if (millis() - lastProjectile > 5000 && difficulty == 1)
      shootEasy();
    if (millis() - lastProjectile > 4000 && difficulty == 2)
      shootNormal();
    if (millis() - lastProjectile > 2000 && difficulty == 3)
      shootHard();
  }

  void shootEasy() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y += 20;
    bulletPosition.x += 0;
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 3), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 3.5), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 4), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    lastProjectile = millis();
  }
  void shootNormal() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y += 20;
    bulletPosition.x += 0;
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 3), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 4), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 5), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 6), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    lastProjectile = millis();
  }
  void shootHard() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y += 20;
    bulletPosition.x += 0;
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 1), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 2), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 4), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 8), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    lastProjectile = millis();
  }
}


// HYPER LILSHIP
class HyperLilShip extends Enemy {

  HyperLilShip(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox, int defense, int superDefense, int hp) {
    super(position, velocity, orientation, scale, spriteName, hitbox, defense, superDefense, hp);
  }

  int value() {
    return 75;
  }

  void update() {
    super.update();
    if (millis() - lastProjectile > 3000 && difficulty == 1)
      shootEasy();
    if (millis() - lastProjectile > 1600 && difficulty == 2)
      shootNormal();
    if (millis() - lastProjectile > 1000 && difficulty == 3)
      shootHard();
  }

  void shootEasy() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y += 20;
    bulletPosition.x += 0;
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 3), 0, 2, "ep_hyperball.png", new BoundingBox(new PVector(0, 0), new PVector(12, 12)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 3.5), 0, 2, "ep_hyperball.png", new BoundingBox(new PVector(0, 0), new PVector(12, 12)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 4), 0, 2, "ep_hyperball.png", new BoundingBox(new PVector(0, 0), new PVector(12, 12)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 3), 0, 2, "ep_hyperball.png", new BoundingBox(new PVector(0, 0), new PVector(12, 12)), new PVector(0, 0.02)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 3.5), 0, 2, "ep_hyperball.png", new BoundingBox(new PVector(0, 0), new PVector(12, 12)), new PVector(0, 0.02)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 4), 0, 2, "ep_hyperball.png", new BoundingBox(new PVector(0, 0), new PVector(12, 12)), new PVector(0, 0.02)));
    lastProjectile = millis();
  }
  void shootNormal() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y += 20;
    bulletPosition.x += 0;
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 4), 0, 2, "ep_hyperball.png", new BoundingBox(new PVector(0, 0), new PVector(12, 12)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 5), 0, 2, "ep_hyperball.png", new BoundingBox(new PVector(0, 0), new PVector(12, 12)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 6), 0, 2, "ep_hyperball.png", new BoundingBox(new PVector(0, 0), new PVector(12, 12)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 2), 0, 2, "ep_hyperball.png", new BoundingBox(new PVector(0, 0), new PVector(12, 12)), new PVector(0, 0.02)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 3), 0, 2, "ep_hyperball.png", new BoundingBox(new PVector(0, 0), new PVector(12, 12)), new PVector(0, 0.02)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 4), 0, 2, "ep_hyperball.png", new BoundingBox(new PVector(0, 0), new PVector(12, 12)), new PVector(0, 0.02)));
    lastProjectile = millis();
  }
  void shootHard() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y += 20;
    bulletPosition.x += 0;
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 2), 0, 2, "ep_hyperball.png", new BoundingBox(new PVector(0, 0), new PVector(12, 12)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 3), 0, 2, "ep_hyperball.png", new BoundingBox(new PVector(0, 0), new PVector(12, 12)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 4), 0, 2, "ep_hyperball.png", new BoundingBox(new PVector(0, 0), new PVector(12, 12)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 1), 0, 2, "ep_hyperball.png", new BoundingBox(new PVector(0, 0), new PVector(12, 12)), new PVector(0, 0.02)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 2), 0, 2, "ep_hyperball.png", new BoundingBox(new PVector(0, 0), new PVector(12, 12)), new PVector(0, 0.02)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 3), 0, 2, "ep_hyperball.png", new BoundingBox(new PVector(0, 0), new PVector(12, 12)), new PVector(0, 0.02)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 4), 0, 2, "ep_hyperball.png", new BoundingBox(new PVector(0, 0), new PVector(12, 12)), new PVector(0, 0.02)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 5), 0, 2, "ep_hyperball.png", new BoundingBox(new PVector(0, 0), new PVector(12, 12)), new PVector(0, 0.02)));
    lastProjectile = millis();
  }
}

// ARCHSHIP

class ArchShip extends Enemy {

  ArchShip(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox, int defense, int superDefense, int hp) {
    super(position, velocity, orientation, scale, spriteName, hitbox, defense, superDefense, hp);
  }

  int value() {
    return 50;
  }

  void update() {
    super.update();
    if (millis() - lastProjectile > 2500 && difficulty == 1)
      shoot();
    if (millis() - lastProjectile > 1500 && difficulty == 2)
      shoot();
    if (millis() - lastProjectile > 1000 && difficulty == 3)
      shoot();
  }

  void shoot() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y += 20;
    bulletPosition.x += 0;
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 2), 0, 2, "ep_littlegreen.png", new BoundingBox(new PVector(0, 0), new PVector(10, 10)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(2, 2), HALF_PI, 2, "ep_littlegreen.png", new BoundingBox(new PVector(0, 0), new PVector(10, 10)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-2, 2), -HALF_PI, 2, "ep_littlegreen.png", new BoundingBox(new PVector(0, 0), new PVector(10, 10)), new PVector(0, 0)));
    lastProjectile = millis();
  }
}

// ELITE ARCHSHIP

class EliteArchShip extends Enemy {

  EliteArchShip(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox, int defense, int superDefense, int hp) {
    super(position, velocity, orientation, scale, spriteName, hitbox, defense, superDefense, hp);
  }

  int value() {
    return 100;
  }

  void update() {
    super.update();
    if (millis() - lastProjectile > 4000 && difficulty == 1)
      shootEasy();
    if (millis() - lastProjectile > 3000 && difficulty == 2)
      shootNormal();
    if (millis() - lastProjectile > 1500 && difficulty == 3)
      shootHard();
  }

  void shootEasy() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y += 20;
    bulletPosition.x += 0;
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(1, 3), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(10, 10)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-1, 3), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(10, 10)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(3, 1), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(10, 10)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-3, 1), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(10, 10)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(2, 2), HALF_PI, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(10, 10)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-2, 2), -HALF_PI, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(10, 10)), new PVector(0, 0)));
    lastProjectile = millis();
  }
  void shootNormal() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y += 20;
    bulletPosition.x += 0;
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(2, 4), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(10, 10)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-2, 4), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(10, 10)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(4, 2), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(10, 10)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-4, 2), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(10, 10)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(3, 3), HALF_PI, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(10, 10)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-3, 3), -HALF_PI, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(10, 10)), new PVector(0, 0)));
    lastProjectile = millis();
  }
  void shootHard() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y += 20;
    bulletPosition.x += 0;
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(1, 3), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(10, 10)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-1, 3), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(10, 10)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(3, 1), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(10, 10)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-3, 1), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(10, 10)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(2, 2), HALF_PI, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(10, 10)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-2, 2), -HALF_PI, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(10, 10)), new PVector(0, 0)));
    lastProjectile = millis();
  }
}

// FATROCKET
class FatRocket extends Enemy {

  FatRocket(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox, int defense, int superDefense, int hp) {
    super(position, velocity, orientation, scale, spriteName, hitbox, defense, superDefense, hp);
  }

  int value() {
    return 75;
  }

  void update() {
    super.update();
    if (millis() - lastProjectile > 3000 && difficulty == 1)
      shootEasy();
    if (millis() - lastProjectile > 2000 && difficulty == 2)
      shootNormal();
    if (millis() - lastProjectile > 1000 && difficulty == 3)
      shootHard();
  }

  void shootEasy() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y += 20;
    bulletPosition.x += 0;
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-0.7, -5), 0, 2, "ep_blood_wheel.png", new BoundingBox(new PVector(0, 0), new PVector(40, 40)), new PVector(0, 0.1)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0.7, -5), 0, 2, "ep_blood_wheel.png", new BoundingBox(new PVector(0, 0), new PVector(40, 40)), new PVector(0, 0.1)));
    lastProjectile = millis();
  }
  void shootNormal() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y += 20;
    bulletPosition.x += 0;
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-0.7, -5), 0, 2, "ep_blood_wheel.png", new BoundingBox(new PVector(0, 0), new PVector(40, 40)), new PVector(0, 0.12)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0.7, -5), 0, 2, "ep_blood_wheel.png", new BoundingBox(new PVector(0, 0), new PVector(40, 40)), new PVector(0, 0.12)));
    lastProjectile = millis();
  }
  void shootHard() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y += 20;
    bulletPosition.x += 0;
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-0.7, -5), 0, 2, "ep_blood_wheel.png", new BoundingBox(new PVector(0, 0), new PVector(40, 40)), new PVector(0, 0.15)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0.7, -5), 0, 2, "ep_blood_wheel.png", new BoundingBox(new PVector(0, 0), new PVector(40, 40)), new PVector(0, 0.15)));
    lastProjectile = millis();
  }
}

// ELITE FATROCKET
class EliteFatRocket extends Enemy {

  EliteFatRocket(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox, int defense, int superDefense, int hp) {
    super(position, velocity, orientation, scale, spriteName, hitbox, defense, superDefense, hp);
  }

  int value() {
    return 110;
  }

  void update() {
    super.update();
    if (millis() - lastProjectile > 2000)
      shoot();
      
  }

  void shoot() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y += 20;
    bulletPosition.x += 0;
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-0.7, -5), 0, 2, "ep_blood_wheel.png", new BoundingBox(new PVector(0, 0), new PVector(40, 40)), new PVector(0, 0.05)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0.7, -5), 0, 2, "ep_blood_wheel.png", new BoundingBox(new PVector(0, 0), new PVector(40, 40)), new PVector(0, 0.05)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, -6), 0, 2, "ep_blood_wheel.png", new BoundingBox(new PVector(0, 0), new PVector(40, 40)), new PVector(0, 0.06)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(1, -4), 0, 2, "ep_blood_wheel.png", new BoundingBox(new PVector(0, 0), new PVector(40, 40)), new PVector(0, 0.05)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-1, -4), 0, 2, "ep_blood_wheel.png", new BoundingBox(new PVector(0, 0), new PVector(40, 40)), new PVector(0, 0.05)));
    lastProjectile = millis();
  }
}

// CRUSADERSHIP
class CrusaderShip extends Enemy {

  CrusaderShip(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox, int defense, int superDefense, int hp) {
    super(position, velocity, orientation, scale, spriteName, hitbox, defense, superDefense, hp);
  }
  
  int value() {
    return 100;
  }

  void update() {
    super.update();
    if (millis() - lastProjectile > 1000 && difficulty == 1)
      shootEasy();
    if (millis() - lastProjectile > 600 && difficulty == 2)
      shootNormal();
    if (millis() - lastProjectile > 450 && difficulty == 3)
      shootHard();
  }

  void shootEasy() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y += random(-80, 80);
    bulletPosition.x += 0;
    float velX = random(-2, 2);
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(velX, 0), 0, 2, "ep_littlegrey.png", new BoundingBox(new PVector(0, 0), new PVector(10, 10)), new PVector(0, 0)));
    lastProjectile = millis();
  }
  void shootNormal() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y += random(-80, 80);
    bulletPosition.x += 0;
        float velX = random(-4, 4);
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(velX, 0), 0, 2, "ep_littlegrey.png", new BoundingBox(new PVector(0, 0), new PVector(10, 10)), new PVector(0, 0)));
    lastProjectile = millis();
  }
  void shootHard() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y += random(-80, 80);
    bulletPosition.x += 0;
        float velX = random(-6, 6);
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(velX, 0), 0, 2, "ep_littlegrey.png", new BoundingBox(new PVector(0, 0), new PVector(10, 10)), new PVector(0, 0)));
    lastProjectile = millis();
  }
}


// MEGABALL
class MegaBall extends Enemy {

  MegaBall(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox, int defense, int superDefense, int hp) {
    super(position, velocity, orientation, scale, spriteName, hitbox, defense, superDefense, hp);
  }

  int value() {
    return 200;
  }

  void update() {
    super.update();
    if (millis() - lastProjectile > 2500)
      shoot();
  }

  void shoot() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y += 20;
    bulletPosition.x += 0;
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 3), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(12, 16)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 3.5), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(12, 16)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 4), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(12, 16)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(1, 3), 0, 2, "ep_greenball.png", new BoundingBox(new PVector(0, 0), new PVector(12, 16)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-1, 3), 0, 2, "ep_leaf_blood.png", new BoundingBox(new PVector(0, 0), new PVector(12, 16)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(3, 1), 0, 2, "ep_leaf_blood.png", new BoundingBox(new PVector(0, 0), new PVector(12, 16)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-3, 1), 0, 2, "ep_leaf_blood.png", new BoundingBox(new PVector(0, 0), new PVector(12, 16)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(2, 2), HALF_PI, 2, "ep_leaf_blood.png", new BoundingBox(new PVector(0, 0), new PVector(12, 16)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-2, 2), -HALF_PI, 2, "ep_leaf_blood.png", new BoundingBox(new PVector(0, 0), new PVector(12, 16)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-0.7, -5), 0, 2, "ep_blood_wheel.png", new BoundingBox(new PVector(0, 0), new PVector(40, 40)), new PVector(0, 0.05)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0.7, -5), 0, 2, "ep_blood_wheel.png", new BoundingBox(new PVector(0, 0), new PVector(40, 40)), new PVector(0, 0.05)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, -6), 0, 2, "ep_blood_wheel.png", new BoundingBox(new PVector(0, 0), new PVector(40, 40)), new PVector(0, 0.06)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(1, -4), 0, 2, "ep_blood_wheel.png", new BoundingBox(new PVector(0, 0), new PVector(40, 40)), new PVector(0, 0.05)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-1, -4), 0, 2, "ep_blood_wheel.png", new BoundingBox(new PVector(0, 0), new PVector(40, 40)), new PVector(0, 0.05)));


    lastProjectile = millis();
  }
}

// ELITE MEGABALL
class EliteMegaBall extends Enemy {

  EliteMegaBall(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox, int defense, int superDefense, int hp) {
    super(position, velocity, orientation, scale, spriteName, hitbox, defense, superDefense, hp);
  }

  int value() {
    return 500;
  }

  void update() {
    super.update();
    if (millis() - lastProjectile > 2500)
      shoot();
  }

  void shoot() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y += 20;
    bulletPosition.x += 0;
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 2), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(12, 16)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 2.5), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(12, 16)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 3), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(12, 16)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 3.5), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(12, 16)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 4), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(12, 16)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(1, 3), 0, 2, "ep_leaf_blood.png", new BoundingBox(new PVector(0, 0), new PVector(12, 16)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-1, 3), 0, 2, "ep_leaf_blood.png", new BoundingBox(new PVector(0, 0), new PVector(12, 16)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(3, 1), 0, 2, "ep_leaf_blood.png", new BoundingBox(new PVector(0, 0), new PVector(12, 16)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-3, 1), 0, 2, "ep_leaf_blood.png", new BoundingBox(new PVector(0, 0), new PVector(12, 16)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(2, 2), HALF_PI, 2, "ep_leaf_blood.png", new BoundingBox(new PVector(0, 0), new PVector(12, 16)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-2, 2), -HALF_PI, 2, "ep_leaf_blood.png", new BoundingBox(new PVector(0, 0), new PVector(12, 16)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(2, 4), 0, 2, "ep_leaf_blood.png", new BoundingBox(new PVector(0, 0), new PVector(12, 16)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-2, 4), 0, 2, "ep_leaf_blood.png", new BoundingBox(new PVector(0, 0), new PVector(12, 16)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(4, 2), 0, 2, "ep_leaf_blood.png", new BoundingBox(new PVector(0, 0), new PVector(12, 16)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-4, 2), 0, 2, "ep_leaf_blood.png", new BoundingBox(new PVector(0, 0), new PVector(12, 16)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(3, 3), HALF_PI, 2, "ep_leaf_blood.png", new BoundingBox(new PVector(0, 0), new PVector(12, 16)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-3, 3), -HALF_PI, 2, "ep_leaf_blood.png", new BoundingBox(new PVector(0, 0), new PVector(12, 16)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-0.7, -5), 0, 2, "ep_blood_wheel.png", new BoundingBox(new PVector(0, 0), new PVector(40, 40)), new PVector(0, 0.05)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0.7, -5), 0, 2, "ep_blood_wheel.png", new BoundingBox(new PVector(0, 0), new PVector(40, 40)), new PVector(0, 0.05)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, -6), 0, 2, "ep_blood_wheel.png", new BoundingBox(new PVector(0, 0), new PVector(40, 40)), new PVector(0, 0.06)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(1, -4), 0, 2, "ep_blood_wheel.png", new BoundingBox(new PVector(0, 0), new PVector(40, 40)), new PVector(0, 0.05)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-1, -4), 0, 2, "ep_blood_wheel.png", new BoundingBox(new PVector(0, 0), new PVector(40, 40)), new PVector(0, 0.05)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(2, -5), 0, 2, "ep_blood_wheel.png", new BoundingBox(new PVector(0, 0), new PVector(40, 40)), new PVector(0, 0.05)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-2, -5), 0, 2, "ep_blood_wheel.png", new BoundingBox(new PVector(0, 0), new PVector(40, 40)), new PVector(0, 0.05)));


    lastProjectile = millis();
  }
}

// BOLTZYME
class Boltzyme extends Enemy {

  Boltzyme(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox, int defense, int superDefense, int hp) {
    super(position, velocity, orientation, scale, spriteName, hitbox, defense, superDefense, hp);
  }

  int value() {
    return 100;
  }

  void update() {
    super.update();
    if (millis() - lastProjectile > 1000)
      shoot();
  }

  void shoot() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y += 20;
    bulletPosition.x += 0;
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 3), 0, 2, "ep_bluepetal.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 3.5), 0, 2, "ep_bluepetal.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 4), 0, 2, "ep_bluepetal.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(5, 3), 0, 2, "ep_bluepetal.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(-0.1, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(5, 3.5), 0, 2, "ep_bluepetal.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(-0.1, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(5, 4), 0, 2, "ep_bluepetal.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(-0.1, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-5, 3), 0, 2, "ep_bluepetal.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0.1, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-5, 3.5), 0, 2, "ep_bluepetal.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0.1, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-5, 4), 0, 2, "ep_bluepetal.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0.1, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(5, 4), 0, 2, "ep_bluepetal.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(-0.08, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(5, 4.5), 0, 2, "ep_bluepetal.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(-0.08, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(5, 5), 0, 2, "ep_bluepetal.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(-0.08, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-5, 4), 0, 2, "ep_bluepetal.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0.08, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-5, 4.5), 0, 2, "ep_bluepetal.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0.08, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-5, 5), 0, 2, "ep_bluepetal.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0.08, 0)));

    lastProjectile = millis();
  }
}

// ELITE BOLTZYME
class EliteBoltzyme extends Enemy {

  EliteBoltzyme(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox, int defense, int superDefense, int hp) {
    super(position, velocity, orientation, scale, spriteName, hitbox, defense, superDefense, hp);
  }

  int value() {
    return 1000;
  }

  void update() {
    super.update();
    if (millis() - lastProjectile > 250)
      shoot();
  }

  void shoot() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y += 20;
    bulletPosition.x += 0;
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 3), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 3.5), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 4), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(5, 3), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(-0.1, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(5, 3.5), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(-0.1, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(5, 4), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(-0.1, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-5, 3), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0.1, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-5, 3.5), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0.1, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-5, 4), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0.1, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(5, 4), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(-0.08, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(5, 4.5), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(-0.08, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(5, 5), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(-0.08, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-5, 4), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0.08, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-5, 4.5), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0.08, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-5, 5), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0.08, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(1, 3), 0, 2, "ep_leaf_blood.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-1, 3), 0, 2, "ep_leaf_blood.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(3, 1), 0, 2, "ep_leaf_blood.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-3, 1), 0, 2, "ep_leaf_blood.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(2, 2), HALF_PI, 2, "ep_leaf_blood.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-2, 2), -HALF_PI, 2, "ep_leaf_blood.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(2, 4), 0, 2, "ep_leaf_blood.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-2, 4), 0, 2, "ep_leaf_blood.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(4, 2), 0, 2, "ep_leaf_blood.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-4, 2), 0, 2, "ep_leaf_blood.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(3, 3), HALF_PI, 2, "ep_leaf_blood.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-3, 3), -HALF_PI, 2, "ep_leaf_blood.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-0.7, -1), 0, 2, "ep_blood_wheel.png", new BoundingBox(new PVector(0, 0), new PVector(40, 40)), new PVector(0, 0.05)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0.7, -1), 0, 2, "ep_blood_wheel.png", new BoundingBox(new PVector(0, 0), new PVector(40, 40)), new PVector(0, 0.05)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, -1), 0, 2, "ep_blood_wheel.png", new BoundingBox(new PVector(0, 0), new PVector(40, 40)), new PVector(0, 0.06)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(1, -1), 0, 2, "ep_blood_wheel.png", new BoundingBox(new PVector(0, 0), new PVector(40, 40)), new PVector(0, 0.05)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-1, -1), 0, 2, "ep_blood_wheel.png", new BoundingBox(new PVector(0, 0), new PVector(40, 40)), new PVector(0, 0.05)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(4, -1), 0, 2, "ep_blood_wheel.png", new BoundingBox(new PVector(0, 0), new PVector(40, 40)), new PVector(-0.08, 0.05)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-4, -1), 0, 2, "ep_blood_wheel.png", new BoundingBox(new PVector(0, 0), new PVector(40, 40)), new PVector(0.08, 0.05)));


    lastProjectile = millis();
  }
}

// SPACE WANDERER
class SpaceWanderer extends Enemy {

  SpaceWanderer(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox, int defense, int superDefense, int hp) {
    super(position, velocity, orientation, scale, spriteName, hitbox, defense, superDefense, hp);
  }

  int value() {
    return 75;
  }

  void update() {
    super.update();
    if (millis() - lastProjectile > 1000)
      shoot();
  }

  void shoot() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y += 0;
    bulletPosition.x += 0;
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 3), 0, 2, "ep_water_bubble1.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(1.5, 1.5), 0, 2, "ep_water_bubble1.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(3, 0), 0, 2, "ep_water_bubble1.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, -3), 0, 2, "ep_water_bubble1.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-3, 0), 0, 2, "ep_water_bubble1.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(1.5, -1.5), 0, 2, "ep_water_bubble1.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-1.5, 1.5), 0, 2, "ep_water_bubble1.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-1.5, -1.5), 0, 2, "ep_water_bubble1.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    lastProjectile = millis();
  }
}

// ELITE SPACE WANDERER
class EliteSpaceWanderer extends Enemy {

  EliteSpaceWanderer(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox, int defense, int superDefense, int hp) {
    super(position, velocity, orientation, scale, spriteName, hitbox, defense, superDefense, hp);
  }

  int value() {
    return 175;
  }

  void update() {
    super.update();
    if (millis() - lastProjectile > 800)
      shoot();
  }

  void shoot() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y += 0;
    bulletPosition.x += 0;
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 3), 0, 2, "ep_water_bubble1.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0.1)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(1.5, 1.5), 0, 2, "ep_water_bubble1.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0.1)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(3, 0), 0, 2, "ep_water_bubble1.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0.1)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, -3), 0, 2, "ep_water_bubble1.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0.1)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-3, 0), 0, 2, "ep_water_bubble1.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0.1)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(1.5, -1.5), 0, 2, "ep_water_bubble1.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0.1)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-1.5, 1.5), 0, 2, "ep_water_bubble1.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0.1)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-1.5, -1.5), 0, 2, "ep_water_bubble1.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0.1)));
    lastProjectile = millis();
  }
}

// LILX
class LilX extends Enemy {

  LilX(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox, int defense, int superDefense, int hp) {
    super(position, velocity, orientation, scale, spriteName, hitbox, defense, superDefense, hp);
  }

  int value() {
    return 65;
  }

  void update() {
    super.update();
    if (millis() - lastProjectile > 3000 && difficulty == 1)
      shootEasy();
    if (millis() - lastProjectile > 2000 && difficulty == 2)
      shootNormal();
    if (millis() - lastProjectile > 1000 && difficulty == 3)
      shootHard();
  }

  void shootEasy() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y += 0;
    bulletPosition.x += 0;
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0.4, 0.4), 0, 2, "ep_greenball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-0.4, -0.4), 0, 2, "ep_greenball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-0.4, 0.4), 0, 2, "ep_greenball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0.4, -0.4), 0, 2, "ep_greenball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    lastProjectile = millis();
  }
  void shootNormal() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y += 0;
    bulletPosition.x += 0;
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0.5, 0.5), 0, 2, "ep_greenball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-0.5, -0.5), 0, 2, "ep_greenball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-0.5, 0.5), 0, 2, "ep_greenball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0.5, -0.5), 0, 2, "ep_greenball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    lastProjectile = millis();
  }
  void shootHard() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y += 0;
    bulletPosition.x += 0;
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0.1, 0.1), 0, 2, "ep_greenball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0.05, 0.05)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-0.1, -0.1), 0, 2, "ep_greenball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(-0.05, -0.05)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-0.1, 0.1), 0, 2, "ep_greenball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(-0.05, 0.05)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0.1, -0.1), 0, 2, "ep_greenball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0.05, -0.05)));
    lastProjectile = millis();
  }
}

// ELITE LILX
class EliteLilX extends Enemy {

  EliteLilX(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox, int defense, int superDefense, int hp) {
    super(position, velocity, orientation, scale, spriteName, hitbox, defense, superDefense, hp);
  }

  int value() {
    return 150;
  }

  void update() {
    super.update();
    if (millis() - lastProjectile > 1000)
      shoot();
  }

  void shoot() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y += 0;
    bulletPosition.x += 0;
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(1, 1), 0, 2, "ep_greenball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-1, -1), 0, 2, "ep_greenball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-1, 1), 0, 2, "ep_greenball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(1, -1), 0, 2, "ep_greenball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(1.5, 1.5), 0, 2, "ep_greenball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-1.5, -1.5), 0, 2, "ep_greenball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-1.5, 1.5), 0, 2, "ep_greenball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(1.5, -1.5), 0, 2, "ep_greenball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(2, 2), 0, 2, "ep_greenball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-2, -2), 0, 2, "ep_greenball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-2, 2), 0, 2, "ep_greenball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(2, -2), 0, 2, "ep_greenball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(2.5, 2.5), 0, 2, "ep_greenball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-2.5, -2.5), 0, 2, "ep_greenball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-2.5, 2.5), 0, 2, "ep_greenball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(2.5, -2.5), 0, 2, "ep_greenball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(3, 3), 0, 2, "ep_greenball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-3, -3), 0, 2, "ep_greenball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-3, 3), 0, 2, "ep_greenball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(3, -3), 0, 2, "ep_greenball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));



    lastProjectile = millis();
  }
}

// CHAOSEDRON
class Chaosedron extends Enemy {

  Chaosedron(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox, int defense, int superDefense, int hp) {
    super(position, velocity, orientation, scale, spriteName, hitbox, defense, superDefense, hp);
  }

  int value() {
    return 100;
  }

  void update() {
    super.update();
    if (millis() - lastProjectile > 1000)
      shoot();
  }

  void shoot() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y += 0;
    bulletPosition.x += 0;
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 4), 0, 2, "ep_blueball.png", new BoundingBox(new PVector(0, 0), new PVector(12, 12)), new PVector(0, -0.03)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, -4), 0, 2, "ep_blueball.png", new BoundingBox(new PVector(0, 0), new PVector(12, 12)), new PVector(0, 0.03)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(4, 0), 0, 2, "ep_blueball.png", new BoundingBox(new PVector(0, 0), new PVector(12, 12)), new PVector(-0.03, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-4, 0), 0, 2, "ep_blueball.png", new BoundingBox(new PVector(0, 0), new PVector(12, 12)), new PVector(0.03, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 2), 0, 2, "ep_blueball.png", new BoundingBox(new PVector(0, 0), new PVector(12, 12)), new PVector(0, -0.02)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, -2), 0, 2, "ep_blueball.png", new BoundingBox(new PVector(0, 0), new PVector(12, 12)), new PVector(0, 0.02)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(2, 0), 0, 2, "ep_blueball.png", new BoundingBox(new PVector(0, 0), new PVector(12, 12)), new PVector(-0.02, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-2, 0), 0, 2, "ep_blueball.png", new BoundingBox(new PVector(0, 0), new PVector(12, 12)), new PVector(0.02, 0)));
    lastProjectile = millis();
  }
}

// ELITE CHAOSEDRON
class EliteChaosedron extends Enemy {

  EliteChaosedron(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox, int defense, int superDefense, int hp) {
    super(position, velocity, orientation, scale, spriteName, hitbox, defense, superDefense, hp);
  }

  int value() {
    return 350;
  }

  void update() {
    super.update();
    if (millis() - lastProjectile > 1000)
      shoot();
  }

  void shoot() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y += 0;
    bulletPosition.x += 0;
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 4), 0, 2, "ep_bloodpseudoball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, -0.03)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, -4), 0, 2, "ep_bloodpseudoball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0.03)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(4, 0), 0, 2, "ep_bloodpseudoball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(-0.03, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-4, 0), 0, 2, "ep_bloodpseudoball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0.03, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 2), 0, 2, "ep_bloodpseudoball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, -0.02)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, -2), 0, 2, "ep_bloodpseudoball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0.02)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(2, 0), 0, 2, "ep_bloodpseudoball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(-0.02, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-2, 0), 0, 2, "ep_bloodpseudoball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0.02, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 5), 0, 2, "ep_bloodpseudoball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, -0.04)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, -5), 0, 2, "ep_bloodpseudoball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0.04)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(5, 0), 0, 2, "ep_bloodpseudoball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(-0.04, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-5, 0), 0, 2, "ep_bloodpseudoball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0.04, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 3), 0, 2, "ep_bloodpseudoball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, -0.03)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, -3), 0, 2, "ep_bloodpseudoball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0.03)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(3, 0), 0, 2, "ep_bloodpseudoball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(-0.03, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-3, 0), 0, 2, "ep_bloodpseudoball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0.03, 0)));
    lastProjectile = millis();
  }
}

// SPACE PARASITE
class SpaceParasite extends Enemy {
  int maxHP;

  SpaceParasite(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox, int defense, int superDefense, int hp,int maxHP) {
    super(position, velocity, orientation, scale, spriteName, hitbox, defense, superDefense, hp);
    this.maxHP = maxHP;
  }
  long lastproj2;
  long lastproj3;
  long lastproj4;
  long lastproj5;


  int value() {
    return 3000;
  }

  void update() {
    super.update();


    if (millis() - lastProjectile > 220)
      shoota();
    if (millis() - lastproj3 > 110 && hp <= maxHP * 0.75)
      shootb();
    if (millis() - lastproj4 > 55 && hp <= maxHP * 0.5)
      shootc();
    if (millis() - lastproj5 > 30 && hp <= maxHP * 0.25)
      shootd();
  }


  void shoota() {
    float shotx = random(-2, 2);
    float shoty = random(-2, 2);
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y += 0;
    bulletPosition.x += 0;
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(shotx, shoty), 0, 2, "ep_greenball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    lastProjectile = millis();
  }  
  void shootb() {
    float shotx = random(-2.5, 2.5);
    float shoty = random(-2.5, 2.5);
    float shotpx = random(-100, 100);

    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y += 0;
    bulletPosition.x += shotpx;
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(shotx, shoty), 0, 2, "ep_blueball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    lastproj3 = millis();
  }
  void shootc() {
    float shotx = random(-3.5, 3.5);
    float shoty = random(-3.5, 3.5);
    float shotpy = random(-100, 100);
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y += shotpy;
    bulletPosition.x += 0;
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(shotx, shoty), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    lastproj4 = millis();
  }
  void shootd() {
    float shotx = random(-4.5, 4.5);
    float shoty = random(-4.5, 4.5);
    float shotpx = random(-100, 100);
    float shotpy = random(-100, 100);

    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y += shotpy;
    bulletPosition.x += shotpx;
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(shotx, shoty), 0, 2, "ep_hyperball.png", new BoundingBox(new PVector(0, 0), new PVector(14, 14)), new PVector(0, 0)));
    lastproj5 = millis();
  }
}
// VERY FAT ROCKET
class VeryFatRocket extends Enemy {

  int maxHP;

  VeryFatRocket(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox, int defense, int superDefense, int hp, int maxHP) {
    super(position, velocity, orientation, scale, spriteName, hitbox, defense, superDefense, hp);
    this.maxHP = maxHP;
  }

  long lastproj2;
  long lastproj3;
  long lastproj4;
  long lastproj5;
  long lastproj6;
  long lastproj7;

  int value() {
    return 2000;
  }

  void update() {
    super.update();
    if (millis() - lastProjectile > 2000 && hp >= maxHP * 0.25)
      shoot();
    if (millis() - lastproj2 > 400 && hp >= maxHP * 0.25 && difficulty == 1)
      shoot2Easy();
    if (millis() - lastproj2 > 300 && hp >= maxHP * 0.25 && difficulty == 2)
      shoot2Normal();
    if (millis() - lastproj2 > 150 && hp >= maxHP * 0.25 && difficulty == 3)
      shoot2hard();
    if (millis() - lastproj3 > 3000  && hp <= maxHP * 0.75 && hp >= maxHP * 0.25 && difficulty == 1)
      shoot3Easy();
    if (millis() - lastproj3 > 1800  && hp <= maxHP * 0.75 && hp >= maxHP * 0.25 && difficulty == 2)
      shoot3Normal();
    if (millis() - lastproj3 > 500  && hp <= maxHP * 0.75 && hp >= maxHP * 0.25 && difficulty == 3)
      shoot3Hard();
    if (millis() - lastproj4 > 2000  && hp <= maxHP * 0.5 && hp >= maxHP * 0.25)
      shoot4();
    if (millis() - lastproj5 > 200  && hp <= maxHP * 0.25 && difficulty == 1)
      shoot5();
    if (millis() - lastproj5 > 200  && hp <= maxHP * 0.25 && difficulty == 2)
      shoot5();
    if (millis() - lastproj5 > 200  && hp <= maxHP * 0.25 && difficulty == 3)
      shoot5();
    if (millis() - lastproj6 > 250  && hp <= maxHP * 0.25)
      shoot6();
    if (millis() - lastproj7 > 2000  && hp <= maxHP * 0.25)
      shoot7();
  }


  void shoot() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y += -80;
    bulletPosition.x += 0;
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(1, -2), 0, 2, "ep_blood_wheel.png", new BoundingBox(new PVector(0, 0), new PVector(40, 40)), new PVector(0, 0.04)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-1, -2), 0, 2, "ep_blood_wheel.png", new BoundingBox(new PVector(0, 0), new PVector(40, 40)), new PVector(0, 0.04)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(2, -2), 0, 2, "ep_blood_wheel.png", new BoundingBox(new PVector(0, 0), new PVector(40, 40)), new PVector(0, 0.05)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-2, -2), 0, 2, "ep_blood_wheel.png", new BoundingBox(new PVector(0, 0), new PVector(40, 40)), new PVector(0, 0.05)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(3, -2), 0, 2, "ep_blood_wheel.png", new BoundingBox(new PVector(0, 0), new PVector(40, 40)), new PVector(0, 0.06)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-3, -2), 0, 2, "ep_blood_wheel.png", new BoundingBox(new PVector(0, 0), new PVector(40, 40)), new PVector(0, 0.06)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(4, -2), 0, 2, "ep_blood_wheel.png", new BoundingBox(new PVector(0, 0), new PVector(40, 40)), new PVector(0, 0.07)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-4, -2), 0, 2, "ep_blood_wheel.png", new BoundingBox(new PVector(0, 0), new PVector(40, 40)), new PVector(0, 0.07)));
    lastProjectile = millis();
  }
  void shoot2Easy() {
    PVector bulletPosition = new PVector(position.x, position.y);
    float shotx = random(-2, 2);
    float shoty = random(-2, 2);
    bulletPosition.y += 80;
    bulletPosition.x += 0;
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(shotx, shoty), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(16, 16)), new PVector(0, 0)));
    lastproj2 = millis();
  }
  void shoot2Normal() {
    PVector bulletPosition = new PVector(position.x, position.y);
    float shotx = random(-3, 3);
    float shoty = random(-3, 3);
    bulletPosition.y += 80;
    bulletPosition.x += 0;
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(shotx, shoty), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(16, 16)), new PVector(0, 0)));
    lastproj2 = millis();
  }
  void shoot2hard() {
    PVector bulletPosition = new PVector(position.x, position.y);
    float shotx = random(-4, 4);
    float shoty = random(-4, 4);
    bulletPosition.y += 80;
    bulletPosition.x += 0;
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(shotx, shoty), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(16, 16)), new PVector(0, 0)));
    lastproj2 = millis();
  }
  void shoot3Easy() {
    PVector bulletPosition = new PVector(position.x, position.y);
    float shot = random(-80, 80);
    bulletPosition.y += 80;
    bulletPosition.x += shot;
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 1), 0, 2, "ep_bloodpseudoball.png", new BoundingBox(new PVector(0, 0), new PVector(22, 22)), new PVector(0, 0)));
    lastproj3 = millis();
  }
  void shoot3Normal() {
    PVector bulletPosition = new PVector(position.x, position.y);
    float shot = random(-280, 280);
    bulletPosition.y += 80;
    bulletPosition.x += shot;
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 1.5), 0, 2, "ep_bloodpseudoball.png", new BoundingBox(new PVector(0, 0), new PVector(22, 22)), new PVector(0, 0)));
    lastproj3 = millis();
  }
  void shoot3Hard() {
    PVector bulletPosition = new PVector(position.x, position.y);
    float shot = random(-580, 580);
    bulletPosition.y += 80;
    bulletPosition.x += shot;
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 2), 0, 2, "ep_bloodpseudoball.png", new BoundingBox(new PVector(0, 0), new PVector(22, 22)), new PVector(0, 0)));
    lastproj3 = millis();
  }
  void shoot4() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y += 80;
    bulletPosition.x += 0;
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 2), 0, 2, "ep_leaf_blood.png", new BoundingBox(new PVector(0, 0), new PVector(22, 22)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(2, 2), 0, 2, "ep_leaf_blood.png", new BoundingBox(new PVector(0, 0), new PVector(22, 22)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, -2), 0, 2, "ep_leaf_blood.png", new BoundingBox(new PVector(0, 0), new PVector(22, 22)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-2, 2), 0, 2, "ep_leaf_blood.png", new BoundingBox(new PVector(0, 0), new PVector(22, 22)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-2, 0), 0, 2, "ep_leaf_blood.png", new BoundingBox(new PVector(0, 0), new PVector(22, 22)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(2, -2), 0, 2, "ep_leaf_blood.png", new BoundingBox(new PVector(0, 0), new PVector(22, 22)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(-2, -2), 0, 2, "ep_leaf_blood.png", new BoundingBox(new PVector(0, 0), new PVector(22, 22)), new PVector(0, 0)));
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(2, 0), 0, 2, "ep_leaf_blood.png", new BoundingBox(new PVector(0, 0), new PVector(22, 22)), new PVector(0, 0)));
    lastproj4 = millis();
  }
  void shoot5() {
    PVector bulletPosition = new PVector(position.x, position.y);
    float shotx = random(-2, 2);
    float shoty = random(-2, 2);
    float shotposx = random(-80, 80);
    float shotposy = random(-80, 80);
    bulletPosition.y += shotposy;
    bulletPosition.x += shotposx;
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(shotx, shoty), 0, 2, "ep_bloodball.png", new BoundingBox(new PVector(0, 0), new PVector(16, 16)), new PVector(0, 0)));
    lastproj5 = millis();
  }

  void shoot6() {
    PVector bulletPosition = new PVector(position.x, position.y);
    float shotx = random(-3, 3);
    float shoty = random(-3, 3);
    float shotposx = random(-80, 80);
    float shotposy = random(-80, 80);
    bulletPosition.y += shotposy;
    bulletPosition.x += shotposx;
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(shotx, shoty), 0, 2, "ep_blood_wheel.png", new BoundingBox(new PVector(0, 0), new PVector(40, 40)), new PVector(0, 0.02)));
    lastproj6 = millis();
  }

  void shoot7() {
    PVector bulletPosition = new PVector(position.x, position.y);
    float shotposx = random(-80, 80);
    bulletPosition.y += 80;
    bulletPosition.x += shotposx;
    commonEnemyProjectiles.add(new CommonEnemyProjectile(bulletPosition, new PVector(0, 1), 0, 2, "ep_bloodpseudoball.png", new BoundingBox(new PVector(0, 0), new PVector(22, 22)), new PVector(0, 0)));
    lastproj7 = millis();
  }
}