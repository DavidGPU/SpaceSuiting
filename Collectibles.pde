class DamageCollectible extends GameObject {

  
    DamageCollectible(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox) {
super(position, velocity, orientation, scale, spriteName, hitbox);
    }
    boolean collected = false;
    
      void update() {
    for (Spaceship s : spaceships) {
      if (isCollidingWith(s)) {
        collected = true;
      }
    }

    super.update();
  }

}
class HealthCollectible extends GameObject {

    boolean isOffScreen2() {
    return position.y - sprite.height / 2 > height;
  }

  
    HealthCollectible(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox) {
super(position, velocity, orientation, scale, spriteName, hitbox);
    }
    boolean collected = false;
    
      void update() {
    for (Spaceship s : spaceships) {
      if (isCollidingWith(s)) {
        collected = true;
      }
    }

    super.update();
  }

}
class HealthCollectibleForSale extends GameObject {

    boolean isOffScreen2() {
    return position.y - sprite.height / 2 > height;
  }

  
    HealthCollectibleForSale(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox) {
super(position, velocity, orientation, scale, spriteName, hitbox);
    }
    boolean collected = false;
    
      void update() {
    for (Spaceship s : spaceships) {
      if (isCollidingWith(s) && vKeyPressed && money >= 100) {
        collected = true;
        money -= 100;
      }
    }

    super.update();
  }

}
class SuperDamageCollectibleForSale extends GameObject {

  
    SuperDamageCollectibleForSale(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox) {
super(position, velocity, orientation, scale, spriteName, hitbox);
    }
    boolean collected = false;
    
      void update() {
    for (Spaceship s : spaceships) {
      if (isCollidingWith(s) && vKeyPressed && money >= 75) {
        collected = true;
        money -= 75;
      }
    }

    super.update();
  }

}
class CrimnerForSale extends GameObject {

  CrimnerForSale(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox) {
super(position, velocity, orientation, scale, spriteName, hitbox);
    }
    boolean collected = false;
    
      void update() {
    for (Spaceship s : spaceships) {
      if (isCollidingWith(s) && vKeyPressed && money >= 500) {
        collected = true;
        money -= 500;
      }
    }

    super.update();
  }

}