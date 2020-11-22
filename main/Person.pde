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
  
  private boolean startLtr;
  private boolean finishLtr;
  private boolean wentInShop = false;
  private boolean thinking = false;
  
  private int time;
  private int timeThinking = 5000;
  
  private CommonFunctions common = new CommonFunctions();
  
  public Person() {
    this.startLtr = this.common.randomBoolean();
    this.finishLtr = this.common.randomBoolean();
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
    if (this.startLtr) {
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
        (
          !this.wentInShop && (
            (this.startLtr && this.x <= this.maxX) ||
            (!this.startLtr && this.x >= this.maxX)
          )
        ) || this.wentInShop && (this.y <= this.minY)
      ) {
        // Move X
        if ((!this.wentInShop && this.startLtr) || (this.wentInShop && this.finishLtr)) {
            // It's moving LTR on the X towards the shop or the end of the screen
            this.x += this.speed;
        } else {
            // It's moving RTL on the X towards the shop or the end of the screen
            this.x -= this.speed;
        }
      } else {
        // Move Y
        if (!this.wentInShop) {
          // It's moving on the Y towards the shop
          this.y += this.speed;
        } else if (this.y > this.minY) {
          // It's moving on the Y away from the shop
          this.y -= this.speed;
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
