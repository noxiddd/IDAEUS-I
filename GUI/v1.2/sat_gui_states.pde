import org.gicentre.utils.stat.*;    // For chart classes.
import controlP5.*;
import org.gicentre.utils.stat.*;    // For chart classes.
 


PImage sat_img; 
float trigrams_64_palms_rotation=0.0;

ControlP5 jControl;

RadioButton alt_chart,batterychart,spectrochart;
int Bcolour=100;
 Slider leftPanel,rightPanel;

 Slider2D s2;

// Displays a simple line chart representing a time series.
 
XYChart altitude_lineChart,battery_lineChart,spectrograph_lineChart;
 

 
 
 
void setup()
{
  size(1300,700,P3D);
  sat_img=loadImage("C:\\Users\\JD039274\\Documents\\Processing\\satimage.jpeg");
  //imageMode(CENTER);//set the point of action to center of image
  jControl=new ControlP5(this);
  //s=jControl.addSlider("Bcolour",0,255,23,10,10,10,100);
  //s2=jControl.addSlider2D("sine").setPosition(100,50).setMinMax(10,-10,10,-10).setSize(500,60).setValue(2,-5);
  
  chartSetup();  
  sim_setup(400,10);
}
void draw()
{
 
 //trigrams_64_palms_rotation+=0.02;
/* if (Bcolour<50)
   {
     s2.setColorBackground(color(0,255,0));
   }
 e    lse 
   {
     s2.setColorBackground(color(255,0,0));
   }*/
 background(Bcolour);
 
 
  image(sat_img,0,0,1300,700);
  //showGraphs();
   switchStates();
     
}

void makePanel(int Xpos,int Ypos,String name, int width_rect, int height_rect, int chartType)
{
   pushMatrix();
     translate(Xpos,Ypos);
     fill(25);
     rect(0,0,width_rect,height_rect);
      pushMatrix();
        fill(255);
        text(name,0,10);
       popMatrix();
   drawChart(name,width_rect-10,height_rect-60,chartType);    
   popMatrix();
   //alt_chart,batterychart,spectrochart;
  // alt_chart=jControl.addRadioButton("Show_Altitude").setPosition(width_rect,height_rect-10);   
}

void make_sim_panel(int Xpos,int Ypos,String name, int width_rect, int height_rect)
{
   pushMatrix();
     translate(Xpos,Ypos);
     fill(25);
     rect(0,0,width_rect,height_rect);
      pushMatrix();
        fill(255);
        text(name,0,10);
       popMatrix();
    sim_draw(width_rect,height_rect);    
   popMatrix(); 

}

void controlPanel(int Xpos,int Ypos,String name, int width_rect, int height_rect)
{

   pushMatrix();
     translate(Xpos,Ypos);
     fill(25);
     rect(0,0,width_rect,height_rect);
      pushMatrix();
        fill(255);
        text(name,0,10);
       popMatrix();
    //sim_draw(width_rect,height_rect);
    control(width_rect,height_rect);
   popMatrix(); 
}

void control(int w, int h)
{
  leftPanel=jControl.addSlider("Bcolour",0,255,23,10,10,10,100);
  rightPanel=jControl.addSlider("Bcolours",0,255,23,10,10,10,100);
  
}

void chartSetup()
{
textFont(createFont("Arial",10),10);
 
  // Both x and y data set here.  
  altitude_lineChart = new XYChart(this);
  battery_lineChart = new XYChart(this);
  spectrograph_lineChart = new XYChart(this);
  
  altitude_lineChart.setData(new float[] {0, 10, 20, 30, 40, 50,
                                  60, 70, 80, 90, 100},
                    new float[] { 632,  648,  640, 765, 964, 976,
                                  816, 815, 820, 812, 864});
  battery_lineChart.setData(new float[] {0, 10, 20, 30,40, 50,
                                  60, 70, 80, 90, 100},
                    new float[] { 8,  8,  7.7, 7.6, 7.8, 7.9,
                                  8, 7.4, 7.5, 7.7, 7.8});
  spectrograph_lineChart.setData(new float[] {0, 10, 20, 30, 40, 50,
                                  60, 70, 80, 90, 100},
                    new float[] { 25,  89,  122, 156, 212, 243,
                                  200, 199, 76, 30 , 45});                                  
   
  // Axis formatting and labels.
  altitude_lineChart.showXAxis(true);
  battery_lineChart.showXAxis(true);
  spectrograph_lineChart.showXAxis(true);
  
  
  altitude_lineChart.showYAxis(true);
  battery_lineChart.showYAxis(true);
  spectrograph_lineChart.showYAxis(true);
  
  altitude_lineChart.setMinY(0);
  battery_lineChart.setMinY(0);
  spectrograph_lineChart.setMinY(0);
     
  altitude_lineChart.setYFormat("### km");  // Meters
  battery_lineChart.setYFormat("###,### volts");  // Volts
  spectrograph_lineChart.setYFormat("###,###");  // no units
  
  altitude_lineChart.setXFormat("0s");      // seconds
  battery_lineChart.setXFormat("0s ");      // seconds
  spectrograph_lineChart.setXFormat("0s");      // seconds
   
  // Symbol colours
  altitude_lineChart.setPointColour(color(180,50,50,100));
  battery_lineChart.setPointColour(color(180,50,50,100));
  spectrograph_lineChart.setPointColour(color(180,50,50,100));
  
  altitude_lineChart.setPointSize(5);
  battery_lineChart.setPointSize(5);
  spectrograph_lineChart.setPointSize(5);
  
  altitude_lineChart.setLineWidth(2);
  battery_lineChart.setLineWidth(2);
  spectrograph_lineChart.setLineWidth(2);

}


void drawChart(String name,int widthh, int heighth, int chartType)
{
textSize(9);
if(chartType==0)
  altitude_lineChart.draw(30,60,widthh-30,heighth-30);
else if (chartType==1)
  battery_lineChart.draw(30,60,widthh-30,heighth-30);
else if (chartType==2)
  spectrograph_lineChart.draw(30,60,widthh-30,heighth-30);
  
  // Draw a title over the top of the chart.
  fill(120);
  textSize(20);
  text(name, 60,30);
  textSize(11);
  /*text("Gross domestic product measured in inflation-corrected $US", 
        70,45);*/

}
