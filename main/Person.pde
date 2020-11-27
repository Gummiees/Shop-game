class Person {
  // TODO: Should money be something to have on NPCs?
  private Inventory wishlist = new Inventory(0);
  
  private RPGClass rpgClass;
  private color personColor;
  
  private float speed;
  private int x;
  private int y;
  private int boxWidth = Constants.PERSON_BOX_SIZE;
  private int boxHeight = Constants.PERSON_BOX_SIZE;
  private int maxX = Math.round(( Constants.WIDTH / 2 ) - (this.boxWidth / 2));
  private int maxY = Math.round(( Constants.HEIGHT / 2 ) + ( Constants.HEIGHT / 16 ));
  private int minY;
  private boolean movingY = false;
  private int id;
  
  private boolean ltr;
  private boolean goesToShop;
  private boolean wentInShop = false;
  private boolean thinking = false;
  private boolean canBuy;
  
  private int time;
  private int timeThinking = 5000;
  
  public Person(RPGClass rpgClass, boolean isClassUnlocked) {
    this.ltr = randomBoolean();
    this.goesToShop =  (random(0, 1) <= Constants.PERSON_IN_SHOP_PERCENT);
    this.speed = random(1, 2);
    this.minY = Math.round(random(10, 100));
    this.canBuy = isClassUnlocked;
    
    this.id = Constants.PERSON_ID;
    Constants.PERSON_ID++;
    
    this.setInitialPosition();
    
    this.rpgClass = rpgClass;
    this.personColor = rpgClass.rpgColor;
    this.wishlist.setRandomWishlist(rpgClass);
  }
  
  void draw() {
    fill(this.personColor);
    noStroke();
    pushMatrix();
    this.calculatePosition();
    this.buyingItem();
    rect(this.x, this.y, this.boxWidth, this.boxHeight);
    popMatrix();
  }
  
  public boolean removePerson() {
    return ( ( this.x + this.boxWidth < 0 ) || this.x > Constants.WIDTH);
  }
  
  public int getId() {
    return this.id;
  }
  
  public RPGClass getRpgClass() {
    return this.rpgClass;
  }
  
  private void setInitialPosition() {
    this.y = this.minY;
    if (this.ltr) {
      this.x = 0;
    } else {
      this.x = Constants.WIDTH - this.boxWidth;
    }
  }
  
  private void calculatePosition() {
    if (this.y >= maxY && !this.wentInShop) {
      // He reached the bottom of the shop.
      this.y = maxY;
      this.thinking = true;
      this.wentInShop = true;
      // Comenzar temporizador
      this.time = millis();
    }
    
    if (this.thinking && (millis() >= this.timeThinking + this.time)) {
        this.thinking = false;
    }
    
    if (!this.thinking) {
      // Moving
      
      if (
        this.goesToShop &&
        (
          (!this.wentInShop && (this.ltr && this.x >= this.maxX) || (!this.ltr && this.x <= this.maxX)) ||
          (this.wentInShop && this.y > this.minY)
        )
      ) {
        // Move Y
        this.movingY = true;
        if (!this.wentInShop) {
          // It's moving on the Y towards the shop
          this.y += this.speed;
        } else if (this.y > this.minY) {
          // It's moving on the Y away from the shop
          this.y -= this.speed;
        }
      }
      
      if (this.goesToShop && this.y <= this.minY && this.movingY && this.wentInShop) {
        this.movingY = false;
      }
      
      if (!this.movingY) {
        // Move X
        if (this.ltr) {
            // It's moving LTR on the X 
            this.x += this.speed;
        } else {
            // It's moving RTL on the X
            this.x -= this.speed;
        }
      }
    }
  }
  
  private void buyingItem() {
    if (this.thinking && this.canBuy) {
      // TODO
    }
  }
    
}
