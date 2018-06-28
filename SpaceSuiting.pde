
import processing.sound.*;
SoundFile backgroundMusic;
SoundFile soundEffect;

//Add Peter Lager in Special Thanks in credits

int redness;
int greeness;
int blueness;
PFont font;
int points; //The score of the player
int money; //Stuff to spend on teams
float difficulty = 1; //You can change this from 1 to 3, trying different numbers will do strange things

float getAngle_In_Degrees(float pX1, float pY1, float pX2, float pY2) {
  return atan2(pY2 - pY1, pX2 - pX1);
}

enum GameState
{
  GAME_STATE_RUNNING, 
    GAME_STATE_PAUSED,
}

ArrayList<Spaceship> spaceships;
ArrayList<DeathBallEffect>deathBallEffects;
ArrayList<PlayerProjectile> playerProjectiles;
ArrayList<Enemy> enemies;
ArrayList<Enemy> bossEnemies1;
ArrayList<Enemy> bossEnemies2;
ArrayList<CommonEnemyProjectile> commonEnemyProjectiles;
ArrayList<DamageCollectible> damageCollectibles;
ArrayList<HealthCollectible> healthCollectibles;
ArrayList<HealthCollectibleForSale> healthCollectiblesForSale;
ArrayList<SuperDamageCollectibleForSale> superDamageCollectiblesForSale;
ArrayList<CrimnerForSale> crimnersForSale;
ArrayList<SpawnManager> spawnManagers;
ArrayList<MenuObject> menuObjects;
ArrayList<MenuObject> menuObjects2;
ArrayList<MenuObject> menuObjects3;
//coolest projects ate 25 the marco

boolean leftKeyPressed = false;
boolean rightKeyPressed = false;
boolean upKeyPressed = false;
boolean downKeyPressed = false;
boolean shiftKeyPressed = false;
boolean zKeyPressed = false;
boolean cKeyPressed = false;
boolean vKeyPressed = false;
boolean zeroKeyPressed = false;
boolean oneKeyPressed = false;
boolean twoKeyPressed = false;
boolean threeKeyPressed = false;
boolean fourKeyPressed = false;
boolean isPaused = false;

boolean difficultyHasBeenChosen = false;
boolean playerHasBeenChosen = false;


void displaySpace() { //The background
  fill(255, 168, 0);
  ellipse(1000, 300, 125, 125);
  fill(255, 255, 255);
  ellipse(1000, 600, 10, 10);
  ellipse(900, 600, 10, 10);
  ellipse(100, 134, 10, 10);
  ellipse(105, 150, 10, 10);
  ellipse(1000, 700, 10, 10);
  ellipse(1000, 400, 10, 10);
  ellipse(300, 500, 10, 10);
  ellipse(600, 600, 10, 10);
  fill(220, 0, 0);
  ellipse(860, 350, 68, 68);
}


void setup() {
  font = createFont("Arial", 16, true);
  points = 0;
  size(1400, 1000);
  noSmooth();
  frameRate(60);
  backgroundMusic = new SoundFile(this, "Yayeyi.flac"); //The music that plays

  playerProjectiles = new ArrayList<PlayerProjectile>();
  deathBallEffects = new ArrayList<DeathBallEffect>();

  damageCollectibles = new ArrayList<DamageCollectible>();
  healthCollectibles = new ArrayList<HealthCollectible>();
  healthCollectiblesForSale = new ArrayList<HealthCollectibleForSale>();
  superDamageCollectiblesForSale = new ArrayList<SuperDamageCollectibleForSale>();
  crimnersForSale = new ArrayList<CrimnerForSale>();

  spaceships = new ArrayList<Spaceship>();

  commonEnemyProjectiles = new ArrayList<CommonEnemyProjectile>();

  enemies = new ArrayList<Enemy>();
  bossEnemies1 = new ArrayList<Enemy>();
  bossEnemies2 = new ArrayList<Enemy>();

  spawnManagers = new ArrayList<SpawnManager>();
  menuObjects = new ArrayList<MenuObject>();
  menuObjects2 = new ArrayList<MenuObject>();
  menuObjects3 = new ArrayList<MenuObject>();

  MenuObject mo = new StarGame(new PVector(width / 2, height / 2 - 300), new PVector(0, 0), 0, 2, "menu_star.png", new BoundingBox(new PVector(0, 0), new PVector(100, 40)));
  menuObjects.add(mo);

  backgroundMusic.loop();
}

void createLevel() {
  SpawnManager spawnManager = new SpawnManager(10, 0, 0);
  spawnManagers.add(spawnManager);
}
void createDifficulties() {
  menuObjects2.add(new VeryEasyButton(new PVector(width / 2, height / 2 - 80), new PVector(0, 0), 0, 4, "modesymbol_veryeasy.png", new BoundingBox(new PVector(0, 0), new PVector(40, 40))));
  menuObjects2.add(new EasyButton(new PVector(width / 2, height / 2 - 40), new PVector(0, 0), 0, 4, "modesymbol_easy.png", new BoundingBox(new PVector(0, 0), new PVector(40, 40))));
  menuObjects2.add(new NormalButton(new PVector(width / 2, height / 2), new PVector(0, 0), 0, 4, "modesymbol_normal.png", new BoundingBox(new PVector(0, 0), new PVector(40, 40))));
  menuObjects2.add(new HardButton(new PVector(width / 2, height / 2 + 40), new PVector(0, 0), 0, 4, "modesymbol_hard.png", new BoundingBox(new PVector(0, 0), new PVector(40, 40))));
  menuObjects2.add(new InsaneButton(new PVector(width / 2, height / 2 + 80), new PVector(0, 0), 0, 4, "modesymbol_insane.png", new BoundingBox(new PVector(0, 0), new PVector(40, 40))));
}
void createCharactersToChoose() {
  menuObjects3.add(new SpaceBeeButton(new PVector(width / 2 - 200, height / 2 - 80), new PVector(0, 0), -HALF_PI, 3, "player_space_bee.png", new BoundingBox(new PVector(0, 0), new PVector(60, 60))));
  menuObjects3.add(new SpotNickButton(new PVector(width / 2 - 120, height / 2 - 80), new PVector(0, 0), 0, 3, "player_spot_nick.png", new BoundingBox(new PVector(0, 0), new PVector(60, 60))));
  menuObjects3.add(new MightShooterButton(new PVector(width / 2, height / 2 - 80), new PVector(0, 0), 0, 3, "player_might_shooter.png", new BoundingBox(new PVector(0, 0), new PVector(60, 60))));
  menuObjects3.add(new TriShooterButton(new PVector(width / 2 + 120, height / 2 - 80), new PVector(0, 0), 0, 3, "player_trishooter.png", new BoundingBox(new PVector(0, 0), new PVector(60, 60))));
}
void createSpaceBee() {
  Spaceship spaceship = new SpaceBee(new PVector(700, 400), new PVector(0, 0), -HALF_PI, 2, "player_space_bee.png", new BoundingBox(new PVector(0, 0), new PVector(12, 12)), 9, 0, 9);
  spaceships.add(spaceship);
}
void createSpotNick() {
  Spaceship spaceship = new SpotNick(new PVector(700, 400), new PVector(0, 0), 0, 2, "player_spot_nick.png", new BoundingBox(new PVector(0, 0), new PVector(12, 12)), 9, 0, 7);
  spaceships.add(spaceship);
}
void createMightShooter() {
  Spaceship spaceship = new MightShooter(new PVector(700, 400), new PVector(0, 0), 0, 2, "player_might_shooter.png", new BoundingBox(new PVector(0, 0), new PVector(12, 12)), 9, 0, 40);
  spaceships.add(spaceship);
}
void createTriShooter() {
  Spaceship spaceship = new TriShooter(new PVector(700, 400), new PVector(0, 0), 0, 2, "player_trishooter.png", new BoundingBox(new PVector(0, 0), new PVector(12, 12)), 9, 0, 6);
  spaceships.add(spaceship);
}

void draw() {
  ArrayList<GameObject> zombies = new ArrayList<GameObject>();
  ArrayList<DeathBallEffect> DBEzombies = new ArrayList<DeathBallEffect>();

  if (key == 'p' || key == 'P' && isPaused)
    isPaused = false;
  if (key == 'p' || key == 'P' && isPaused == false)
    isPaused = true;

  for (PlayerProjectile projectille : playerProjectiles) {
    projectille.update();
    if (projectille.isOffScreen() || projectille.hit == true)
      zombies.add(projectille);
    if (projectille.hit == true)
      points += 2;
  }
  for (MenuObject mo : menuObjects) {
    mo.update();
    if (mo.isClicked && mo.isDestroyedOnClick())
      zombies.add(mo);
  }
  for (MenuObject mo : menuObjects2) {
    mo.update();
    if ((mo.isClicked || difficultyHasBeenChosen) && mo.isDestroyedOnClick())
      zombies.add(mo);
  }
  for (MenuObject mo : menuObjects3) {
    mo.update();
    if ((mo.isClicked || playerHasBeenChosen) && mo.isDestroyedOnClick())
      zombies.add(mo);
  }
  for (DeathBallEffect dbe : deathBallEffects) {
    dbe.update();
    if (dbe.isGone())
      DBEzombies.add(dbe);
  }
  for (MotherEnemyProjectile projectille : commonEnemyProjectiles) {
    projectille.update();
    if (projectille.isOffScreen() || projectille.hit == true)
      zombies.add(projectille);
  }
  for (DamageCollectible damageCollectible : damageCollectibles) {
    damageCollectible.update();
    if (damageCollectible.isOffScreen() || damageCollectible.collected == true)
      zombies.add(damageCollectible);
    if (damageCollectible.collected == true)
      points += 5;
  }
  for (HealthCollectible healthCollectible : healthCollectibles) {
    healthCollectible.update();
    if (healthCollectible.isOffScreen2() || healthCollectible.collected == true)
      zombies.add(healthCollectible);
  }
  for (HealthCollectibleForSale healthCollectibleForSale : healthCollectiblesForSale) {
    healthCollectibleForSale.update();
    if (healthCollectibleForSale.isOffScreen2() || healthCollectibleForSale.collected == true)
      zombies.add(healthCollectibleForSale);
  }
  for (SuperDamageCollectibleForSale superDamageCollectibleForSale : superDamageCollectiblesForSale) {
    superDamageCollectibleForSale.update();
    if (superDamageCollectibleForSale.isOffScreen() || superDamageCollectibleForSale.collected == true)
      zombies.add(superDamageCollectibleForSale);
  }
  for (CrimnerForSale crimnerForSale : crimnersForSale) {
    crimnerForSale.update();
    if (crimnerForSale.isOffScreen() || crimnerForSale.collected == true)
      zombies.add(crimnerForSale);
  }
  for (Spaceship spaceship : spaceships) {
    spaceship.update();
    if (spaceship.isDead())
      zombies.add(spaceship);
  }
  for (Enemy enemy : enemies) {
    enemy.update();
    if (enemy.isDead())
      zombies.add(enemy);
    if (enemy.isDownTheScreen())
      zombies.add(enemy);
  }
  for (Enemy be1 : bossEnemies1) {
    for (SpawnManager sm : spawnManagers) {
      be1.update();
      if (be1.isDead()) {
        zombies.add(be1);
        sm.boss1IsDead = true;
        redness = 0;
        greeness = 0;
        blueness = 0;
      }
    }

    if (be1.isDownTheScreen())
      zombies.add(be1);
  }
  for (Enemy be2 : bossEnemies2) {
    for (SpawnManager sm : spawnManagers) {
      be2.update();
      if (be2.isDead()) {
        sm.boss2IsDead = true;
        zombies.add(be2); 
        redness = 0;
        greeness = 0;
        blueness = 0;
      }
      if (be2.isDownTheScreen())
        zombies.add(be2);
    }
  }

  if (zeroKeyPressed)
    difficulty = 0.5;
  if (oneKeyPressed)
    difficulty = 1;
  if (twoKeyPressed)
    difficulty = 2;
  if (threeKeyPressed)
    difficulty = 3;
  if (fourKeyPressed)
    difficulty = 4;

  commonEnemyProjectiles.removeAll(zombies);
  deathBallEffects.removeAll(DBEzombies);
  enemies.removeAll(zombies);
  bossEnemies1.removeAll(zombies);
  bossEnemies2.removeAll(zombies);
  playerProjectiles.removeAll(zombies);
  spaceships.removeAll(zombies);
  damageCollectibles.removeAll(zombies);
  superDamageCollectiblesForSale.removeAll(zombies);
  healthCollectibles.removeAll(zombies);
  healthCollectiblesForSale.removeAll(zombies);
  crimnersForSale.removeAll(zombies);
  menuObjects.removeAll(zombies);
  menuObjects2.removeAll(zombies);
  menuObjects3.removeAll(zombies);

  background(redness, greeness, blueness);
  displaySpace();

  for (DeathBallEffect dbe : deathBallEffects) {
    if (isPaused == false) {
      dbe.update();
      dbe.display();
    }
  }
  for (Spaceship spaceship : spaceships) {
    if (isPaused == false) {
      spaceship.update();
      spaceship.display();
    }
  }
  for (SpawnManager sm : spawnManagers) {
    if (isPaused == false) {
      sm.update();
    }
  }
  for (Enemy vfrm : bossEnemies1) {
    if (isPaused == false) {
      vfrm.update();
      vfrm.display();
    }
  }
  for (Enemy vfrm : bossEnemies2) {
    if (isPaused == false) {
      vfrm.update();
      vfrm.display();
    }
  }
  for (Enemy enemy : enemies) {
    if (isPaused == false) {
      enemy.update();
      enemy.display();
    }
  }
  for (DamageCollectible damageCollectible : damageCollectibles) {
    if (isPaused == false) {
      damageCollectible.update();
      damageCollectible.display();
    }
  }
  for (HealthCollectible healthCollectible : healthCollectibles) {
    if (isPaused == false) {
      healthCollectible.update();
      healthCollectible.display();
    }
  }
  for (HealthCollectibleForSale healthCollectibleForSale : healthCollectiblesForSale) {
    if (isPaused == false) {
      healthCollectibleForSale.update();
      healthCollectibleForSale.display();
    }
  }
  for (SuperDamageCollectibleForSale superDamageCollectibleForSale : superDamageCollectiblesForSale) {
    if (isPaused == false) {
      superDamageCollectibleForSale.update();
      superDamageCollectibleForSale.display();
    }
  }
  for (CrimnerForSale crimnerForSale : crimnersForSale) {
    if (isPaused == false) {
      crimnerForSale.update();
      crimnerForSale.display();
    }
  }
  for (Projectile projectille : playerProjectiles)
    if (isPaused == false) {
      projectille.display();
    }
  for (Projectile projectille : commonEnemyProjectiles)
    if (isPaused == false) {
      projectille.display();
    }
  for (MenuObject mo : menuObjects) {
    mo.display();
    mo.update();
  }
  for (MenuObject mo : menuObjects2) {
    mo.display();
    mo.update();
  }
  for (MenuObject mo : menuObjects3) {
    mo.display();
    mo.update();
  }
  for (SpawnManager sm : spawnManagers) {
    for (Spaceship ss : spaceships) {
      if (shiftKeyPressed)
        rect(ss.position.x - 6, ss.position.y - 6, 12, 12);
      textFont(font, 16);
      fill(255);
      text("points", 0, 50);
      text(points, 50, 50);
      text("money", 0, 70);
      text(money, 50, 70);
      text("life", 0, 90);
      text(ss.hp, 50, 90);
      text("xp", 0, 110);
      text(ss.damageLevel, 50, 110);
      for (SuperDamageCollectibleForSale sdcfs : superDamageCollectiblesForSale) {
        text(75 * sm.stage * sm.stage / 1000, sdcfs.position.x + 20, sdcfs.position.y);
      }
      for (HealthCollectibleForSale sdcfs : healthCollectiblesForSale) {
        text(100 * sm.stage * sm.stage / 1000, sdcfs.position.x + 20, sdcfs.position.y);
      }
      for (CrimnerForSale sdcfs : crimnersForSale) {
        text(500 * sm.stage * sm.stage / 1000, sdcfs.position.x + 20, sdcfs.position.y);
      }
    }
    for (Enemy e : enemies) {
      imageMode(CENTER);
      fill(255, 0, 0);
      text(e.hp, e.position.x + 20, e.position.y);
      rect(e.position.x - e.hp / 2, e.position.y - e.sprite.height, e.hp, 10);
    }
    for (Enemy e : bossEnemies1) {
      imageMode(CENTER);
      fill(255, 128, 0);
      text(e.hp, e.position.x + 20, e.position.y);
      rect(e.position.x - e.hp / 2, e.position.y - e.sprite.height, e.hp / 10, 10);
    }
    for (Enemy e : bossEnemies2) {
      imageMode(CENTER);
      fill(255, 128, 0);
      text(e.hp, e.position.x + 20, e.position.y);
      rect(e.position.x - e.hp / 2, e.position.y - e.sprite.height, e.hp / 10, 10);
    }
  }
}
void keyPressed() {
  if (keyCode == LEFT)
  {
    leftKeyPressed = true;
  }
  if (keyCode == RIGHT) 
  {
    rightKeyPressed = true;
  }
  if (keyCode == UP) 
  {
    upKeyPressed = true;
  }
  if (keyCode == DOWN) 
  {
    downKeyPressed = true;
  }
  if (key == 'z' || key == 'Z') {
    zKeyPressed = true;
  }
  if (key == 'c' || key == 'C') {
    cKeyPressed = true;
  }
  if (key == 'v' || key == 'V') {
    vKeyPressed = true;
  }
  if (key == '0' || key == ')') {
    zeroKeyPressed = true;
  }
  if (key == '1' || key == '!') {
    oneKeyPressed = true;
  }
  if (key == '2' || key == '@') {
    twoKeyPressed = true;
  }
  if (key == '3' || key == '#') {
    threeKeyPressed = true;
  }
  if (key == '4' || key == '$') {
    fourKeyPressed = true;
  }
  if (keyCode == SHIFT) 
  {
    shiftKeyPressed = true;
  }
}

void keyReleased() {
  if (keyCode == LEFT)
  {
    leftKeyPressed = false;
  }
  if (keyCode == RIGHT)
  {
    rightKeyPressed = false;
  }
  if (keyCode == UP)
  {
    upKeyPressed = false;
  }
  if (keyCode == DOWN)
  {
    downKeyPressed = false;
  }
  if (keyCode == SHIFT)
  {
    shiftKeyPressed = false;
  }
  if (key == 'z' || key == 'Z')
  {
    zKeyPressed = false;
  }
  if (key == 'c' || key == 'C')
  {
    cKeyPressed = false;
  }
  if (key == 'v' || key == 'V')
  {
    vKeyPressed = false;
  }
  if (key == '0' || key == ')')
  {
    zeroKeyPressed = false;
  }
  if (key == '1' || key == '!')
  {
    oneKeyPressed = false;
  }
  if (key == '2' || key == '@')
  {
    twoKeyPressed = false;
  }
  if (key == '3' || key == '#')
  {
    threeKeyPressed = false;
  }
  if (key == '4' || key == '$')
  {
    fourKeyPressed = false;
  }
}
