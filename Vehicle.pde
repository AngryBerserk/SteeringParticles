class Vehicle{
  
 PVector location;
 PVector velocity;
 PVector acceleration;
 float r;
 float maxForce;
 float maxSpeed;
 int waypointN;
 
 Vehicle(float x, float y){
   acceleration = new PVector();
   velocity = new PVector(0, -2);
   location = new PVector(x,y);
   r = 6;
   maxSpeed = 4;
   maxForce = 0.1;
 }
 
 void update(){
   velocity.add(acceleration);
   velocity.limit(maxSpeed);
   location.add(velocity);
   acceleration.mult(0);
 }
 
 void applyForce(PVector force){
  acceleration.add(force); 
 }
 
 void seek(PVector target){
    PVector desired = PVector.sub(target, location); 
    float d = desired.mag();
    
    if (d<20) waypointN++;
    desired.setMag(maxSpeed);
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxForce);
    applyForce(steer);
 }
 
 void display(){
  float theta = velocity.heading2D() + PI/2;
  pushMatrix();
  translate(location.x, location.y);
  rotate(theta);
  triangle(-5,5,0,-5,5,5);
  popMatrix();
 }
 
 
}