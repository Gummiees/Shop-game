class Character {
  private int x;
  private int y;
  private float experience;
  private color mainColor;
  private String name;
  
  private Inventory inventory;
  private ArrayList<RPGClass> unlockedClasses = new ArrayList<RPGClass>();
  
  public Character() {
    this.experience = 0;
    this.x  = 16;
    this.y = 16;
    
    // By default, the Aventurer is unlocked.
    this.unlockedClasses.add(RPGClass.Adventurer);
    // TODO: Setup an initial random inventory
  }
  
  public void draw() {
    pushMatrix();
    noStroke();
    fill(this.mainColor);
    rect(0,0, x, y);
    popMatrix();
  }
  
  public void setUsername(String name) {
    this.name = name;
  }
  
  public void setExperience(float experience) {
    this.experience = experience;
  }
  
  public double getExperience() {
    return this.experience;
  }
  
  public String getUsername() {
    return this.name;
  }
  
  public void setColor(color mainColor) {
    this.mainColor = mainColor;
  }
  
  public color getColor() {
    return this.mainColor;
  }
  
  public ArrayList<RPGClass> getUnlockedClasses() {
    return this.unlockedClasses;
  }
  
  public void addClass(RPGClass rpgClass) {
    this.unlockedClasses.add(rpgClass);
  }
  
  public RPGClass getRandomUnlockedClass() {
    int randomPos = getRandomPosition();
    return this.unlockedClasses.get(randomPos);
  }
  
  private int getRandomPosition() {
    // We must do the +1 so they all have the same chance. Otherwise, the last one would have 1/2 chances.
    // (int)Math.floor(x) will always give the int closest to the lower.
      return (int)Math.floor(random(0, this.unlockedClasses.size()));
  }
}
