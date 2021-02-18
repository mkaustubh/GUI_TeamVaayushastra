import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.core.*;
import de.fhpotsdam.unfolding.data.*;
import de.fhpotsdam.unfolding.events.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.interactions.*;
import de.fhpotsdam.unfolding.mapdisplay.*;
import de.fhpotsdam.unfolding.mapdisplay.shaders.*;
import de.fhpotsdam.unfolding.marker.*;
import de.fhpotsdam.unfolding.providers.*;
import de.fhpotsdam.unfolding.texture.*;
import de.fhpotsdam.unfolding.tiles.*;
import de.fhpotsdam.unfolding.ui.*;
import de.fhpotsdam.unfolding.utils.*;
import de.fhpotsdam.utils.*;
int kausd=17;
UnfoldingMap map, map1;
Location berlinLocation, cllgLocation;
SimplePointMarker berlinMarker, cllgMarker;
ScreenPosition  berlinPos, cllgPos;
PImage up, down, right, left;
void settings() {

  size(1900, 1000, P3D);
  //fullScreen();
}
void setup() {
  up=loadImage("pUp.png");
  down=loadImage("pDown.png");
  right=loadImage("pRight.png");
  left=loadImage("pLeft.png");
  //fullScreen();
  map = new UnfoldingMap(this, 0, 0, 1900, 1200, new Google.GoogleMapProvider());
  MapUtils.createDefaultEventDispatcher(this, map);//Comment this while adding overlayed map

  //Adding overlayed map ,map1);
  //map1 = new UnfoldingMap(this, new Microsoft.AerialProvider());
  //MapUtils.createDefaultEventDispatcher(this, map, map1);
}
float x=19.3896405;
float y=72.8160973;
float px=x, py=y;
int athu=0;
boolean zoom=true;
void draw() {
  background(255);
  map.draw();
  //To add two overlayed maps detail+terrain;
  //tint(255, 50);
  //map1.draw();

  //To add default marker
  //berlinMarker = new SimplePointMarker(berlinLocation);
  //berlinMarker.setColor(color(67, 211, 227, 100));
  //berlinMarker.setStrokeColor(color(255, 0, 0));
  //berlinMarker.setStrokeWeight(4);
  //map.addMarkers(berlinMarker);

  //To pass Geo-Location
  cllgLocation=new Location(19.049659, 72.821863);
  berlinLocation = new Location(x, y );
  //To add a marker
  cllgMarker=new SimplePointMarker(cllgLocation);
  berlinMarker = new SimplePointMarker(berlinLocation);


  //To get x and y values according to screen
  cllgPos   = cllgMarker.getScreenPosition(map);
  berlinPos = berlinMarker.getScreenPosition(map);
  ///////////////////////ZOOM IN OUT//////////////////
  //if (zoom==true) {
  //  map.zoomAndPanTo(15, berlinLocation);//(Location,zoomlevel);
  //} else if (zoom==false) {
  //  map.setZoomRange(10, 16);
  //  map.panTo(berlinPos);
  //}
  map.zoomAndPanTo(kausd, berlinLocation); 
  //map.setZoomRange(10, 16);
  map.panTo(berlinLocation);
  //map.setTweening(false);

  //To add a customized marker
  strokeWeight(2);
  stroke(67, 211, 227, 100);
  stroke(0, 0, 169);
  noFill();
  ellipse(berlinPos.x, berlinPos.y, 10, 10);
  ///////////////////////////////////////////////
  //stroke(235, 4, 80);
  //fill(245, 71, 195);
  //ellipse(cllgPos.x, cllgPos.y, 20, 20);
  //stroke(235, 4, 80);
  //line(berlinPos.x, berlinPos.y, cllgPos.x, cllgPos.y);
  //////////////////////////////////////////////////////////////////////////////////
  noStroke();
  //fill(0);
  //if (py>berlinPos.y) {
  fill(255, 220, 0);
  if (keyPressed==true)
    keyPressed();
  switch(athu) {
  case 11:
    image(up, berlinPos.x-125, berlinPos.y-125);
    fill(255, 220, 0);    
    triangle(berlinPos.x-10, berlinPos.y, berlinPos.x+10, berlinPos.y, berlinPos.x, berlinPos.y-40);
    break;

  case -11:    
    image(down, berlinPos.x-125, berlinPos.y-125);
    fill(255, 200, 0);
    triangle(berlinPos.x-10, berlinPos.y, berlinPos.x+10, berlinPos.y, berlinPos.x, berlinPos.y+40);
    break;

  case 1:    
    image(right, berlinPos.x-125, berlinPos.y-125);
    fill(255, 0, 0);
    triangle(berlinPos.x, berlinPos.y-10, berlinPos.x+40, berlinPos.y, berlinPos.x, berlinPos.y+10);
    break;

  case -1:    
    image(left, berlinPos.x-125, berlinPos.y-125);
    fill(255, 0, 0);
    triangle(berlinPos.x, berlinPos.y-10, berlinPos.x-40, berlinPos.y, berlinPos.x, berlinPos.y+10);
    break;

  default:
    image(up, berlinPos.x-125, berlinPos.y-125);
    fill(255, 220, 0);    
    triangle(berlinPos.x-10, berlinPos.y, berlinPos.x+10, berlinPos.y, berlinPos.x, berlinPos.y-40);
  }
}
void keyPressed() {
  if (key=='w' || key=='W') {
    x=x+.0001;
    athu=11;
  } else if (key=='d' || key=='D') {
    y=y+.0001;
    athu=1;
  } else if (key=='S' || key=='s') {
    x=x-.0001;
    athu=-11;
  } else if (key=='a' || key=='A') {
    y=y-.0001;
    athu=-1;
  }
}
void mousePressed() {

  if (mousePressed==true) {
    //zoom=!zoom;
    print(zoom);
  }
}
