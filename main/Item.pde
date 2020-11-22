class Item {
  private String name;
  private float price;
  private int rarity;
  private int size;
  private int id;
  private RPGClass rpgClass;
  
  public Item() {
    this.id = Constants.ITEM_ID;
    Constants.ITEM_ID++;
  }
  
  public int getSize() {
    return this.size;
  }
  
  public int getId() {
    return this.id;
  }
}
