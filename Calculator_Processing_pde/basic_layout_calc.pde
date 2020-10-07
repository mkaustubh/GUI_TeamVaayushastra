void setup() {
  //size(1000,1080);
  fullScreen();
  background(0);
  noStroke();
  fill(30);
  rect(0, 0, 1000, 1080);
  fill(#BEC6F5);
  rect(50, 50, 825, 200, 20);
  /////////////////11111111111////////////////
  fill(100);
  rect(50, 300, 150, 150);
  fill(255);
  textSize(150);
  text("7", 80, 430);

  fill(100);
  rect(220, 300, 150, 150);
  fill(255);
  textSize(150);
  text("8", 250, 430);

  fill(100);
  rect(390, 300, 150, 150);
  fill(255);
  textSize(150);
  text("9", 420, 430);

  fill(100);
  rect(560, 300, 150, 150);
  fill(255);
  textSize(150);
  text("/", 590, 420);

  fill(100);
  rect(730, 300, 150, 150);
  fill(255);
  textSize(150);
  text("-", 760, 425);
  ////////////////2222222222/////////////////////
  fill(100);
  rect(50, 470, 150, 150);
  fill(255);
  textSize(150);
  text("4", 80, 600);

  fill(100);
  rect(220, 470, 150, 150);
  fill(255);
  textSize(150);
  text("5", 250, 600);

  fill(100);
  rect(390, 470, 150, 150);
  fill(255);
  textSize(150);
  text("6", 420, 600);

  fill(100);
  rect(560, 470, 150, 150);
  fill(255);
  textSize(150);
  text("*", 595, 620);

  fill(100);
  rect(730, 470, 150, 150);
  fill(255);
  textSize(150);
  text("+", 750, 600);
  ////////////3333333333//////////////
  fill(100);
  rect(50, 640, 150, 150);
  fill(255);
  textSize(150);
  text("1", 80, 770);

  fill(100);
  rect(220, 640, 150, 150);
  fill(255);
  textSize(150);
  text("2", 250, 770);

  fill(100);
  rect(390, 640, 150, 150);
  fill(255);
  textSize(150);
  text("3", 420, 770);

  fill(100);
  rect(560, 640, 320, 150);
  fill(255);
  textSize(150);
  text("AC", 625, 770);
  /////////444444444444////////////
  fill(100);
  rect(50, 810, 320, 150);
  fill(255);
  textSize(150);
  text("0", 180, 940);

  fill(100);
  rect(390, 810, 150, 150);
  fill(255);
  textSize(150);
  text(".", 430, 940);

  fill(100);
  rect(560, 810, 320, 150);
  fill(255);
  textSize(150);
  text("=", 660, 930);
}
String press="", operator="", operator1="", input="";
float input1=0, input2=0;
int operator2=0;
float result=0;
boolean ac=false;
void draw() {
  textSize(100);
  if (!ac) {
    if (operator=="" && press!="") {
      fill(0);
      text(press, 100, 185);
      //println(press.length());
    } else if (operator1=="=") {
      switch(operator2) {
      case 1:
        result=input1/(input2*1.0);
        break;
      case 2:
        result=input1*input2;
        break;
      case 3:
        result=input1-input2;
        break;
      case 4:
        result=input1+input2;
        break;
      }
      fill(#BEC6F5);
      rect(50, 50, 825, 200, 20);
      fill(0);
      println(input1+" "+input2+" "+operator+" "+operator1+" "+operator2+" "+result);
      text(input+operator+input2+operator1+result, 100, 185);
    } else if (operator!="") {
      fill(0);
      text(input+operator+press, 100, 185);
    }
  } else {
    fill(#BEC6F5);
    rect(50, 50, 825, 200, 20);
    fill(0);
    text(press, 100, 185);
  }

  //text();
}
void mousePressed() {
  if (press.length()<5) {
    if (mouseX>50 && mouseX<200 && mouseY>300 && mouseY<450) {
      ac=false;
      press+="7";
      //fill(#BEC6F5);
      //rect(50, 50, 825, 200, 20);
    } else if (mouseX>50 && mouseX<200 && mouseY>470 && mouseY<620) {
      press+="4";
      ac=false;
    } else if (mouseX>50 && mouseX<200 && mouseY>640 && mouseY<790) {
      press+="1";
      ac=false;
    } 
    /////////////////
    else if (mouseX>220 && mouseX<370 && mouseY>300 && mouseY<450) {
      press+="8";
      ac=false;
    } else if (mouseX>220 && mouseX<370 && mouseY>470 && mouseY<620) {
      press+="5";
      ac=false;
    } else if (mouseX>220 && mouseX<370 && mouseY>640 && mouseY<790) {
      press+="2";
      ac=false;
    }
    ////////////////
    else if (mouseX>390 && mouseX<540 && mouseY>300 && mouseY<450) {
      press+="9";
      ac=false;
    } else if (mouseX>390 && mouseX<540 && mouseY>470 && mouseY<620) {
      press+="6";
      ac=false;
    } else if (mouseX>390 && mouseX<540 && mouseY>640 && mouseY<790) {
      press+="3";
      ac=false;
    } else if (mouseX>390 && mouseX<540 && mouseY>810 && mouseY<960) {
      press+=".";
      ac=false;
    }
    ////////////////
    else if (mouseX>50 && mouseX<370 && mouseY>810 && mouseY<960) {
      press+="0";
      ac=false;
    }
    //////////////////
    else if (mouseX>560 && mouseX<710 && mouseY>300 && mouseY<450) {
      operator="/";
      operator2=1;
      operator1="";
      input1=parseFloat(press);
      input=input1+"";
      press="";
      ac=false;
    } else if (mouseX>560 && mouseX<710 && mouseY>470 && mouseY<620) {
      operator="*";
      operator2=2;
      operator1="";
      input1=parseFloat(press);
      input=input1+"";
      press="";
      ac=false;
    } else if (mouseX>730 && mouseX<880 && mouseY>300 && mouseY<450) {
      operator="-";
      operator2=3;
      operator1="";
      input1=parseFloat(press);
      input=input1+"";
      press="";
      ac=false;
    } else if (mouseX>730 && mouseX<880 && mouseY>470 && mouseY<620) {
      operator="+";
      operator2=4;
      operator1="";
      input1=parseFloat(press);
      input=input1+"";
      press="";
      ac=false;
    }///////////////////////
    else if (mouseX>560 && mouseX<880 && mouseY>640 && mouseY<790) {/*///////////AC.....*/
      operator="";
      operator1="";
      press="";
      input="";
      input1=0;
      input2=0;
      ac=true;
      //inputl;
    } else if (mouseX>560 && mouseX<880 && mouseY>810 && mouseY<960) {
      operator1="=";
      //println(press);
      input2=parseFloat(press);
      ac=false;
    }
  }
}
