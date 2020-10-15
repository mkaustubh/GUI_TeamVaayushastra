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



UnfoldingMap map, map1;

Location berlinLocation;
SimplePointMarker berlinMarker;
ScreenPosition  berlinPos;

void setup() {
  size(800, 800, P2D);
  //fullScreen();
  map = new UnfoldingMap(this);
  //MapUtils.createDefaultEventDispatcher(this, map);//Comment this while adding overlayed map

  //Adding overlayed map ,map1);
  map1 = new UnfoldingMap(this, new Microsoft.AerialProvider());
  MapUtils.createDefaultEventDispatcher(this, map, map1);
}
float x=19.3896405;
float y=72.8160973;

void draw() {
  map.draw();

  //To add two overlayed maps detail+terrain;
  tint(255, 50);
  map1.draw();

  //To add default marker
  //berlinMarker = new SimplePointMarker(berlinLocation);
  //berlinMarker.setColor(color(67, 211, 227, 100));
  //berlinMarker.setStrokeColor(color(255, 0, 0));
  //berlinMarker.setStrokeWeight(4);
  //map.addMarkers(berlinMarker);

  //To pass Geo-Location
  berlinLocation = new Location(x, y );
  //To add a marker
  berlinMarker = new SimplePointMarker(berlinLocation);
  //To get x and y values according to screen
  berlinPos = berlinMarker.getScreenPosition(map);

  //To add a customized marker
  strokeWeight(16);
  stroke(67, 211, 227, 100);
  noFill();
  ellipse(berlinPos.x, berlinPos.y, 36, 36);
}
void keyPressed() {
  if (key=='w' || key=='W') {
    x=x+.1;
  } else if (key=='a' || key=='A') {
    y=y-.1;
  } else if (key=='S' || key=='s') {
    x=x-.1;
  }else if (key=='D' || key=='d') {
    y=y+.1;
  }
}
