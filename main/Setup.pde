class Setup {
  private String nameHeader = "Write your username";
  private String colorHeader = "Choose your color";

  private String username = "";
  private int inputHeight = 32;
  private int inputTextSize = 20;
  private int headerTextSize = 24;
  private int headerY = Math.round(Constants.HEIGHT / 2);

  private int marginColorBox = 8;  
  private int colorBoxY = marginColorBox + headerTextSize + headerY;
  private int colorBoxW = 48;
  private int colorBoxH = 48;
  private ArrayList<Integer> positionsX = new ArrayList<Integer>();
  
  private ArrayList<int[]> colors = new ArrayList<int[]>();
  private int[] green = new int[] { 50, 168, 82 };
  private int[] blue = new int[] { 50, 74, 168 };
  private int[] pink = new int[] { 155, 53, 171 };
  private int[] red = new int[] { 171, 53, 53 };

  int currentScreen = 0;

  public Setup() {
    colors.add( green );
    colors.add( blue );
    colors.add( pink );
    colors.add( red );
    colors.add( new int[] {255, 255, 255} );
    colors.add( new int[] {0, 0, 0});
  }

  public void draw() {
    background(51);

    switch (currentScreen) {
    case 0: 
      drawInputName(); 
      break;
    case 1: 
      drawInputColor(); 
      break;
    default: 
      setupFinished(); 
      break;
    }
  }
  
  String getUsername() {
    return this.username;
  }

  public String processInput(String text, int keyCode, char key) {
    if (keyCode == ENTER && !Constants.isNullOrBlankSpace(text)) {
      currentScreen++;
      this.username = text.trim();
      return text;
    } else if (keyCode != ENTER) {
      return this.username = Constants.processInput(text, keyCode, key);
    }
    return this.username;
  }
  
  public boolean clickInColor(int mouseX, int mouseY) {
    if (mouseY <= colorBoxY || mouseY >= colorBoxY + colorBoxH) {
      return false;
    }
    
    boolean found = false;
    for (int positionX : this.positionsX) {
      if (mouseX >= positionX && mouseX <= positionX + colorBoxW ) {
        found = true;
        break;
      }
    }
    
    return found;
  }

  public color getColorClick(int mouseX, int mouseY) {
    color blockColor = color(0);
    boolean found = false;
    for(int i = 0; i < this.positionsX.size() && !found; i++) {
      if (mouseX >= this.positionsX.get(i) && mouseX <= this.positionsX.get(i) + colorBoxW ) {
        switch (i) {
          case 0:
            blockColor = color(this.green[0], this.green[1], this.green[2]);
            break;
          case 1:
            blockColor = color(this.blue[0], this.blue[1], this.blue[2]);
            break;
          case 2:
            blockColor = color(this.pink[0], this.pink[1], this.pink[2]);
            break;
          case 3:
            blockColor = color(this.red[0], this.red[1], this.red[2]);
            break;
        }
        found = true;
        break;
      }
    }
    currentScreen++;
    return blockColor;
  }
  
  /** PRIVATE METHODS **/

  private void drawInputName() {
    fill(255);
    textSize(headerTextSize);
    textAlign(CENTER);
    text(nameHeader, 0, headerY, Constants.WIDTH, inputHeight);
    textSize(inputTextSize);
    text(username, 0,  headerY + headerTextSize , Constants.WIDTH, inputHeight);
  }

  private void drawInputColor() {
    fill(255);
    textSize(headerTextSize);
    textAlign(CENTER);
    text(colorHeader, 0, headerY, Constants.WIDTH, inputHeight);
    noStroke();
    for (int i = 0; i < colors.size(); i++) {
      int[] colorNumbers = colors.get(i);
      color colorRgb = color(colorNumbers[0], colorNumbers[1], colorNumbers[2]);
      drawRectangleColor(colorRgb, i);
      
    } 
  }
  
  private void drawRectangleColor(color colorRgb, int number) {
    fill(colorRgb);
    
    int symbol = 1;
    int mult = number;
    int w = colorBoxW;
    if (number % 2 == 0) {
      symbol = -1;
      w /= 2;
    } else {
      mult++;
      if (number > 0) {
        mult = ((mult - 1) / 2) + 1;
      }
    }
    
    int x = Math.round(( Constants.WIDTH / 2 ) - ( symbol * w * mult ));
    this.positionsX.add(x);
    rect(x, colorBoxY, colorBoxW, colorBoxH);
  }

  private void setupFinished() {
    Constants.setupDone = true;
    currentScreen = 0;
  }
}
