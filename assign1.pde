

PImage backGround,soil,life,groundHog,soldier,robot;

int soldierX,soldierY;
int lightX,lightY,lightLength,lightOverX;
int robotX,robotY;


void setup() {
	size(640, 480, P2D);
	backGround=loadImage("img/bg.jpg"); //put backGround in
  soil=loadImage("img/soil.png"); //put soil in
  life=loadImage("img/life.png"); //put life in
  groundHog=loadImage("img/groundhog.png"); //put groundHog in
  
  //robot
  robot=loadImage("img/robot.png"); //put robot in
  robotX=floor(random(160,580)); //put robot on random place in each floor 
  robotY=floor(random(2,6))*80; //put robot on random floor

  //soldier
  soldier=loadImage("img/soldier.png"); //put soldier in
  soldierX=0; //start place
  soldierY=floor(random(2,6))*80; //put soldier on random floor
  
  //light
  lightX=robotX+25; //start place
  lightY=robotY+37; //start place
}


void draw() {
  image(backGround,0,0); //set backGround
  image(soil,0,160); //set soil
  //life
  image(life,10,10); //left
  image(life,80,10); //middle
  image(life,150,10); //right
  //grass
  colorMode(RGB);
  fill(124,204,25);
  noStroke();
  rect(0,145,640,15);
  //groundHog
  image(groundHog,275,80); //set groundHog
  //sun
  colorMode(RGB); //big yellow one
  fill(255,255,0); //big yellow one
  ellipse(590,50,130,130); //big yellow one
  colorMode(RGB); //little orange one
  fill(253,184,19); //little orange one
  ellipse(590,50,120,120); //little orange one
  //robot
  image(robot,robotX,robotY); //set robot
  
  //soldier
  image(soldier,soldierX-80,soldierY); //set soldier
  soldierX+=5; //soldier's speed
  soldierX%=720; //how long soldier can walk
  
  //light
  colorMode(RGB); //color
  stroke(255,0,0); //color
  strokeWeight(10); //light's weight
  line(lightX,lightY,lightX+lightLength,lightY); //light's width
  if(lightX>=robotX-160){
    lightX-=2;
    lightLength+=2;
    if(lightLength>=40){
      lightLength=40;
    }
  }else{
    lightX=robotX+25;
    lightLength=0;
  }
}
