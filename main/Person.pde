class Person {
  private Inventory inventory;
  
  private RPGClass rpgClass;
  private color personColor;
  
  private float speed;
  private int x;
  private int y;
  private int boxWidth = Constants.PERSON_BOX_SIZE;
  private int boxHeight = Constants.PERSON_BOX_SIZE;
  private int maxX = (int)(( Constants.WIDTH / 2 ) - (this.boxWidth / 2));
  private int maxY = (int)(( Constants.HEIGHT / 2 ) + ( Constants.HEIGHT / 16 ));
  private int minY;
  private boolean movingY = false;
  
  private boolean ltr;
  private boolean goesToShop;
  private boolean wentInShop = false;
  private boolean thinking = false;
  
  private int time;
  private int timeThinking = 5000;
  
  private CommonFunctions common = new CommonFunctions();
  
  public Person() {
    this.ltr = this.common.randomBoolean();
    this.goesToShop =  (random(0, 1) <= Constants.PERSON_IN_SHOP_PERCENT);
    this.speed = random(1, 2);
    this.minY = (int)random(10, 100);
    
    this.setInitialPosition();
    
    // TODO: Decide profession based on profession % and if unlocked
    // this.profession = ?
    // TODO: The color must depend on the profession assigned
    this.personColor = color(random(255), random(255), random(255));
    
    // TODO: Setup an initial random inventory
    
  }
  
  void draw() {
    fill(this.personColor);
    noStroke();
    pushMatrix();
    this.calculatePosition();
    rect(this.x, this.y, this.boxWidth, this.boxHeight);
    popMatrix();
  }
  
  public boolean removePerson() {
    return ( ( this.x + this.boxWidth < 0 ) || this.x > Constants.WIDTH);
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
    if (this.thinking) {
      // TODO
    }
  }
    
}
