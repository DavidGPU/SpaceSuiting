abstract class MenuObject extends GameObject { //<>// //<>// //<>// //<>//
  boolean isClicked;
  abstract boolean isDestroyedOnClick();
  abstract boolean doesInstantClick();
  MenuObject(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox) {
    super(position, velocity, orientation, scale, spriteName, hitbox);
  }
  abstract void menuSpawn();
  void update() {
    super.update();
    if (mousePressed && mouseY >= hitbox.position.y - hitbox.size.y / 2 && mouseX >= hitbox.position.x - hitbox.size.x / 2 && mouseY <= hitbox.position.y + hitbox.size.y / 2 && mouseX <= hitbox.position.x + hitbox.size.x / 2) {
      menuSpawn();
    }
    if (mousePressed && mouseY >= hitbox.position.y - hitbox.size.y / 2 && mouseX >= hitbox.position.x - hitbox.size.x / 2 && mouseY <= hitbox.position.y + hitbox.size.y / 2 && mouseX <= hitbox.position.x + hitbox.size.x / 2 && doesInstantClick() == true) {
      long delay = 0;
      if (millis() - delay >= 100) {
        isClicked = true;
      }
    }
  }
}

class StarGame extends MenuObject {
  boolean isDestroyedOnClick() {
    return true;
  }
  boolean doesInstantClick() {
    return true;
  }
  StarGame(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox) {
    super(position, velocity, orientation, scale, spriteName, hitbox);
  }
  void menuSpawn() {
    createDifficulties();
  }
}
class VeryEasyButton extends MenuObject {
  boolean isDestroyedOnClick() {
    return true;
  }
  boolean doesInstantClick() {
    return true;
  }
  VeryEasyButton(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox) {
    super(position, velocity, orientation, scale, spriteName, hitbox);
  }
  void menuSpawn() {
    difficulty = 0.5;
    createCharactersToChoose();
    difficultyHasBeenChosen = true;
  }
}
class EasyButton extends MenuObject {
  boolean isDestroyedOnClick() {
    return true;
  }
  boolean doesInstantClick() {
    return true;
  }

  EasyButton(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox) {
    super(position, velocity, orientation, scale, spriteName, hitbox);
  }
  void menuSpawn() {
    difficulty = 1;
    createCharactersToChoose();
    difficultyHasBeenChosen = true;
  }
}
class NormalButton extends MenuObject {
  boolean isDestroyedOnClick() {
    return true;
  }
  boolean doesInstantClick() {
    return true;
  }
  NormalButton(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox) {
    super(position, velocity, orientation, scale, spriteName, hitbox);
  }
  void menuSpawn() {
    difficulty = 2;
    createCharactersToChoose();
    difficultyHasBeenChosen = true;
  }
}
class HardButton extends MenuObject {
  boolean isDestroyedOnClick() {
    return true;
  }
  boolean doesInstantClick() {
    return true;
  }
  HardButton(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox) {
    super(position, velocity, orientation, scale, spriteName, hitbox);
  }
  void menuSpawn() {
    difficulty = 3;
    createCharactersToChoose();
    difficultyHasBeenChosen = true;
  }
}
class InsaneButton extends MenuObject {
  boolean isDestroyedOnClick() {
    return true;
  }
  boolean doesInstantClick() {
    return true;
  }
  InsaneButton(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox) {
    super(position, velocity, orientation, scale, spriteName, hitbox);
  }
  void menuSpawn() {
    difficulty = 4;
    createCharactersToChoose();
    difficultyHasBeenChosen = true;
  }
}
abstract class CharacterButton extends MenuObject {
  int currentCharacterSubtype = 1;
  boolean isDestroyedOnClick() {
    return true;
  }
  CharacterButton(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox) {
    super(position, velocity, orientation, scale, spriteName, hitbox);
  }
  void update() {
    super.update();
    if (oneKeyPressed) {
      currentCharacterSubtype = 1;
    }
    if (twoKeyPressed) {
      currentCharacterSubtype = 2;
    }
    if (threeKeyPressed) {
      currentCharacterSubtype = 3;
    }
  }
}
class SpaceBeeButton extends CharacterButton {
  boolean doesInstantClick() {
    return false;
  }
  SpaceBeeButton(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox) {
    super(position, velocity, orientation, scale, spriteName, hitbox);
  }
  void menuSpawn() {
    createLevel();
    playerHasBeenChosen = true;
  }
  void menuSpawnNormal() {
    createSpaceBee();
    createLevel();
    playerHasBeenChosen = true;
  }
  void menuSpawnGold() {
    createSpaceBeeGold();
    createLevel();
    playerHasBeenChosen = true;
  }
  void menuSpawnArtifact() {
    createSpaceBeeReaper();
    createLevel();
    playerHasBeenChosen = true;
  }
  void update() {
    super.update();
    if (currentCharacterSubtype == 1) {
      sprite = pixelationOf(loadImage("player_space_bee.png"), 3);
    }
    if (currentCharacterSubtype == 2) {
      sprite = pixelationOf(loadImage("player_space_bee_gold.png"), 3);
    }
    if (currentCharacterSubtype == 3) {
      sprite = pixelationOf(loadImage("player_space_bee_reaper.png"), 3);
    }
    if (mousePressed && mouseY >= hitbox.position.y - hitbox.size.y / 2 && mouseX >= hitbox.position.x - hitbox.size.x / 2 && mouseY <= hitbox.position.y + hitbox.size.y / 2 && mouseX <= hitbox.position.x + hitbox.size.x / 2 && currentCharacterSubtype == 1) {
      menuSpawnNormal();
      isClicked = true;
    }
    if (mousePressed && mouseY >= hitbox.position.y - hitbox.size.y / 2 && mouseX >= hitbox.position.x - hitbox.size.x / 2 && mouseY <= hitbox.position.y + hitbox.size.y / 2 && mouseX <= hitbox.position.x + hitbox.size.x / 2 && currentCharacterSubtype == 2) {
      menuSpawnGold();
      isClicked = true;
    }
    if (mousePressed && mouseY >= hitbox.position.y - hitbox.size.y / 2 && mouseX >= hitbox.position.x - hitbox.size.x / 2 && mouseY <= hitbox.position.y + hitbox.size.y / 2 && mouseX <= hitbox.position.x + hitbox.size.x / 2 && currentCharacterSubtype == 3) {
      menuSpawnArtifact();
      isClicked = true;
    }
  }
}
class SpotNickButton extends CharacterButton {
  SpotNickButton(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox) {
    super(position, velocity, orientation, scale, spriteName, hitbox);
  }
  boolean doesInstantClick() {
    return false;
  }
  void menuSpawn() {
    createLevel();
    playerHasBeenChosen = true;
  }
  void menuSpawnNormal() {
    createSpotNick();
    createLevel();
    playerHasBeenChosen = true;
  }
  void menuSpawnGold() {
    createSpotNickGold();
    createLevel();
    playerHasBeenChosen = true;
  }
  void menuSpawnArtifact() {
    createSpotNickSand();
    createLevel();
    playerHasBeenChosen = true;
  }

  void update() {
    super.update();
    if (currentCharacterSubtype == 1) {
      sprite = pixelationOf(loadImage("player_spot_nick.png"), 3);
    }
    if (currentCharacterSubtype == 2) {
      sprite = pixelationOf(loadImage("player_spot_nick_gold.png"), 3);
    }
    if (currentCharacterSubtype == 3) {
      sprite = pixelationOf(loadImage("player_spot_nick_sand.png"), 3);
    }
    if (mousePressed && mouseY >= hitbox.position.y - hitbox.size.y / 2 && mouseX >= hitbox.position.x - hitbox.size.x / 2 && mouseY <= hitbox.position.y + hitbox.size.y / 2 && mouseX <= hitbox.position.x + hitbox.size.x / 2 && currentCharacterSubtype == 1) {
      menuSpawnNormal();
      isClicked = true;
    }
    if (mousePressed && mouseY >= hitbox.position.y - hitbox.size.y / 2 && mouseX >= hitbox.position.x - hitbox.size.x / 2 && mouseY <= hitbox.position.y + hitbox.size.y / 2 && mouseX <= hitbox.position.x + hitbox.size.x / 2 && currentCharacterSubtype == 2) {
      menuSpawnGold();
      isClicked = true;
    }
    if (mousePressed && mouseY >= hitbox.position.y - hitbox.size.y / 2 && mouseX >= hitbox.position.x - hitbox.size.x / 2 && mouseY <= hitbox.position.y + hitbox.size.y / 2 && mouseX <= hitbox.position.x + hitbox.size.x / 2 && currentCharacterSubtype == 3) {
      menuSpawnArtifact();
      isClicked = true;
    }
  }
}
class MightShooterButton extends CharacterButton {
  MightShooterButton(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox) {
    super(position, velocity, orientation, scale, spriteName, hitbox);
  }
  boolean doesInstantClick() {
    return false;
  }
  void menuSpawn() {
    createLevel();
    playerHasBeenChosen = true;
  }
  void menuSpawnNormal() {
    createMightShooter();
    createLevel();
    playerHasBeenChosen = true;
  }
  void menuSpawnGold() {
    createMightShooterGold();
    createLevel();
    playerHasBeenChosen = true;
  }
  void menuSpawnArtifact() {
    createMightShooterIce();
    createLevel();
    playerHasBeenChosen = true;
  }
  void update() {
    super.update();
    if (currentCharacterSubtype == 1) {
      sprite = pixelationOf(loadImage("player_might_shooter.png"), 3);
    }
    if (currentCharacterSubtype == 2) {
      sprite = pixelationOf(loadImage("player_might_shooter_gold.png"), 3);
    }
    if (currentCharacterSubtype == 3) {
      sprite = pixelationOf(loadImage("player_might_shooter_ice.png"), 3);
    }
    if (mousePressed && mouseY >= hitbox.position.y - hitbox.size.y / 2 && mouseX >= hitbox.position.x - hitbox.size.x / 2 && mouseY <= hitbox.position.y + hitbox.size.y / 2 && mouseX <= hitbox.position.x + hitbox.size.x / 2 && currentCharacterSubtype == 1) {
      menuSpawnNormal();
      isClicked = true;
    }
    if (mousePressed && mouseY >= hitbox.position.y - hitbox.size.y / 2 && mouseX >= hitbox.position.x - hitbox.size.x / 2 && mouseY <= hitbox.position.y + hitbox.size.y / 2 && mouseX <= hitbox.position.x + hitbox.size.x / 2 && currentCharacterSubtype == 2) {
      menuSpawnGold();
      isClicked = true;
    }
    if (mousePressed && mouseY >= hitbox.position.y - hitbox.size.y / 2 && mouseX >= hitbox.position.x - hitbox.size.x / 2 && mouseY <= hitbox.position.y + hitbox.size.y / 2 && mouseX <= hitbox.position.x + hitbox.size.x / 2 && currentCharacterSubtype == 3) {
      menuSpawnArtifact();
      isClicked = true;
    }
  }
}
class TriShooterButton extends CharacterButton {
  TriShooterButton(PVector position, PVector velocity, float orientation, int scale, String spriteName, BoundingBox hitbox) {
    super(position, velocity, orientation, scale, spriteName, hitbox);
  }
  boolean doesInstantClick() {
    return false;
  }
  void menuSpawn() {
    createLevel();
    playerHasBeenChosen = true;
  }
  void menuSpawnNormal() {
    createTriShooter();
    createLevel();
    playerHasBeenChosen = true;
  }
  void menuSpawnGold() {
    createTriShooterGold();
    createLevel();
    playerHasBeenChosen = true;
  }
  void menuSpawnArtifact() {
    createTriShooterNeon();
    createLevel();
    playerHasBeenChosen = true;
  }
  void update() {
    super.update();
    if (currentCharacterSubtype == 1) {
      sprite = pixelationOf(loadImage("player_trishooter.png"), 3);
    }
    if (currentCharacterSubtype == 2) {
      sprite = pixelationOf(loadImage("player_trishooter_gold.png"), 3);
    }
    if (currentCharacterSubtype == 3) {
      sprite = pixelationOf(loadImage("player_trishooter_neon.png"), 3);
    }
    if (mousePressed && mouseY >= hitbox.position.y - hitbox.size.y / 2 && mouseX >= hitbox.position.x - hitbox.size.x / 2 && mouseY <= hitbox.position.y + hitbox.size.y / 2 && mouseX <= hitbox.position.x + hitbox.size.x / 2 && currentCharacterSubtype == 1) {
      menuSpawnNormal();
      isClicked = true;
    }
    if (mousePressed && mouseY >= hitbox.position.y - hitbox.size.y / 2 && mouseX >= hitbox.position.x - hitbox.size.x / 2 && mouseY <= hitbox.position.y + hitbox.size.y / 2 && mouseX <= hitbox.position.x + hitbox.size.x / 2 && currentCharacterSubtype == 2) {
      menuSpawnGold();
      isClicked = true;
    }
    if (mousePressed && mouseY >= hitbox.position.y - hitbox.size.y / 2 && mouseX >= hitbox.position.x - hitbox.size.x / 2 && mouseY <= hitbox.position.y + hitbox.size.y / 2 && mouseX <= hitbox.position.x + hitbox.size.x / 2 && currentCharacterSubtype == 3) {
      menuSpawnArtifact();
      isClicked = true;
    }
  }
}