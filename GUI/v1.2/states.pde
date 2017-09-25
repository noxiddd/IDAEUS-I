/////////////////////////////////////////////////STATES/////////////////////////////////////////////////

 

 
 // states
final int stateMenu                  = 0;

final int stateSeeChartAltitude     = 1;
final int stateSeeChartBattery      = 2;
final int stateSeeChartSpectrograph = 3;
final int stateSeeOrbitalSim = 4;

final int stateSeeFootballStatistics = -1;

final int sim_panelX=600;
final int sim_panelY=10;
final int chartPanelX=10;
final int chartPanelY=400;
int last_chart=0;

int state = 1;//stateSeeChartAltitude;//stateMenu;

void switchStates()
{
switch (state) {
  case stateMenu:
    showMenu();
    //makePanel(10,400,"Alititude",600,300,0);
    break;
  case stateSeeChartAltitude:
  
    handleStateSeeChartAltitude();
    break;
  case  stateSeeChartBattery:
    handleStateSeeChartBattery();
    break;
  case  stateSeeChartSpectrograph:
    handleStateSeeChartSpectrograph();
    break;
  case  stateSeeOrbitalSim:
    handleStateSeeOrbitalSim();
    
    break;
    
    
  default:
    println ("Unknown state (in draw) "
      + state
      + " ++++++++++++++++++++++");
    exit();
    break;
  } // switch

}

void keyPressedForStateSeeChartAltitude() {
  // any key is possible
  switch(key) {
    case '1':
      state = stateSeeChartAltitude;    
    break;
    case '2':
    state = stateSeeChartBattery;
    break;
  case '3':
    state = stateSeeChartSpectrograph;
    break;
   case '4':
    state=stateSeeOrbitalSim;
   break;   
    
  default:
    state = stateMenu;
    break;
  } // switch
  //
} // func

void keyPressedForStateSeeChartBattery() {
  // any key is possible
  switch(key) {
    case '1':
    state = stateSeeChartAltitude;    
    break;
   case '2':
    state = stateSeeChartBattery;
   break;
    
  case '3':
    state = stateSeeChartSpectrograph;
    break;
  case '4':
    state=stateSeeOrbitalSim;
   break; 
 
  default:
    state = stateMenu;
    break;
  } // switch
  //
} // func

void keyPressedForStateSeeChartSpectrograph() {
  // any key is possible
  switch(key) {
  case '1':
    state = stateSeeChartAltitude;   
    break;
  case '2':
    state = stateSeeChartBattery;
    break;
  case '3':
   state = stateSeeChartSpectrograph;
  break;  
    
  case '4':
    state=stateSeeOrbitalSim;
   break; 
   
   default:
    state = stateMenu;
    break;
  } // switch
  //
} // func

void keyPressedForStateSeeOrbitalSim()
{
    switch(key) {
  case '1':
    state = stateSeeChartAltitude;   
    break;
  case '2':
    state = stateSeeChartBattery;
    break;
   case '3':
   state = stateSeeChartSpectrograph;
    break;  
   case '4':
    state=stateSeeOrbitalSim;
   break; 
   default:
    state = stateMenu;
    break;
  } // switch

}

/*
void keyPressedForStateSeeChartFootball() {
  // any key is possible
  switch(key) {
    
  default:
    state = stateMenu;
    break;
  } // switch
  //
} // func
void keyPressedForStateSeeFootballStatistics() {
  // any key is possible
  switch(key) {
  default:
    state = stateMenu;
    break;
  } // switch
  //
}
*/
void keyPressedForStateMenu() {
  //
  switch(key) {
  case '1':
    state = stateSeeChartAltitude;
    break;
  case '2':
    state = stateSeeChartBattery;
    break;
  case '3':
    state = stateSeeChartSpectrograph;
    break;  
  case '4':
    state=stateSeeOrbitalSim;
   break; 

  case 'x':
  case 'X':
    // quit
    exit();
    break;
  default:
    // do nothing
    break;
  }// switch
  //
} // func



void handleStateSeeChartAltitude() {
  makePanel(chartPanelX,chartPanelY,"Alititude",600,300,0);
  make_sim_panel(sim_panelX,sim_panelY,"Orbtial Simulation",600,300);
  last_chart=1;
} // func
//


void handleStateSeeChartBattery() {

 makePanel(chartPanelX,chartPanelY,"Battery",600,300,1);
 make_sim_panel(sim_panelX,sim_panelY,"Orbtial Simulation",600,300);
 last_chart=2;
} // func
//

void handleStateSeeChartSpectrograph() {
  makePanel(chartPanelX,chartPanelY,"Spectrograph",600,300,2);
  make_sim_panel(sim_panelX,sim_panelY,"Orbtial Simulation",600,300);
  last_chart=3;
} // func
//

void handleStateSeeOrbitalSim() {
 make_sim_panel(sim_panelX,sim_panelY,"Orbtial Simulation",600,300);
 switch(last_chart)
 {
     case 1:
       makePanel(chartPanelX,chartPanelY,"Alititude",600,300,0);
     break;
     case 2:
       makePanel(chartPanelX,chartPanelY,"Battery",600,300,1);
     break;
     case 3:
       makePanel(chartPanelX,chartPanelY,"Spectrograph",600,300,2);
     break;
 }
} // func
//
 
  
  
void showMenu() {
  //background(255, 204, 0);
  fill(0);
  textSize(32);
  text(" Menu Option ", 450, 100, 3);
  textSize(16);
  text("Press 1 See chart Altitude Graph ", 100, 200);
  text("Press 2 See Battery Graph ", 100, 240);
  text("Press 3 See Spectrograph ", 100, 260);
  text("Press 4 See Orbital Sim ", 100, 280);
  //
  text("Press x to quit ", 100, 320);
  //
} // func


void showGraphs()
{

   makePanel(sim_panelX,sim_panelY,"Alititude",600,300,0);
   //makePanel(10,40,"Battery",600,300,1);
   //makePanel(700,400,"Spectrograph",600,300,2);
}

void keyPressed() {
  // keyboard. Also different depending on the state.
  switch (state) {
  case stateMenu:
    keyPressedForStateMenu();
    break;
  case stateSeeChartAltitude:
    keyPressedForStateSeeChartAltitude();
    break;
  case stateSeeChartBattery:
    keyPressedForStateSeeChartBattery();
    break;
  case stateSeeChartSpectrograph:
    keyPressedForStateSeeChartSpectrograph();
    break;
  case stateSeeOrbitalSim:
    keyPressedForStateSeeOrbitalSim();
    break;  
    
  default:
    println ("Unknown state (in keypressed) "
      + state
      + " ++++++++++++++++++++++");
    exit();
    break;
  } // switch
  //
} // func
