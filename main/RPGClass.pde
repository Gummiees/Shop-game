public class RPGClass {
  private String rpgName;
  private color rpgColor;
  private float probabilities;
  private int id;
  private ArrayList<Item> items;
  
  public RPGClass(String rpgName, color rpgColor, float probabilities, ArrayList<Item> items) {
    this.rpgName = rpgName;
    this.rpgColor = rpgColor;
    this.probabilities = probabilities;
    this.items = items;
    
    this.id = Constants.RPGCLASS_ID;
    Constants.RPGCLASS_ID++;
  }
  
  public int getId() {
    return this.id;
  }
  
  public String getRpgName() {
    return this.rpgName;
  }
  
  public color getColor() {
    return this.rpgColor;
  }
  
  public ArrayList<Item> getItems() {
    return this.items;
  }
  
  public float getProbabilities() {
    return this.probabilities;
  }

  public boolean generatePerson() {
    return (random(0, 1) <= this.probabilities);
  }
}
