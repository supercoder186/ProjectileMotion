import java.lang.Math;
import java.util.HashMap;


private PVector pos;
private PVector vel;
private final PVector gravity = new PVector(0, 0.1);
private int[] launchAngles = new int[]{10, 20, 30, 40, 45, 50, 60, 70, 80};
private int currentLaunch = -1;
private int frameCount = 0;
private color trailColor;
private ArrayList<TrailDot> dots = new ArrayList(); 

void setup(){
  size(1600, 900);
  pos = new PVector(100, 690);
  nextAngle();
}

void nextAngle(){
  currentLaunch ++;
  dots.add(new TrailDot(new PVector(pos.x, pos.y), trailColor));
  pos = new PVector(100, 690);
  if(currentLaunch < launchAngles.length){
    int angle = launchAngles[currentLaunch] + 270;
    vel = PVector.fromAngle((float) Math.toRadians(angle));
    vel.mult(11);
    trailColor = color(random(255), random(255), random(255));
  } else {
    vel = new PVector(0, 0);
    gravity.y = 0;
  }
}

void update(){
  vel.add(gravity);
  pos.add(vel);
  if(pos.x > width + 10 || pos.y > 691){
    System.out.println("The distance travelled was: " + (pos.x - 100) + " at angle: " + launchAngles[currentLaunch]);
    nextAngle();
  }
  
  frameCount ++;
  if(frameCount % 1 == 0){
    dots.add(new TrailDot(new PVector(pos.x, pos.y), trailColor));
  }
}

void draw(){
  frameRate(60);
  update();
  background(255);
  fill(255, 255, 0);
  rect(0, 700, 1600, 200);
  fill(255, 0, 0);
  ellipse(pos.x, pos.y, 20, 20);
  
  for(TrailDot dot : dots){
    noStroke();
    fill(dot.getCol());
    ellipse(dot.getPos().x, dot.getPos().y, 5, 5);
  }
}
