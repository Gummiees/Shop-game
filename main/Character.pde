class Character {
  private int x;
  private int y;
  private double money;
  private double experience;
  private color mainColor;
  private String name;
  Inventory inventory;
  
  public Character() {
    money = 1000;
    experience = 0;
    x  = 16;
    y = 16;
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
  
  void setMoney(double money) {
    this.money = money;
  }
  
  double getMoney() {
    return this.money;
  }
  
  void setExperience(double experience) {
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
