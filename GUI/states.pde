/////////////////////////////////////////////////STATES/////////////////////////////////////////////////

 

 
 // states
final int stateMenu                  = 0;

final int stateSeeChartAltitude     = 1;
final int stateSeeChartBattery      = 2;
final int stateSeeChartSpectrograph = 3;

final int stateSeeFootballStatistics = 2;

int state = stateMenu;//stateSeeChartAltitude;//stateMenu;

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
  case stateSeeFootballStatistics:
    handleStateSeeFootballStatistics();
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
  default:
    state = stateMenu;
    break;
  } // switch
  //
} // func

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

void keyPressedForStateMenu() {
  //
  switch(key) {
  case '1':
    state = stateSeeChartAltitude;
    
    break;
  case '2':
    state = stateSeeFootballStatistics;
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
  //background(255, 204, 0);
  ///fill(0);
  //textSize(32);
  /*text(" Altitude ", 150, 100, 3);
  textSize(14);
  text("..... some text ", 100, 200);
  //*/
  makePanel(10,400,"Alititude",600,300,0);
} // func
//

void handleStateSeeFootballStatistics() {
  background(255, 204, 0);
  fill(0);
  textSize(32);
  text(" See football statistics ", 150, 100, 3);
  textSize(14);
  text("..... some text ", 100, 200);
  //
} // func
// ----------------------------------------------------------------
//

  
void showMenu() {
  //background(255, 204, 0);
  fill(0);
  textSize(32);
  text(" Menu Option ", 450, 100, 3);
  textSize(14);
  text("Press 1 See chart Altitude ", 100, 200);
  text("Press 2 See football statistics ", 100, 220);
  //
  text("Press x to quit ", 100, 260);
  //
} // func


void showGraphs()
{

   makePanel(10,400,"Alititude",600,300,0);
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
  case stateSeeFootballStatistics:
    keyPressedForStateSeeFootballStatistics();
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