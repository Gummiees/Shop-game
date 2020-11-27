public class Item {
  private String itemName;
  private float originalPrice;
  private float sellingPrice;
  private int rarity;
  private float probabilities;
  private int size;
  private int id;
  
  public Item(String itemName, float price, int rarity, int size) {
    this.itemName = itemName;
    this.originalPrice = price;
    this.sellingPrice = price;
    this.rarity = rarity;
    this.size = size;
    this.setProbabilitiesByRarity(rarity);
    
    this.id = Constants.ITEM_ID;
    Constants.ITEM_ID++;
  }
  
  public String getItemName() {
    return this.itemName;
  }
  
  public float getOriginalPrice() {
    return this.originalPrice;
  }
  
  public float getSellingPrice() {
    return this.sellingPrice;
  }
  
  public void setSellingPrice(float sellingPrice) {
    this.sellingPrice = sellingPrice;
  }
  
  public int getRarity() {
    return this.rarity;
  }
  
  public int getSize() {
    return this.size;
  }
  
  public int getId() {
    return this.id;
  }
  
  public float getProbabilities() {
    return probabilities;
  }
  
  private void setProbabilitiesByRarity(int rarity) {
    switch(rarity) {
      case 1:
        this.probabilities = 1;
        break;
      case 2:
        this.probabilities = 0.75;
        break;
      case 3:
        this.probabilities = 0.5;
        break;
      case 4:
        this.probabilities = 0.25;
        break;
      case 5:
        this.probabilities = 0.1;
        break;
    }
  }
}
