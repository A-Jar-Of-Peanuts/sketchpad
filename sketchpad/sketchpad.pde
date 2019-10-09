color A = 0;
color B = 255;
color C = #757B92;
color D = #FFFEE4;
color E = #D0ECEA;
color F = #9FD6D2;
color G = #8B7A5E;
color[] c = {A, B, C, D, E, F, G};
color drawingColor = 0;

void setup(){
  size(600, 600);
  background(255);
  fill(80);
  rect(0, 0, 70, 600);
  int w = 20;
  for(int i : c){
    fill(i);
    ellipse(35, w, 20, 20);
    w+=30;
  }
}

void draw(){
  if(mousePressed){
     line(mouseX, mouseY, pmouseX, pmouseY);
  }
}

void mouseReleased(){
 
}
