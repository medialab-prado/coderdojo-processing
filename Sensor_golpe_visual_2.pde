import ddf.minim.*;
import processing.serial.*; 
import deadpixel.keystone.*;

float sensor0, sensor1, sensor2=100;
boolean lop = true;
byte[] lastInBuffer;


float intense = 300;
float dis = random(40, intense);
float dis2 = random(intense/20, intense/4);


/**** variables ofscreen2 ****/
float x=200;
float lado=0;
float tamano=10;
float tamano2=0;

/****variables offscreen3 ***/
float largo_s2, ancho_s2, alto_s2, tinte_s2, brillo_s2;
float menos_s2 = 0.99;

/** variables offscren 4**/
ArrayList <fuego> autobus;

float rX, rY;

float H, S, B;

fuego f;

Keystone ks;
CornerPinSurface surface;
CornerPinSurface surface2;
CornerPinSurface surface3;
CornerPinSurface surface4;
PGraphics offscreen;
PGraphics offscreen2;
PGraphics offscreen3;
PGraphics offscreen4;

Serial myPort;

Minim minim;
AudioSample bombo;
AudioSample caja;
AudioSample golpe;
AudioSample tambor;
AudioSample platillo;
AudioSample palmas;
AudioSample pitido;
void setup() {
  // Keystone will only work with P3D or OPENGL renderers, 
  // since it relies on texture mapping to deform
  size(1024, 768, P3D);

  ks = new Keystone(this);
  surface = ks.createCornerPinSurface(400, 300, 20);
  surface2 = ks.createCornerPinSurface(400, 300, 20);
  surface3 = ks.createCornerPinSurface(400, 300, 20);
  surface4 = ks.createCornerPinSurface(400, 300, 20);
  // We need an offscreen buffer to draw the surface we
  // want projected
  // note that we're matching the resolution of the
  // CornerPinSurface.
  // (The offscreen buffer can be P2D or P3D)
  offscreen = createGraphics(400, 300, P3D);
  offscreen2 = createGraphics(400, 300, P2D);
  offscreen3 = createGraphics(400, 300, P3D);
  offscreen4 = createGraphics(400, 300, P3D);
  //noLoop();

  frameRate(60);


  println(Serial.list());

  myPort = new Serial(this, Serial.list()[5], 57600);
  myPort.clear();

  // we pass this to Minim so that it can load files from the data directory
  minim = new Minim(this);

  // Carga el fichero del bombo  
  bombo = minim.loadSample( "cat.wav", 512 );
  if ( bombo == null ) println("No hay bombo!");

  // Carga el fichero de la caja
  caja  = minim.loadSample( "dog.wav", 512 );
  if ( caja == null ) println("No hay caja!");

  golpe = minim.loadSample( "caja.wav", 512 );
  if ( golpe == null ) println("No hay golpe!");

  tambor = minim.loadSample( "tambor.wav", 512 );
  if ( tambor == null ) println("No hay golpe!");

  platillo = minim.loadSample( "platillo.wav", 512 );
  if ( platillo == null ) println("No hay golpe!");

  palmas = minim.loadSample( "palmas.wav", 512 );
  if ( palmas == null ) println("No hay golpe!");
  
   pitido = minim.loadSample( "pitido.WAV", 512 );
  if ( pitido == null ) println("No hay golpe!");

  lastInBuffer = new byte[16];


  //init offscren 4

  autobus = new ArrayList();

  f = new fuego();

  autobus.add(f);

  rX = random(150, 400);
  rY = random(150, 400);

  H = random(360);
  S = 50;
  B = 50;
}

void fuegosArtificiales() {

  /*** sensor 0. Caja 0 ***/
  offscreen.beginDraw();
  offscreen.background(0);
  offscreen.translate(offscreen.width/2, offscreen.height/2);
  offscreen.noFill();
  offscreen.stroke(0, 100, 255);
  //ellipse(0, 0, 100, 100);

  for (int i=0; i<100; i++) {
    offscreen.rotate(random(0.3, 0.6));
    float posicion = random(50, sensor0);
    offscreen.stroke(0, 100, 255);
    offscreen.line(15, 0, posicion, 0);
    offscreen.pushMatrix();

    offscreen.translate(posicion, 0);

    for (int j=0; j<25; j++) {
      offscreen.rotate(random(0.3, 0.6));
      float posicion1 = random(10, sensor0/10);
      offscreen.stroke(0, 200, 255);
      offscreen.line(0, 0, posicion1, 0);
    }
    offscreen.popMatrix();
  }

  sensor0 = sensor0 * 0.980;
  offscreen.endDraw();
}

void bolasRojas() {
  PVector surfaceMouse2 = surface2.getTransformedMouse(); //Draw the scene, offscreen
  offscreen2.beginDraw();
  // pegar codigo de caja 1
  offscreen2.translate(offscreen2.width/2*(1-tamano2), height/2*(1-tamano2));
  offscreen2. background(0, 0, 0);
  offscreen2.pushMatrix();
  for (int i=0; i<lado; i++)
  {

    offscreen2.translate(offscreen2.width*tamano2, 0);
    offscreen2.rotate(PI/2);
  }
  offscreen2.fill(255, 0, 0);


  offscreen2.ellipse(x*tamano2, 5, tamano, tamano);

  offscreen2.popMatrix();
  offscreen2.pushMatrix();

  for (int i=0; i<lado+1; i++)
  {

    offscreen2.translate(offscreen2.width*tamano2, 0);
    offscreen2.rotate(PI/2);
  }
  offscreen2.fill(255, 0, 0);
  offscreen2.ellipse(x*tamano2, 5, tamano, tamano);
  offscreen2.popMatrix();
  offscreen2.pushMatrix();
  for (int i=0; i<lado+2; i++)
  {

    offscreen2.translate(offscreen2.width*tamano2, 0);
    offscreen2.rotate(PI/2);
  }
  offscreen2.fill(255, 0, 0);
  offscreen2. ellipse(x*tamano2, 5, tamano, tamano);
  offscreen2. popMatrix();
  offscreen2. pushMatrix();
  for (int i=0; i<lado+3; i++)
  {

    offscreen2. translate(offscreen2.width*tamano2, 0);
    offscreen2. rotate(PI/2);
  }
  offscreen2.fill(255, 0, 0);
  offscreen2.ellipse(tamano2*x, 5, tamano, tamano);
  offscreen2. popMatrix();
  x=x+1;
  if (tamano2<1) {
    tamano2=tamano2+0.01;
  }

  if (tamano>10) {
    tamano=tamano-1;
  }

  if (x==width-6)
  {
    lado=lado+1;  

    x=5;
  } 



  offscreen2.endDraw();
}

void cuadrosBailongos() {


  ////  pantalla 3
  offscreen3.beginDraw();
  offscreen3.background(0); 
  // offscreen2.
  colorMode(HSB, 360, 100, 100);
  offscreen3.fill (tinte_s2, 80, brillo_s2);
  offscreen3.noStroke();
  offscreen3.rect (0, 0, ancho_s2, alto_s2);
  offscreen3.rect(0, 300-12, ancho_s2, 12);

  offscreen3.rect(400-ancho_s2, 300-alto_s2, ancho_s2, alto_s2);
  offscreen3.rect (400-12, 0, 12, alto_s2);


  //Hace el ancho más pequeño
  ancho_s2 = ancho_s2 * menos_s2;
  alto_s2 = alto_s2 * menos_s2;
  // Menos brillo
  brillo_s2 = brillo_s2 * menos_s2;
  //offscreen2.
  colorMode(RGB, 255, 255, 255);

  offscreen3.endDraw();
}

void circulosdeviaje() {

  PVector surfaceMouse2 = surface2.getTransformedMouse();

  offscreen4.beginDraw();
  offscreen4. colorMode(HSB, 360, 100, 100);

  offscreen4.fill(H, S, B, 20);
  offscreen4.noStroke();
  offscreen4.rect(0, 0, offscreen4.width, offscreen4.height);

  ArrayList toDelete = new ArrayList();

  for (int n = 0; n<autobus.size (); n++) {
    fuego fff = autobus.get(n);

    fff.draw();

    if (fff.X > offscreen4.width*1.5) {
      toDelete.add(fff);
    }
  }
  offscreen4.endDraw();
  autobus.removeAll(toDelete);
}



void draw() {

  PVector surfaceMouse = surface.getTransformedMouse();


  fuegosArtificiales();
  bolasRojas();
  cuadrosBailongos();
  circulosdeviaje();


  /******************** ventana 2 *******/


  background(0);

  // render the scene, transformed using the corner pin surface

  surface.render(offscreen);
  surface2.render(offscreen2, 0, 0, 400, 300);
  surface3.render(offscreen3, 0, 0, 400, 300);
  surface4.render(offscreen4, 0, 0, 400, 300);


  if (myPort != null && myPort.available() != 0) {
    // Lo coge para la coordenada Y
    // int valorAccel = myPort.readChar();
    int cf = 0;
    // Expand array size to the number of bytes you expect:
    byte[] inBuffer = new byte[16];

    myPort.readBytesUntil(cf, inBuffer);
    myPort.clear();

    //println(inBuffer[3]);

    if ( inBuffer[0] - lastInBuffer[0] > 10) {
      tambor.trigger();
      sensor0 += inBuffer[0];
      println("Sensor 0 " + inBuffer[0]);
    }
    lastInBuffer[0] = inBuffer[0];

    if ( inBuffer[1] - lastInBuffer[1] > 10) {
      platillo.trigger();
      sensor1 += inBuffer[1];
      println("Sensor 1 " + inBuffer[1]);
      tamano=200;
      tamano2=0;
    }
    lastInBuffer[1] = inBuffer[1];

    if ( inBuffer[2] - lastInBuffer[2] > 10) {
      palmas.trigger();
      sensor2+=inBuffer[2];
      largo_s2 = 350;

      ancho_s2 = random (400);
      alto_s2 = random (300);
      tinte_s2 = random (360);
      brillo_s2 = 100;
      println("Sensor 2 " + inBuffer[2]);
    }
    lastInBuffer[2] = inBuffer[2];

    if ( inBuffer[3] -  lastInBuffer[3] > 3) {
      pitido.trigger();
      println("Sensor 3 " + inBuffer[3]);
      for (int i = 0;i<8;i++) {
        fuego tal = new fuego();
        autobus.add(tal);

        rX = random(0, width);
        rY = random(0, height);

        H = random(360);
      } 
    }
    lastInBuffer[3] = inBuffer[3];
    
    if ( inBuffer[4] > 10) {
    }
  }
}

void keyPressed() {
  switch(key) {
  case 'c':
    // enter/leave calibration mode, where surfaces can be warped 
    // and moved
    ks.toggleCalibration();
    break;

  case 'l':
    // loads the saved layout
    ks.load();
    break;

  case 's':
    // saves the layout
    ks.save();
    break;

  case ' ':
    // saves the layout
    sensor0 = 350;
    //otro
    tamano2=0;
    //otro
    largo_s2 = 350;

    ancho_s2 = random (400);
    alto_s2 = random (300);
    tinte_s2 = random (360);
    brillo_s2 = 100;


    for (int i = 0;i<8;i++) {
      fuego tal = new fuego();
      autobus.add(tal);

      rX = random(0, width);
      rY = random(0, height);

      H = random(360);
    }

    break;
  }
}

class fuego {

  float X, Y;

  float vX, vY;

  float aX, aY;

  float g;

  float c1, c2, c3;

  fuego() {
    X = random(offscreen4.width);
    Y = random(offscreen4.height);

    vX = 0;
    vY = 0;

    aX = random(-0.25, 0.25);
    aY = random(-0.25, 0.25);

    g = 0;

    c1 = random(0, 255);
    c2 = random(0, 255);
    c3 = random(0, 255);
  }

  void draw() {
    offscreen4.colorMode(RGB, 255, 255, 255);

    offscreen4.fill(c1, c2, c3);
    offscreen4.noStroke();
    offscreen4.ellipse(X, Y, g, g);

    X += vX;
    Y += vY;

    vX += aX;
    vY += aY;

    g += vX + vY / 2 * 2.5;

    if (vX + vY / 2 > 0) {
      c1 += vX + vY / 2;
    } 
    else {
      c1 += -vX + -vY / 2;
    }
    if (vX + vY / 2 > 0) {
      c2 += vX + vY / 2;
    } 
    else {
      c2 += -vX + -vY / 2;
    }
    if (vX + vY / 2 > 0) {
      c3 += vX + vY / 2;
    } 
    else {
      c3 += -vX + -vY / 2;
    }
  }
}

