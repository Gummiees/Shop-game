public class CommonFunctions {
  public CommonFunctions() { };
    
  public boolean randomBoolean() {
    return random(1) >= .5;
  }
  
  /* Returns -1 or 1 */
  public int randomSignum() {
    return (int) random(2) * 2 - 1;
  }
}
