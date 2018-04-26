import peasy.PeasyCam;
import processing.video.*;
PGraphics skeletonModel;
PGraphics videoStream;
PGraphics map;
PImage img;
int w = 1280;
int h = 800;
int skeletonModel_w = 640;
int skeletonModel_h = 800;
int videoStream_w = 640;
int videoStream_h = 400;
int map_w = 640;
int map_h = 400;
int margin = 20;
PeasyCam cam;
Movie movie;
PMatrix mat_scene;
void setup() {
  size(1280, 800, P3D);
  mat_scene = getMatrix();
  skeletonModel = createGraphics(skeletonModel_w, skeletonModel_h, P3D);
  videoStream = createGraphics(videoStream_w, videoStream_h, P2D);
  map = createGraphics(map_w, map_h, P2D);
  cam = new PeasyCam(this, skeletonModel, 0);
  //cam = new PeasyCam(this, 0);
  img = loadImage("map.png");
  movie = new Movie(this, "launch2.mp4");
  movie.loop();
}

void draw() {
  background(0);
  
  skeletonModel.beginDraw();
  //skeletonModel.setMatrix(getMatrix());
  skeletonModel.background(255, 204, 0);
  skeletonModel.pushMatrix();
  skeletonModel.translate(0, 0, 0);
  skeletonModel.stroke(255);
  skeletonModel.noFill();
  skeletonModel.sphere(280);
  skeletonModel.popMatrix();
  skeletonModel.endDraw();

  
  videoStream.beginDraw();
  videoStream.image(movie, 0, 0);
  videoStream.endDraw();
  
  map.beginDraw();
  map.image(img, 0, 0, map_w, map_h);
  map.endDraw();
  //setMatrix(mat_scene);
  image(skeletonModel, 0, 0);
  image(videoStream, skeletonModel_w, 0);
  image(map, skeletonModel_w,  videoStream_h);
}

void movieEvent(Movie m) {
  m.read();
}