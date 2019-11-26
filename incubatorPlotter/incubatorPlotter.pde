/*import processing.serial.*;

Serial myPort;
float prevY;
int inByte; 
 
void setup() {
  size(600, 200);
  printArray(Serial.list());
  myPort = new Serial(this, Serial.list()[0], 9600);
  //frameRate(1); To plot the graph at 1 point per second 
  frameRate(30);
  plot();
}


void draw() {
  
    while (myPort.available() > 0) {
    inByte = myPort.read();
    println("Temperature: " + inByte);
      
    float plotVar = random(height);
    plotVar = inByte;
    stroke(255, 0, 0);
    line(frameCount-1, prevY, frameCount, plotVar);
    prevY = plotVar;
    }
}
 
void plot() {
  background(0);
  for (int i = 0; i <= width; i += 50) {
    fill(0, 255, 0);
    text(i/2, i-10, height-15);
    stroke(255);
    line(i, height, i, 0);
  }
  for (int j = 0; j < height; j += 33) {
    fill(0, 255, 0);
    text(6-j/(height/6), 0, j);
    stroke(255);
    line(0, j, width, j);
  }
}
*/


 import processing.serial.*;
 
 //globales
 PFont f;
 PFont F;
 int cont = 0;
 int inByte;
 Serial myPort;       
 int xPos = 40;         
 
 void setup () {
 f = createFont("Arial",12,true);
 F = createFont("Arial",24,true);
 size(700, 600);        
 printArray(Serial.list());
 myPort = new Serial(this, Serial.list()[0], 9600);
 frameRate(1);
 background(70);
 }
 
 void draw(){
   serialEvent(myPort);
 }
 
 void serialEvent (Serial myPort) {
 while(myPort.available() > 0) {
   inByte = myPort.read();
   print("Temperature: ");
   print(inByte);
   println(" ºC");
 }
 
  stroke(175);
  line(40,height-40,40,0);
  stroke(175);
  line(40,height-40,width,height-40);
  stroke(100,100,255);                          // 30 degree line
  line(40,height-194,width,height-194);
  stroke(100,100,255);                          // 60 degree line
  line(40,height-344,width,height-344);
  textFont(F);       
  fill(255);
  textAlign(RIGHT);
  text("(T)",70,40);                         
  textAlign(RIGHT);
  text("(t)",650,580);
  textAlign(RIGHT);
  text(inByte,500,200);
  textAlign(RIGHT);
  text("Celsuis",500,230);
  fill(0);
  stroke(255);   
  
  for(int j=500;j>430;j--){
    line(j,height-398,j,height-425);
  }

  stroke(0,0,0);
  textAlign(RIGHT);
  text(inByte,495,200); 
  fill(240);
  textFont(f); 
  int altura = 100;
  
  for(int h = 60; h<561; h+=50){
    textAlign(RIGHT);
    String num = str(altura) + " -";
    text(num,40,h);
    altura-=10;
  }
  
 // draw the line:
 
 int shift=200;            // set trace origin
 stroke(255,0,0);              // trace colour
 for(int i=0;i<2;i++){
   
  
   line(xPos, height-inByte-(shift+2), xPos, height-inByte-shift);
   xPos++;
 }
 
 if(xPos >= width){
   xPos = 40;
   background(100); 
 } 
 
 }
 
 
