class Character {
  private int x;
  private int y;
  private float experience;
  private color mainColor;
  private String name;
  
  private Inventory inventory;
  private ArrayList<RPGClass> unlockedClasses = new ArrayList<RPGClass>();
  
  public Character() {
    experience = 0;
    x  = 16;
    y = 16;
    // TODO: Setup an initial random inventory
  }
  
  void draw() {
    pushMatrix();
    noStroke();
    fill(mainColor);
    rect(0,0, x, y);
    popMatrix();
  }
  
  void setUsername(String name) {
    this.name = name;
  }
  
  void setExperience(float experience) {
    this.experience = experience;
  }
  
  double getExperience() {
    return this.experience;
  }
  
  String getUsername() {
    return this.name;
  }
  
  void setColor(color mainColor) {
    this.mainColor = mainColor;
  }
  
  color getColor() {
    return this.mainColor;
  }
}
