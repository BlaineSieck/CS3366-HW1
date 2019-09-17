import controlP5.*;
import java.util.*;
import processing.sound.*;
  
SoundFile file;

ControlP5 cp5;

boolean help = false;
Textlabel helpLabel;
String audioName = "alarmsound.mp3";
String path;

Toggle tog1;
Toggle tog2;
Toggle tog3;
Toggle tog4;
Toggle tog5;
Toggle tog6;
//Toggle togopen;
//Toggle togclose;
//Toggle toghelp;
Toggle togalarm;

Timer time = new Timer();

void setup() {
   size(600, 750);
   cp5 = new ControlP5(this);
   
   tog4 = cp5.addToggle("toggle 4")
   .setPosition(100,100)
   .setImages(loadImage("4.png"), loadImage("4.png"), loadImage("4fill.png"))
   .updateSize()
   .setState(false);
   
   /*cp5.addButton("button4")
   .setPosition(100, 100)
   .setImages(loadImage("4.png"), loadImage("4.png"), loadImage("4fill.png"))
   .updateSize();*/
   
   tog5 = cp5.addToggle("toggle 5")
   .setPosition(250,100)
   .setImages(loadImage("5.png"), loadImage("5.png"), loadImage("5fill.png"))
   .updateSize()
   .setState(false);
   
   /*cp5.addButton("button5")
   .setPosition(250, 100)
   .setImages(loadImage("5.png"), loadImage("5.png"), loadImage("5fill.png"))
   .updateSize();*/
   
   tog6 = cp5.addToggle("toggle 6")
   .setPosition(400,100)
   .setImages(loadImage("6.png"), loadImage("6.png"), loadImage("6fill.png"))
   .updateSize()
   .setState(false);
   
   /*cp5.addButton("button6")
   .setPosition(400, 100)
   .setImages(loadImage("6.png"), loadImage("6.png"), loadImage("6fill.png"))
   .updateSize();*/
   
   tog1 = cp5.addToggle("toggle 1")
   .setPosition(100, 250)
   .setImages(loadImage("1.png"), loadImage("1.png"), loadImage("1fill.png"))
   .updateSize()
   .setState(false);
   
   /*cp5.addButton("button1")
   .setPosition(100, 250)
   .setImages(loadImage("1.png"), loadImage("1.png"), loadImage("1fill.png"))
   .updateSize();*/
   
   tog2 = cp5.addToggle("toggle 2")
   .setPosition(250, 250)
   .setImages(loadImage("2.png"), loadImage("2.png"), loadImage("2fill.png"))
   .updateSize()
   .setState(false);
   
   /*cp5.addButton("button2")
   .setPosition(250, 250)
   .setImages(loadImage("2.png"), loadImage("2.png"), loadImage("2fill.png"))
   .updateSize();*/
   
   tog3 = cp5.addToggle("toggle 3")
   .setPosition(400, 250)
   .setImages(loadImage("3.png"), loadImage("3.png"), loadImage("3fill.png"))
   .updateSize()
   .setState(false);
   
   /*cp5.addButton("button3")
   .setPosition(400, 250)
   .setImages(loadImage("3.png"), loadImage("3.png"), loadImage("3fill.png"))
   .updateSize();*/
   
   /*togopen = cp5.addToggle("toggle open")
   .setPosition(175, 400)
   .setImages(loadImage("open.png"), loadImage("open.png"), loadImage("openfill.png"))
   .updateSize()
   .setState(false);*/
   
   cp5.addButton("openButton")
   .setPosition(175, 400)
   .setImages(loadImage("open.png"), loadImage("open.png"), loadImage("openfill.png"))
   .updateSize();
   
   /*togclose = cp5.addToggle("toggle close")
   .setPosition(325, 400)
   .setImages(loadImage("close.png"), loadImage("close.png"), loadImage("closefill.png"))
   .updateSize()
   .setState(false);*/
   
   cp5.addButton("closeButton")
   .setPosition(325, 400)
   .setImages(loadImage("close.png"), loadImage("close.png"), loadImage("closefill.png"))
   .updateSize();
   
   /*toghelp = cp5.addToggle("togglehelp")
   .setPosition(100, 550)
   .setImages(loadImage("phone.png"), loadImage("phone.png"), loadImage("phonefill.png"))
   .updateSize()
   .setState(false);*/
   
   cp5.addButton("helpButton")
   .setPosition(100, 550)
   .setImages(loadImage("phone.png"), loadImage("phone.png"), loadImage("phonefill.png"))
   .updateSize();
   
   helpLabel = cp5.addTextlabel("help label")
   .setText(" LIGHT INDICATES\nCALL IS ANSWERED")
   .setColorValue(0)
   .setFont(createFont("Georgia", 15))
   .setPosition(225, 585);
   
   togalarm = cp5.addToggle("togglealarm")
   .setPosition(400, 550)
   .setImages(loadImage("alarm.png"), loadImage("alarm.png"), loadImage("alarmfill.png"))
   .updateSize()
   .setState(false);
   
   /*cp5.addButton("alarmButton")
   .setPosition(400, 550)
   .setImages(loadImage("alarm.png"), loadImage("alarm.png"), loadImage("alarmfill.png"))
   .updateSize();*/
   
   path = sketchPath(audioName);
   file = new SoundFile(this, path);
}

void draw() {
  PImage img;
  img = loadImage("ssbf.jpg");
  background(img);
  
  circle(300, 635, 20);
  if (help == false) {
    fill(0);
  }
  if (help == true) {
    if(frameCount % 5 == 0) {
      fill(0);
      delay(250);
    }
    else {
      fill(#FF0000);
      delay(250);
    }
  }
  if(tog1.getState() == true | tog2.getState() == true | tog3.getState() == true |
     tog4.getState() == true | tog5.getState() == true | tog6.getState() == true) {
    off();
  }
  
  if(togalarm.getState() == true) {
    file.play();
    delay(3000);
    alarmsound();
    togalarm.setState(false);
  }
}

void alarmsound() {
  file.stop();
}

void helpButton() {
  help = true;
}

void mousePressed() {
  help = false;
}

void off() {
  if (tog1.getState() == true) {
    time.schedule(new TimerTask() {
      public void run() {
        tog1.setState(false);
      }
    }, 5000);
  }
  if (tog2.getState() == true) {
    time.schedule(new TimerTask() {
      public void run() {
        tog2.setState(false);
      }
    }, 5000);
  }
  if (tog3.getState() == true) {
    time.schedule(new TimerTask() {
      public void run() {
        tog3.setState(false);
      }
    }, 5000);
  }
  if (tog4.getState() == true) {
    time.schedule(new TimerTask() {
      public void run() {
        tog4.setState(false);
      }
    }, 5000);
  }
  if (tog5.getState() == true) {
    time.schedule(new TimerTask() {
      public void run() {
        tog5.setState(false);
      }
    }, 5000);
  }
  if (tog6.getState() == true) {
    time.schedule(new TimerTask() {
      public void run() {
        tog6.setState(false);
      }
    }, 5000);
  }
}
