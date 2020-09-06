Vehicle[] vehicles;
ArrayList<PVector> waypoints = new ArrayList<PVector>();

void setup(){
  size(800, 600);
  vehicles = new Vehicle[5];
  for (int i = 0; i < vehicles.length; i++)
    vehicles[i] = new Vehicle(random(width), random(height));
}

void mousePressed(){
  waypoints.add(new PVector(mouseX, mouseY));
}

PVector getWaypoint(Vehicle v){
  if (v.waypointN >= waypoints.size()){
     v.waypointN = 0;
  }
  return waypoints.get(v.waypointN);
}

void draw(){
  background(255, 100);
  
  //PVector mouse = new PVector(mouseX, mouseY);
  
  fill(200);
  stroke(0);
  strokeWeight(2);
  for (int i = 0; i < waypoints.size(); i++){
    PVector p = waypoints.get(i);
    ellipse(p.x, p.y,16,16);  
  }
  for (int i = 0; i < vehicles.length; i++){
    if (waypoints.size()> 0)
      vehicles[i].seek(getWaypoint(vehicles[i]));
      else
      vehicles[i].seek(new PVector(mouseX, mouseY));
    vehicles[i].update();
    vehicles[i].display();
  }
}