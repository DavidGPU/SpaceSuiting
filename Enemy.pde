abstract class  Enemy extends GameObject {
  PVector healthBarPos = new PVector(position.x + (width * 0.5), position.y + (height * 1.2));
  PVector liveHealthBarSize = new PVector(this.hp * 0.1, 6);
  PVector maxHealthBarSize = new PVector(this.hpMax * 0.1, 6);
  int defense;
  int superDefense;
  int hp;
  int hpMax;
  long lastProjectile;
  float dropChance = random(4);

  Enemy(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox, int defense, int superDefense, int hp) {
    super(position, velocity, orientation, scale, spriteName, hitbox);
    this.defense = defense;
    this.superDefense = superDefense;
    this.hp = hp;
    this.hpMax = hp;
    lastProjectile = millis();
  }  
  abstract int value();

  boolean isDead() {
    return hp <= 0;
  }

  boolean isDownTheScreen() {
    return position.x >= height * 2;
  }


  void update() {
    for (PlayerProjectile pp : playerProjectiles) {
      if (this.isCollidingWith(pp)) {
        hp -= pp.damage;
      }
    }
    super.update();
    if (isDead()) {
      points += value();
      money += value();
      spawnDamageCollectible();
    }
    if (isDead() && dropChance >= 0 && dropChance <= 1) 
      spawnDamageCollectible2();
  }

  void spawnDamageCollectible() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y += 0;
    bulletPosition.x += 0;
    damageCollectibles.add(new DamageCollectible(bulletPosition, new PVector(0, 0.8), 0, 2, "collectible_stats.png", new BoundingBox(new PVector(0, 0), new PVector(16, 16))));
    lastProjectile = millis();
  }
  void spawnDamageCollectible2() {
    PVector bulletPosition = new PVector(position.x, position.y);
    bulletPosition.y += 16;
    bulletPosition.x += 16;
    damageCollectibles.add(new DamageCollectible(bulletPosition, new PVector(0, 0.8), 0, 2, "collectible_stats.png", new BoundingBox(new PVector(0, 0), new PVector(16, 16))));
    lastProjectile = millis();
  }


  void display() {
    pushMatrix();
    translate(position.x, position.y);

    pushStyle();
    imageMode(CENTER);
    image(sprite, 0, 0);
    fill(255, 0, 0);
    rect(healthBarPos.x, healthBarPos.y, liveHealthBarSize.x, liveHealthBarSize.y);
    fill(10, 10, 10);
    rect(healthBarPos.x, healthBarPos.y, maxHealthBarSize.x, maxHealthBarSize.y);
    popStyle();

    popMatrix();
  }
}