 import processing.serial.*;
 import gohai.simpletweet.*;
import java.math.*;
SimpleTweet simpletweet;

 //globales
 PFont f;
 PFont F;
 int cont = 0;
 int inByte;
 Serial myPort;       
 int xPos = 40;  
 boolean temperatureFlag = false;
 
 void setup () {
 f = createFont("Arial",12,true);
 F = createFont("Arial",24,true);
 size(700, 600);        
 printArray(Serial.list());
 myPort = new Serial(this, Serial.list()[0], 9600);
 frameRate(1);
 background(100);
 
   simpletweet = new SimpleTweet(this);

  simpletweet.setOAuthConsumerKey("muFfPVy7HI2CL0716RM7efadJ");
  simpletweet.setOAuthConsumerSecret("9TgwK3lFWddqDvPdpQ8zvVG0UF8In7rqN8VVx3VGioeO9dSxJo");
  simpletweet.setOAuthAccessToken("735237998-MhzepvvH1UY587w1QlnesaM6NYqRP3rIBBK9qxQj");
  simpletweet.setOAuthAccessTokenSecret("OqeIHCqgfXM7anFLolZgU4RNN8eAtqInEuUlsyTX4BFmf");
  
 }
 
 void draw(){
   serialEvent(myPort);
 }
 
 void serialEvent (Serial myPort) {
 while(myPort.available() > 0) {
   inByte = myPort.read();
   
   if(temperatureFlag){
     print("Danger ");
   }

     
     print("Temperature = ");
     print(inByte);
     println(" degrees");
   
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
 
 int shift=40;            // set trace origin
 stroke(255,0,0);              // trace colour
 for(int i=0;i<2;i++){

   //point(xPos,height-inByte*5);
   line(xPos, height-inByte*5-(shift+2), xPos, height-inByte*5-shift);
   xPos+=1;
 }
 
 
 
 if(inByte>=60){
     temperatureFlag = true;
     String tweet = simpletweet.tweetImage(get(), 
    "#ILoveMicrocontrollers\n");
    println("Posted " + tweet);
 }
 
 if(inByte <= 30){
   temperatureFlag = false;
 }
 
 
 
 if(xPos >= width){
   xPos = 40;
   println("estoy cleareando");
   background(0);
   background(100); 
 } 
 
 }
 
 
