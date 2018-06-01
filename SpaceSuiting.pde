
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
int difficulty = 1; //You can change this from 1 to 3, trying different numbers will do strange things
int backgroundRedness;

float getAngle_In_Degrees(float pX1, float pY1, float pX2, float pY2) {
  return atan2(pY2 - pY1, pX2 - pX1);
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
//coolest projects ate 25 the marco

boolean leftKeyPressed = false;
boolean rightKeyPressed = false;
boolean upKeyPressed = false;
boolean downKeyPressed = false;
boolean shiftKeyPressed = false;
boolean zKeyPressed = false;
boolean cKeyPressed = false;
boolean vKeyPressed = false;
boolean oneKeyPressed = false;
boolean twoKeyPressed = false;
boolean threeKeyPressed = false;


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

  //Here it is the recomended for each character
  //SpaceBee:  9 damage, rotate -HALF_PI
  //SpotNick:  7 damage
  //MightShooter:  40 damage
  //TriShooter:  6 damage
  Spaceship spaceship = new SpotNick(new PVector(700, 400), new PVector(0, 0), 0, 2, "player_spot_nick.png", new BoundingBox(new PVector(0, 0), new PVector(12, 12)), 9, 0, 7);
  spaceships.add(spaceship);
  //Enemy importableComputer = new MegaBoxShip(new PVector(700, 0), new PVector(0, 5), 0, 2, "enemy_megaboxship.png", new BoundingBox(new PVector(0, 0), new PVector(100, 100)), 9, 0, 10000);
  //bossEnemies2.add(importableComputer);

  SpawnManager spawnManager = new SpawnManager(10, 0, 0);
  spawnManagers.add(spawnManager);

  backgroundMusic.loop();
}

void draw() {
  ArrayList<GameObject> zombies = new ArrayList<GameObject>();
  ArrayList<DeathBallEffect> DBEzombies = new ArrayList<DeathBallEffect>();
  ArrayList<DamageCollectible> zombieDamageCollectibles = new ArrayList<DamageCollectible>();
  ArrayList<Enemy> zombieenemies = new ArrayList<Enemy>();
  ArrayList<Spaceship> zombiesSpaceship = new ArrayList<Spaceship>();




  for (PlayerProjectile projectille : playerProjectiles) {
    projectille.update();
    if (projectille.isOffScreen() || projectille.hit == true)
      zombies.add(projectille);
    if (projectille.hit == true)
      points += 2;
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
      zombieDamageCollectibles.add(damageCollectible);
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
      zombiesSpaceship.add(spaceship);
  }
  for (Enemy enemy : enemies) {
    enemy.update();
    if (enemy.isDead())
      zombieenemies.add(enemy);
    if (enemy.isDownTheScreen())
      zombieenemies.add(enemy);
  }
  for (Enemy be1 : bossEnemies1) {
    for (SpawnManager sm : spawnManagers) {
      be1.update();
      if (be1.isDead()) {
        zombieenemies.add(be1);
        sm.boss1IsDead = true;
        redness = 0;
        greeness = 0;
        blueness = 0;
      }
    }

    if (be1.isDownTheScreen())
      zombieenemies.add(be1);
  }
  for (Enemy be2 : bossEnemies2) {
    for (SpawnManager sm : spawnManagers) {
      be2.update();
      if (be2.isDead()) {
        sm.boss2IsDead = true;
        zombieenemies.add(be2); 
        redness = 0;
        greeness = 0;
        blueness = 0;
      }
      if (be2.isDownTheScreen())
        zombieenemies.add(be2);
    }
  }

  if (oneKeyPressed)
    difficulty = 1;
  if (twoKeyPressed)
    difficulty = 2;
  if (threeKeyPressed)
    difficulty = 3;

  commonEnemyProjectiles.removeAll(zombies);
  deathBallEffects.removeAll(DBEzombies);
  enemies.removeAll(zombieenemies);
  bossEnemies1.removeAll(zombieenemies);
  bossEnemies2.removeAll(zombieenemies);
  playerProjectiles.removeAll(zombies);
  spaceships.removeAll(zombiesSpaceship);
  damageCollectibles.removeAll(zombieDamageCollectibles);
  superDamageCollectiblesForSale.removeAll(zombies);
  healthCollectibles.removeAll(zombies);
  healthCollectiblesForSale.removeAll(zombies);
  crimnersForSale.removeAll(zombies);

  background(redness, greeness, blueness);
  displaySpace();

  for (Enemy enemy : enemies) {
    enemy.update();
    enemy.display();
  }
  for (DeathBallEffect dbe : deathBallEffects) {
    dbe.update();
    dbe.display();
  }
  for (Enemy vfrm : bossEnemies1) {
    vfrm.update();
    vfrm.display();
  }
  for (Enemy vfrm : bossEnemies2) {
    vfrm.update();
    vfrm.display();
  }
  for (DamageCollectible damageCollectible : damageCollectibles) {
    damageCollectible.update();
    damageCollectible.display();
  }
  for (HealthCollectible healthCollectible : healthCollectibles) {
    healthCollectible.update();
    healthCollectible.display();
  }
  for (HealthCollectibleForSale healthCollectibleForSale : healthCollectiblesForSale) {
    healthCollectibleForSale.update();
    healthCollectibleForSale.display();
  }
  for (SuperDamageCollectibleForSale superDamageCollectibleForSale : superDamageCollectiblesForSale) {
    superDamageCollectibleForSale.update();
    superDamageCollectibleForSale.display();
  }
  for (CrimnerForSale crimnerForSale : crimnersForSale) {
    crimnerForSale.update();
    crimnerForSale.display();
  }
  for (Spaceship spaceship : spaceships) {
    spaceship.update();
    spaceship.display();
  }
  for (SpawnManager sm : spawnManagers) {
    sm.update();
  }

  for (Projectile projectille : playerProjectiles)
    projectille.display();

  for (Projectile projectille : commonEnemyProjectiles)
    projectille.display();

  for (Spaceship ss : spaceships) {
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
  if (key == '1' || key == '!') {
    oneKeyPressed = true;
  }
  if (key == '2' || key == '@') {
    twoKeyPressed = true;
  }
  if (key == '3' || key == '#') {
    threeKeyPressed = true;
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
}
