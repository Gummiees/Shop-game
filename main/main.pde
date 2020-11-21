Character character = new Character();
Setup setup = new Setup();


void setup() {
  size(1920, 1080);
  smooth();
}

void draw() {
  if (Constants.setupDone) {
    drawCharacter();
    drawUI();
  } else {
    drawSetup();
  }
}

void drawCharacter() {
  character.draw();
}

void drawUI() {
}

void drawSetup() {
  setup.draw();
}

void keyPressed() {
  if (!Constants.setupDone && setup.currentScreen == 0) {
    character.setUsername(setup.processInput(setup.getUsername(), keyCode, key)); 
  }
}

void mouseClicked() {
  if (!Constants.setupDone && setup.currentScreen == 1 && setup.clickInColor(mouseX, mouseY)) {
    character.setColor(setup.getColorClick(mouseX, mouseY)); 
  }
}
