class Inventory {
  private ArrayList<Item> items;
  private float money;
  
  public Inventory(int money) {
    this.money = money;
  }
  
  public void setItems(ArrayList<Item> items) {
    this.items = items;
  }
  
  public ArrayList<Item> getItems() {
    return this.items;
  }
  
  public void setMoney(float money) {
    this.money = money;
  }
  
  public float getMoney() {
    return this.money;
  }
}
