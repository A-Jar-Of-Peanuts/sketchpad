color A = 0;
color B = 255;
color C = #757B92;
color D = #FFFEE4;
color E = #D0ECEA;
color F = #9FD6D2;
color G = #8B7A5E;
color[] c = {A, B, C, D, E, F, G};
color drawingColor = 0;
color backc = 255;
int linesize = 1;
int opacity = 255;
int slx, sly;
int borderx = 75;
int bordery = 65;
boolean lines = true;

void setup(){
  size(600, 600);
  background(backc);
  fill(80);
  stroke(80);
  rect(0, 0, 70, 600);
  rect(0, 0, 600, 60);
  stroke(0);
  int w = 20;
  for(int i : c){
    fill(i);
    ellipse(35, w, 20, 20);
    w+=30;
  }
  rect(521, 10, 50, 15);
  rect(450, 10, 50, 15);
  
  fill(0, 0, 255);
  text("CLEAR", 525, 21);
  text("ERASE", 455, 21);
  slx = 35;
  sly = 240;
}

void draw(){
  //System.out.println(mouseX+" , "+mouseY);
  if(mousePressed && mouseX>=borderx && mouseY>=bordery){
     stroke(drawingColor, opacity);
     strokeWeight(linesize);
     line(mouseX, mouseY, pmouseX, pmouseY);
  }
  fill(200);
  strokeWeight(2);
  stroke(0);
  rect(20, 225, 30, 120);
  line(35, 230, 35, 340);
  fill(100);
  ellipse(slx, sly, 10, 10);
  if(mousePressed && dist(slx, sly, mouseX, mouseY)<20 && mouseY>230 && mouseY < 340){
    sly = mouseY;
    ellipse(35, sly, 10, 10);
    if(lines)
    linesize = (int)map(sly, 230, 340, 1, 20);
    else{
      opacity = (int)map(sly, 230, 340, 255, 0);
    }
    //borderx = (int)map(mouseY, 1, 5, 2, 6);
    //bordery = (int)map(mouseY, 1, 5, 2, 6);
    System.out.println(linesize);
  }
  
  rect(300, 10, 130, 15);
  fill(0, 0, 255);
  if(lines){
    text("CHANGE LINE SIZE", 310, 21);
  } else{
    text("CHANGE OPACITY", 315, 21);
  }
  
}

void mouseReleased(){
  if(dist(35, 20, mouseX, mouseY)<10){
     drawingColor = A;
   } else if(dist(35, 50, mouseX, mouseY)<10){
     drawingColor = B;
   } else if(dist(35, 80, mouseX, mouseY)<10){
     drawingColor = C;
   } else if(dist(35, 110, mouseX, mouseY)<10){
     drawingColor = D;
   } else if(dist(35, 140, mouseX, mouseY)<10){
     drawingColor = E;
   } else if(dist(35, 170, mouseX, mouseY)<10){
     drawingColor = F;

 } else if(dist(35, 200, mouseX, mouseY)<10){
     drawingColor = G;
   }
   if(mouseX >= 525 && mouseX <= 521+50 && mouseY >= 10 && mouseY <=10+15){
     fill(backc);
     rect(70, 60, 530, 540);

   } 
   if(mouseX >= 455 && mouseX <= 455+50 && mouseY >= 10 && mouseY <=10+15){
     drawingColor = backc;
   } 
   
   if(mouseX >= 300 && mouseX <= 300+130 && mouseY >= 10 && mouseY <=10+15){
     lines = !lines;
     System.out.println("ok");
   } 
   
}
