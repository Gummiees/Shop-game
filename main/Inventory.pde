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
  
  public void addItem(Item item) {
    // Can only add the item if it is not already on the table and there is enough size left on it.
    if (!Constants.itemExists(this.items, item)) {
      this.items.add(item);
    }
  }
  
  public void removeItem(Item item) {
    if (Constants.itemExists(this.items, item)) {
      Item existentItem = Constants.getItem(this.items, item);
      this.items.remove(existentItem);
    }
  }
  
  public void setMoney(float money) {
    this.money = money;
  }
  
  public float getMoney() {
    return this.money;
  }
  
  public void addMoney(float money) {
    this.money += money;
  }
  
  public void removeMoney(float money) {
    this.money -= money;
  }
  
  public void setRandomWishlist(RPGClass rpgClass) {
    // TODO: Setup an initial random inventory
    this.items = addRandomItem(rpgClass.getItems(), new ArrayList<Item>(), 1);
    if (this.items.size() == 0) { //<>//
      // Add random item
      this.addItem(getRandom(rpgClass.getItems()));
    }
  }
  
  private ArrayList<Item> addRandomItem(ArrayList<Item> originalItems, ArrayList<Item> addedItems, float chances) {
    boolean added = random(1) <= chances;
    if (added) {
      // Get a random item from the ones that have not been added yet.
      Item randomItem = getRandom(originalItems);
      // Make sure that it wasn't added before by any chance AND that it should be added by the chances of it
      boolean canAddItem = random(1) <= randomItem.getProbabilities();
      if (canAddItem && !Constants.itemExists(addedItems, randomItem)) {
        addedItems.add(randomItem);
      }
      
      // Rarity goes from 1 to 5. The more rare, the less common to want it, since it's supposed to be something not everyone can buy.
      // Remove the one that has been already added, so it cannot be added again.
      originalItems = filterList(originalItems, randomItem);
      // Call it again, dividing the probabilities of adding a new one.
      addedItems = addRandomItem(originalItems, addedItems, chances / Constants.INVENTORY_RANDOM_ITEM_CHANCES_DIVIDER);
    }
    return addedItems;
  }
}
