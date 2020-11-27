import java.util.Iterator;

Setup setup = new Setup();
Shop shop = new Shop(Constants.SHOP_START_EXP_REQUIRED, Constants.SHOP_EXP_REQUIRED_FACTOR);

// Items
final ArrayList<Item> items = new ArrayList<Item>() {{
  // RPG Adventurer + generics
  add(new Item("Sword", 125, 1, 2));
  add(new Item("Shield", 200, 1, 3));
  add(new Item("Heal Potion", 25, 1, 1));
  add(new Item("Mana Potion", 25, 1, 1));
  add(new Item("Leather Gloves", 40, 1, 1));
  add(new Item("Leather Boots", 40, 1, 1));
  add(new Item("Leather Belt", 40, 1, 1));
  add(new Item("Leather Helmet", 125, 1, 2));
  add(new Item("Leather Chestplate", 200, 1, 3));
  add(new Item("Leather Pants", 125, 1, 2));
  // RPG Wizard
  add(new Item("Wand", 150, 1, 2));
  add(new Item("Sorcery book", 250, 1, 3));
  add(new Item("Silver Ring", 50, 1, 1));
  add(new Item("Enchanted Ring", 100, 3, 1));
  add(new Item("Cloak", 150, 1, 2));
  add(new Item("Wizard hat", 150, 1, 2));
}};

  
final RPGClass adventurer = new RPGClass(
  "Adventurer",
  color(255),
  Constants.ADVENTURER_PERCENT,
  new ArrayList<Item>() {{
    add(Constants.getItemByName(items, "Sword"));
    add(Constants.getItemByName(items, "Shield"));
    add(Constants.getItemByName(items, "Heal Potion"));
    add(Constants.getItemByName(items, "Mana Potion"));
    add(Constants.getItemByName(items, "Leather Gloves"));
    add(Constants.getItemByName(items, "Leather Boots"));
    add(Constants.getItemByName(items, "Leather Belt"));
    add(Constants.getItemByName(items, "Leather Helmet"));
    add(Constants.getItemByName(items, "Leather Chestplate"));
    add(Constants.getItemByName(items, "Leather Pants"));
  }}
);
final RPGClass wizard = new RPGClass(
  "Wizard",
  color(135, 24, 219),
  Constants.WIZARD_PERCENT,
  new ArrayList<Item>() {{
    add(Constants.getItemByName(items, "Wand"));
    add(Constants.getItemByName(items, "Sorcery book"));
    add(Constants.getItemByName(items, "Heal Potion"));
    add(Constants.getItemByName(items, "Mana Potion"));
    add(Constants.getItemByName(items, "Silver Ring"));
    add(Constants.getItemByName(items, "Enchanted Ring"));
    add(Constants.getItemByName(items, "Leather Boots"));
    add(Constants.getItemByName(items, "Leather Belt"));
    add(Constants.getItemByName(items, "Cloak"));
    add(Constants.getItemByName(items, "Wizard hat"));
  }}
);
/*
TODO: Add more items for the classes:
Rogue,
Knight,
Assasin,
Ranger,
Cleric,
Necromancer,
Summoner,
Lancer
*/

final ArrayList<RPGClass> rpgClasses = new ArrayList<RPGClass>() {{
  add(adventurer);
  add(wizard);
}};

// Create the character with the default rpg class (adventurer)
Character character = new Character(adventurer);

ArrayList<Person> persons = new ArrayList<Person>();
int time = 0;


void setup() {
  size(1080, 720);
  smooth();
  character.addClass(wizard);
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
  generatePersons();
  removePersons();
  drawPersons();
}

void generatePersons() {
  for(RPGClass rpgClass : rpgClasses) {
    if (rpgClass.generatePerson()) {
      boolean isClassUnlocked = character.isClassUnlocked(rpgClass);
      this.persons.add(new Person(rpgClass, isClassUnlocked));
    }
  }
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
 
/** General functions **/
public <T> T getRandom(ArrayList<T> list) {
  int randomPos = getRandomPosition(list.size());
  return list.get(randomPos);
}
    
public int getRandomPosition(int size) {
  // We must do the +1 so they all have the same chance. Otherwise, the last one would have 1/2 chances.
  // (int)Math.floor(x) will always give the int closest to the lower.
    return (int)Math.floor(random(0, size));
}
  
/* Returns -1 or 1 */
public int randomSignum() {
  return (int) random(2) * 2 - 1;
}
    
public boolean randomBoolean() {
  return random(1) >= .5;
}

// Returns the same list without the initial item.
public static <T> ArrayList<T> filterList(ArrayList<T> list, T item) {
  for (Iterator<T> it = list.iterator(); it.hasNext();) {
    if (it.next() == item) {
      it.remove();
    }
  }
  return list;
}
