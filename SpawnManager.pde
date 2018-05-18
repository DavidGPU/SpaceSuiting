// SPAWN MANAGER
class SpawnManager { //I'm having a bug where it doesn't change to level 2, sometimes it works but that's rare

  long lastSpawn;

  long spawnPeriod;
  long spawnUpgrade;
  long stagePhaseTime;
  int stagePhaseTimeSet;
  float spawnPoints;
  float spawnLevel;
  float spawnLevelLevel;
  float stage = 1; 

  long shopSpawnHealthCollectible;
  long shopSpawnSuperDamageCollectible;
  long shopSpawnCrimner;


  SpawnManager(int spawnPeriod, float spawnPoints, float spawnLevel) {
    this.spawnPeriod = spawnPeriod;
    this.spawnPoints = spawnPoints;
    this.spawnLevel = spawnLevel;
  }

  boolean shopHere;
  boolean bossHere;
  boolean bossPrepared;
  boolean bossSpawned;

  void update() {
    for (Enemy be1 : bossEnemies1) {
      if (be1.isDead()) {
        println("now");
        bossPrepared = false;
        bossHere = false;
        bossSpawned = false;
        stagePhaseTime = 0;
        stage = 2;
        spawnPeriod = 0;
        spawnPoints = 0;
        spawnLevel = 0;
        spawnLevelLevel = 0;
      }
    }
    if (stage == 1)
      stagePhaseTimeSet = 30000;
    if (stage == 2)
      stagePhaseTimeSet = 45000;
    if (stage == 3)
      stagePhaseTimeSet = 65000;
    if (millis() - lastSpawn > spawnPeriod * random(7) && spawnPoints >= 10 && stage == 1 && spawnLevel <= 200) {
      spawnLilShip();
      spawnPoints -= 10;
    }
    if (millis() - lastSpawn > spawnPeriod * random(6) && spawnPoints >= 40 && stage == 1 && spawnLevel <= 200) {
      spawnEliteLilShip();
      spawnPoints -= 40;
    }
    if (millis() - lastSpawn > spawnPeriod * random(6) && spawnPoints >= 50 && stage == 1 && spawnLevel <= 400) {
      spawnArchShip();
      spawnPoints -= 50;
    }
    if (millis() - lastSpawn > spawnPeriod * random(6) && spawnPoints >= 60 && stage == 1 && spawnLevel <= 1000) {
      spawnFatRocket();
      spawnPoints -= 60;
    }
    if (millis() - lastSpawn > spawnPeriod * random(5) && spawnPoints >= 80 && stage ==1) {
      spawnLilX();
      spawnPoints -= 80;
    }
    if (millis() - lastSpawn > spawnPeriod * random(3) && spawnPoints >= 85 && stage ==1) {
      spawnCrusaderShip();
      spawnPoints -= 85;
    }
    if (millis() - lastSpawn > spawnPeriod * random(4) && spawnPoints >= 100 && stage == 1) {
      spawnHyperLilShip();
      spawnPoints -= 100;
    }
    if (millis() - lastSpawn > spawnPeriod * 0.96 && spawnLevel <= 256  && spawnPoints >= 10 && stage == 2) {
      spawnHyperLilShip();
      spawnPoints -= 10;
    }

    if (millis() - lastSpawn > spawnPeriod && spawnPoints >= 30 && spawnLevel <= 300 && stage == 2) {
      spawnEliteFatRocket();
      spawnPoints -= 30;
    }
    if (millis() - lastSpawn > spawnPeriod * 0.99 && spawnPoints >= 300 && spawnLevel <= 2000 && stage == 2) {
      spawnBoltzyme();
      spawnPoints -= 300;
    }
    if (millis() - lastSpawn > spawnPeriod * 0.98 && spawnPoints >= 750 && stage == 2) {
      spawnMegaBall();
      spawnPoints -= 750;
    }
    if (millis() - lastSpawn > spawnPeriod * 0.97 && spawnPoints >= 1500 && stage == 3)
      spawnEliteMegaBall();
    if (millis() - spawnUpgrade >= 2000 && shopHere == false && bossHere == false) {
      spawnPoints += spawnLevel;
      spawnLevel += spawnLevelLevel;
      spawnLevelLevel += 1;
      spawnUpgrade = millis();
    }
    if (millis() - stagePhaseTime >= stagePhaseTimeSet && bossPrepared == false) {
      shopHere = true;
    }
    if (millis() - stagePhaseTime >= stagePhaseTimeSet && bossPrepared == true && stage == 1 && bossSpawned == false) {
      spawnVeryFatRocket();
      bossHere = true;
      bossSpawned = true;
      stagePhaseTime = millis();
    }
    if (cKeyPressed) {
      shopHere = false;
      bossPrepared = true;
      stagePhaseTime = millis();
    }
    if (shopHere && millis() - shopSpawnHealthCollectible >= 750) {
      shopSpawnedHealthCollectible();
    }
    if (shopHere && millis() - shopSpawnSuperDamageCollectible >= 900) {
      shopSpawnedSuperDamageCollectible();
    }
    if (shopHere && millis() - shopSpawnCrimner >= 2000) {
      shopSpawnedCrimner();
    }
  }
  void spawnLilShip() {
    float velx = random(0.5);
    float velxFinal = 0;
    float enemposx;
    enemposx = random(0, 1400);
    if (enemposx > 0 && enemposx < 700) 
      velxFinal = velx;
    if (enemposx > 700) 
      velxFinal = 0 - velx;
    enemies.add(new LilShip(new PVector(enemposx, -30), new PVector(velxFinal, 1), 0, 2, "enemy_lil_ship.png", new BoundingBox(new PVector(0, 0), new PVector(10, 10)), 2, 0, 18));

    lastSpawn = millis();
  }
  void spawnEliteLilShip() {
    float velx = random(0.6);
    float velxFinal = 0;
    float enemposx;
    enemposx = random(0, 1400);
    if (enemposx > 0 && enemposx < 700) 
      velxFinal = velx;
    if (enemposx > 700)
      velxFinal = 0 - velx;
    enemies.add(new EliteLilShip(new PVector(enemposx, -30), new PVector(velxFinal, 1.1), 0, 2, "enemy_lil_ship_elite.png", new BoundingBox(new PVector(0, 0), new PVector(10, 10)), 2, 0, 50));

    lastSpawn = millis();
  }
  void spawnHyperLilShip() {
    float velx = random(0.7);
    float velxFinal = 0;
    float enemposx;
    enemposx = random(0, 1400);
    if (enemposx > 0 && enemposx < 700) 
      velxFinal = velx;
    if (enemposx > 700)
      velxFinal = 0 - velx;
    enemies.add(new HyperLilShip(new PVector(enemposx, -30), new PVector(velxFinal, 1.2), 0, 2, "enemy_lil_ship_hyper.png", new BoundingBox(new PVector(0, 0), new PVector(10, 10)), 2, 0, 74));

    lastSpawn = millis();
  }
  void spawnLilX() {
    float velx = random(0.7);
    float velxFinal = 0;
    float enemposx;
    enemposx = random(0, 1400);
    if (enemposx > 0 && enemposx < 700) 
      velxFinal = velx;
    if (enemposx > 700)
      velxFinal = 0 - velx;
    enemies.add(new LilX(new PVector(enemposx, -30), new PVector(velxFinal, 1.2), 0, 2, "enemy_lilx.png", new BoundingBox(new PVector(0, 0), new PVector(10, 10)), 2, 0, 60));

    lastSpawn = millis();
  }
  void spawnEliteLilX() {
    float velx = random(0.7);
    float velxFinal = 0;
    float enemposx;
    enemposx = random(0, 1400);
    if (enemposx > 0 && enemposx < 700) 
      velxFinal = velx;
    if (enemposx > 700)
      velxFinal = 0 - velx;
    enemies.add(new EliteLilX(new PVector(enemposx, -30), new PVector(velxFinal, 1.2), 0, 2, "enemy_lilx_elite.png", new BoundingBox(new PVector(0, 0), new PVector(10, 10)), 2, 0, 100));

    lastSpawn = millis();
  }
  void spawnArchShip() {
    float velx = random(0.5);
    float velxFinal = 0;
    float enemposx;
    enemposx = random(0, 1400);
    if (enemposx > 0 && enemposx < 700) 
      velxFinal = velx;
    if (enemposx > 700) 
      velxFinal = 0 - velx;
    enemies.add(new ArchShip(new PVector(enemposx, -30), new PVector(velxFinal, 0.5), 0, 2, "enemy_archship.png", new BoundingBox(new PVector(0, 0), new PVector(160, 2)), 2, 0, 60));

    lastSpawn = millis();
  }
  void spawnEliteArchShip() {
    float velx = random(0.5);
    float velxFinal = 0;
    float enemposx;
    enemposx = random(0, 1400);
    if (enemposx > 0 && enemposx < 700) 
      velxFinal = velx;
    if (enemposx > 700)
      velxFinal = 0 - velx;
    enemies.add(new EliteArchShip(new PVector(enemposx, -30), new PVector(velxFinal, 0.6), 0, 2, "enemy_archship_elite.png", new BoundingBox(new PVector(0, 0), new PVector(160, 2)), 2, 0, 150));

    lastSpawn = millis();
  }
  void spawnFatRocket() {
    float velx = random(0.5);
    float velxFinal = 0;
    float enemposx;
    enemposx = random(0, 1400);
    if (enemposx > 0 && enemposx < 700) 
      velxFinal = velx;
    if (enemposx > 700)
      velxFinal = 0 - velx;
    enemies.add(new FatRocket(new PVector(enemposx, -30), new PVector(velxFinal, 0.6), 0, 2, "enemy_fatrocket.png", new BoundingBox(new PVector(0, 0), new PVector(80, 40)), 2, 0, 100));

    lastSpawn = millis();
  }
  void spawnEliteFatRocket() {
    float velx = random(0.5);
    float velxFinal = 0;
    float enemposx;
    enemposx = random(0, 1400);
    if (enemposx > 0 && enemposx < 700) 
      velxFinal = velx;
    if (enemposx > 700)
      velxFinal = 0 - velx;
    enemies.add(new EliteFatRocket(new PVector(enemposx, -30), new PVector(velxFinal, 0.8), 0, 2, "enemy_fatrocket_elite.png", new BoundingBox(new PVector(0, 0), new PVector(80, 40)), 2, 0, 300));

    lastSpawn = millis();
  }
  void spawnBoltzyme() {
    float velx = random(0.5);
    float velxFinal = 0;
    float enemposx;
    enemposx = random(0, 1400);
    if (enemposx > 0 && enemposx < 700) 
      velxFinal = velx;
    if (enemposx > 700)
      velxFinal = 0 - velx;
    enemies.add(new Boltzyme(new PVector(enemposx, -30), new PVector(velxFinal, 0.8), 0, 2, "enemy_boltzyme.png", new BoundingBox(new PVector(0, 0), new PVector(300, 40)), 2, 0, 400));

    lastSpawn = millis();
  }

  void spawnMegaBall() {
    float velx = random(0.5);
    float velxFinal = 0;
    float enemposx;
    enemposx = random(0, 1400);
    if (enemposx > 0 && enemposx < 700) 
      velxFinal = velx;
    if (enemposx > 700)
      velxFinal = 0 - velx;
    enemies.add(new MegaBall(new PVector(enemposx, -30), new PVector(velxFinal, 0.8), 0, 2, "enemy_megaball.png", new BoundingBox(new PVector(0, 0), new PVector(60, 60)), 2, 0, 888));

    lastSpawn = millis();
  }
  void spawnEliteMegaBall() {
    float velx = random(1);
    float velxFinal = 0;
    float enemposx;
    enemposx = random(0, 1400);
    if (enemposx > 0 && enemposx < 700) 
      velxFinal = velx;
    if (enemposx > 700)
      velxFinal = 0 - velx;
    enemies.add(new EliteMegaBall(new PVector(enemposx, -30), new PVector(velxFinal, 0.8), 0, 2, "enemy_megaball_elite.png", new BoundingBox(new PVector(0, 0), new PVector(60, 60)), 2, 0, 1500));

    lastSpawn = millis();
  }
  void spawnCrusaderShip() {
    float enemposx;
    enemposx = random(0, 1400);
    enemies.add(new CrusaderShip(new PVector(enemposx, -80), new PVector(0, 0.5), 0, 2, "enemy_crusadership.png", new BoundingBox(new PVector(0, 0), new PVector(40, 160)), 2, 0, 550));

    lastSpawn = millis();
  }
  void spawnVeryFatRocket() {
    bossEnemies1.add(new VeryFatRocket(new PVector(700, -160), new PVector(0, 0.08), 0, 2, "enemy_veryfatrocket.png", new BoundingBox(new PVector(0, 0), new PVector(160, 120)), 2, 0, 20000, 20000));
  }
  void shopSpawnedHealthCollectible() {
    float posx = random(1400);
    healthCollectiblesForSale.add(new HealthCollectibleForSale(new PVector(posx, -30), new PVector(0, 0.8), 0, 2, "collectible_life_fraction.png", new BoundingBox(new PVector(0, 0), new PVector(16, 16))));
    shopSpawnHealthCollectible = millis();
  }
  void shopSpawnedSuperDamageCollectible() {
    float posx = random(1400);
    healthCollectiblesForSale.add(new HealthCollectibleForSale(new PVector(posx, -30), new PVector(0, 0.8), 0, 2, "collectible_superstats.png", new BoundingBox(new PVector(0, 0), new PVector(32, 32))));

    shopSpawnSuperDamageCollectible = millis();
  }
  void shopSpawnedCrimner() {
    float posx = random(1400);
    crimnersForSale.add(new CrimnerForSale(new PVector(posx, -30), new PVector(0, 0.8), HALF_PI, 2, "pp_crimner.png", new BoundingBox(new PVector(0, 0), new PVector(32, 32))));

    shopSpawnCrimner = millis();
  }
}