import java.util.*;


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
//PGraphics pg;
//PGraphics pg2;
public static LayersSketch l;
boolean thumbnail = false;

void settings(){
  size(600, 600);
  
}

void setup(){
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
  
  //pg = createGraphics(700, 600);
  //pg2 = createGraphics(700, 600);
  
  String[] args = {"Layer"};
  l = new LayersSketch();
  PApplet.runSketch(args, l);
  
  
}
void draw(){
  
  //System.out.println(mouseX+" , "+mouseY);
  
  if(mousePressed && mouseX>=borderx && mouseY>=bordery){
     l.getPG().beginDraw();
     l.getPG().stroke(drawingColor, opacity);
     l.getPG().strokeWeight(linesize);
     l.getPG().line(mouseX-75, mouseY-75, pmouseX-75, pmouseY-75);
     l.getPG().endDraw();
     //pg.beginDraw();
     //pg.stroke(drawingColor, opacity);
     //pg.strokeWeight(linesize);
     //pg.line(mouseX-75, mouseY-75, pmouseX-75, pmouseY-75);
     //pg.endDraw();
     System.out.println("hi");
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
  
  //pg.beginDraw();
  //pg.background(255);
  //pg.noFill();
  //pg.stroke(0);
  //pg.ellipse(mouseX-75, mouseY-75, 30, 30);
  //pg.endDraw();
  
  
    image(l.background, 75, 75);
    image(l.Layer1, 75, 75);
    image(l.Layer2, 75, 75);
    image(l.Layer3, 75, 75);
    thumbnail = true;
    
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
     l.getPG().beginDraw();
     l.getPG().fill(backc);
     l.getPG().rect(70, 60, 530, 540);
     l.getPG().endDraw();
   } 
   if(mouseX >= 455 && mouseX <= 455+50 && mouseY >= 10 && mouseY <=10+15){
     drawingColor = backc;
   } 
   
   if(mouseX >= 300 && mouseX <= 300+130 && mouseY >= 10 && mouseY <=10+15){
     lines = !lines;
     System.out.println("ok");
     //300, 10, 130, 15
   } 
   
   
}


public class LayersSketch extends PApplet{
  public ArrayList<PGraphics> list = new ArrayList<PGraphics>();
  int on;
  int name = 4;
  public PGraphics background, Layer1, Layer2, Layer3;
  public LayersSketch(){
    background = new PGraphics();
    Layer1 = new PGraphics();
    Layer2 = new PGraphics();
    Layer3 = new PGraphics();
    list.add(background);
    list.add(Layer1);
    list.add(Layer2);
    list.add(Layer3);
    on = 0;
   
  }
  public void settings(){
    size(100, 400);
    
  }
  public void setup(){
     background = createGraphics(700, 600);
    Layer1 = createGraphics(700, 600);
    Layer2 = createGraphics(700, 600);
    Layer3 = createGraphics(700, 600);
  }
  public void draw(){
   
    
    System.out.println(mouseX+", "+ mouseY);
    fill(255);
    //rect(20, 370, 50, 10);
    //fill(0);
    //text("create",22, 380);
    if(on == 0){
      stroke(0, 0, 255);
    }
    fill(255);
    rect(10, 370, 50, 10);
    fill(0);
    text("Background", 10, 380);
    stroke(0);
    
    if(on == 1){
      stroke(0, 0, 255);
    }
    fill(255);
    rect(10, 270, 50, 10);
    fill(0);
    text("Layer 1", 10, 280);
    stroke(0);
    
    if(on == 2){
      stroke(0, 0, 255);
    }
    fill(255);
    rect(10, 170, 50, 10);
    fill(0);
    text("Layer 2", 10, 180);
    stroke(0);
    
    if(on == 3){
      stroke(0, 0, 255);
    }
    fill(255);
    rect(10, 70, 50, 10);
    fill(0);
    text("Layer 3", 10, 80);
    stroke(0);
    
    for(PGraphics i : list){
      i = createGraphics(40, 30);
      i.beginDraw();
      i.endDraw();
      if(thumbnail)
      image(i, 10, 300);
    }
    
    
    if(thumbnail){
    ////if(background!=null)
    //image(background, 10, 300);
    ////if(Layer1!=null)
    //image(Layer1, 20, 350);
    ////if(Layer2!=null)
    //image(Layer2, 20, 350);
    ////if(Layer3!=null)
    //image(Layer3, 20, 350);
    background.beginDraw();
    background.endDraw();
    
    Layer1.beginDraw();
    Layer1.endDraw();
    
    Layer2.beginDraw();
    Layer2.endDraw();
    
    Layer3.beginDraw();
    Layer3.endDraw();
    
    PImage img = background.get();
    img.resize(30, 40);
    image(img, 15, 320);
    
    PImage img1 = Layer1.get();
    img1.resize(30, 40);
    image(img1, 15, 220);
    
    PImage img2 = Layer2.get();
    img2.resize(30, 40);
    image(img2, 15, 120);
    
    PImage img3 = Layer3.get();
    img3.resize(30, 40);
    image(img3, 15, 20);
  }
    }
  
  
  void mouseReleased(){
    if(mouseX>=10 && mouseX<=10+50 && mouseY>=370 && mouseY<=370+10){
     on = 0;
   }
   else if(mouseX>=10 && mouseX<=10+50 && mouseY>=270 && mouseY<=370+10){
     on = 1;
   }
   else if(mouseX>=10 && mouseX<=10+50 && mouseY>=170 && mouseY<=370+10){
     on = 2;
   }
   else if(mouseX>=10 && mouseX<=10+50 && mouseY>=70 && mouseY<=370+10){
     on = 3;
   }
  }
  
  PGraphics getPG(){
    switch(on){
      case 0:
        return background;
      case 1:
        return Layer1;
      case 2:
        return Layer2;
      case 3:
        return Layer3; 
      default:
        return background;
    }
    
  }
}
