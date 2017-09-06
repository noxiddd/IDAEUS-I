import controlP5.*;
PImage sat_img; 
float trigrams_64_palms_rotation=0.0;
ControlP5 jControl;
int Bcolour=100;
 Slider s;
 Slider2D s2;
void setup()
{
  size(600,600,P3D);
  sat_img=loadImage("C:\\Users\\JD039274\\Documents\\Processing\\satimage.jpeg");
  imageMode(CENTER);//set the point of action to center of image
  jControl=new ControlP5(this);
  s=jControl.addSlider("Bcolour",0,255,23,10,10,10,100);
  s2=jControl.addSlider2D("sine").setPosition(100,50).setMinMax(10,-10,10,-10).setSize(500,60).setValue(2,-5);
  
}
void draw()
{
 trigrams_64_palms_rotation+=0.04;
 if (Bcolour<50)
   {
     s2.setColorBackground(color(0,255,0));
   }
 else 
   {
     s2.setColorBackground(color(255,0,0));
   }
 background(Bcolour);
 
 pushMatrix();
   translate(mouseX,mouseY);
   rotateY(trigrams_64_palms_rotation);
   image(sat_img,0,0);
   
    
  popMatrix();
}
