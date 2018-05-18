abstract class GameObject {
  PVector position;
  PVector velocity;
  float orientation;
  PGraphics sprite;
  BoundingBox hitbox;

  GameObject(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox) {
    this.position = position.copy();
    this.velocity = velocity.copy();
    this.orientation = orientation;
    sprite = pixelationOf(loadImage(spriteName), scale);
    this.hitbox = hitbox;
  }

  void update() {
    position.add(velocity);
    hitbox.position.set(position);
  }

  boolean isOffScreen() {
    return position.x + sprite.width / 2 < 0 || position.x - sprite.width / 2 > width || position.y + sprite.height / 2 < 0 || position.y - sprite.height / 2 > height;
  }

  boolean isCollidingWith(GameObject other) {
    float thisLeft = this.hitbox.position.x - this.hitbox.size.x / 2;    
    float thisTop = this.hitbox.position.y - this.hitbox.size.y / 2; 
    float thisRight = this.hitbox.position.x + this.hitbox.size.x / 2;
    float thisBottom = this.hitbox.position.y + this.hitbox.size.y / 2;

    float otherLeft = other.hitbox.position.x - other.hitbox.size.x / 2;
    float otherTop = other.hitbox.position.y - other.hitbox.size.y / 2;    
    float otherRight = other.hitbox.position.x + other.hitbox.size.x / 2;
    float otherBottom = other.hitbox.position.y + other.hitbox.size.y / 2;

    return 
      thisRight > otherLeft && 
      thisLeft < otherRight && 
      thisBottom > otherTop && 
      thisTop < otherBottom;
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
    noFill();
  }
}