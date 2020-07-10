public class TrailDot{
  private final PVector position;
  private final color col;
  
  TrailDot(PVector position, color col){
    this.position = position;
    this.col = col;
  }
  
  public PVector getPos(){
    return position;
  }
  
  public color getCol(){
    return col;
  }
}
