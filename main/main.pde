Character character = new Character();
Setup setup = new Setup();
Shop shop = new Shop(Constants.SHOP_START_EXP_REQUIRED, Constants.SHOP_EXP_REQUIRED_FACTOR);

ArrayList<Person> persons = new ArrayList<Person>();
int time = 0;


void setup() {
  size(1080, 720);
  smooth();
}

void draw() {
  if (Constants.setupDone) {
    clear();
    
    drawShop();
    personStuff();
    // drawCharacter();
    drawUI();
  } else {
    drawSetup();
  }
}

void drawSetup() {
  setup.draw();
}

void drawShop() {
  shop.draw();
}

void drawCharacter() {
  character.draw();
}

void personStuff() {
  /*
  if ((millis() >= 2500 + time) && generatePerson()) {
    this.persons.add(new Person());
    time = millis();
  }
  */
  if (generatePerson()) {
    this.persons.add(new Person());
  }
  
  removePersons();
  drawPersons();
}

void removePersons() {
  ArrayList<Integer> ids = new ArrayList<Integer>();
  for (int i = 0; i < persons.size(); i++) {
    if (persons.get(i).removePerson()) {
      ids.add(i);
    }
  }
  for (int i : ids) {
    persons.remove(i);
  }
}

void drawPersons() {
  for (Person person : persons) {
    person.draw();
  }
}

void drawUI() {
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

boolean generatePerson() {
  return (random(0, 1) <= Constants.PERSON_PERCENT);
}
