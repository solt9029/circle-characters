void setup() {
  size(800, 400);
  background(255);
  noStroke();

  ArrayList<Integer> diameterList = new ArrayList();
  ArrayList<Integer> xList = new ArrayList();
  ArrayList<Integer> yList = new ArrayList();

  PImage normalImage = loadImage("Slide1.png");
  image(normalImage, 0, 0);

  for (int i = 0; i < 1500; i++) {
    int diameter = (int) random(30, 60);
    int x = (int) random(width);
    int y = (int) random(height);
    boolean shouldDraw = true;

    for (int radius = diameter / 2; radius > 0; radius -= 5) {
      for (int degree = 0; degree <  360; degree += 360 / radius / 6) {
        int cx = int(x + radius * cos(radians(degree)));
        int cy = int(y + radius * sin(radians(degree)));
        color c = get(cx, cy);
        if ((int)red(c) == 0) {
          shouldDraw = false;
        }
      }
    }

    if (shouldDraw) {
      diameterList.add(diameter);
      xList.add(x);
      yList.add(y);
    }
  }

  for (int i = 0; i < 600; i++) {
    int diameter = (int) random(80, 120);
    int x = (int) random(width);
    int y = (int) random(height);
    boolean shouldDraw = true;

    for (int radius = diameter / 2; radius > 0; radius -= 5) {
      for (int degree = 0; degree <  360; degree += 360 / radius / 6) {
        int cx = int(x + radius * cos(radians(degree)));
        int cy = int(y + radius * sin(radians(degree)));
        color c = get(cx, cy);
        if ((int)red(c) == 0) {
          shouldDraw = false;
        }
      }
    }

    if (shouldDraw) {
      diameterList.add(diameter);
      xList.add(x);
      yList.add(y);
    }
  }

  PImage boldImage = loadImage("Slide2.png");
  image(boldImage, 0, 0);
  background(0);

  ArrayList<Integer> newDiameterList = new ArrayList();
  ArrayList<Integer> newXList = new ArrayList();
  ArrayList<Integer> newYList = new ArrayList();

  for (int i1 = 0; i1 < xList.size(); i1++) {
    boolean shouldAdd = true;
    for (int i2 = i1 + 1; i2 < xList.size(); i2++) {
      float distance = dist(xList.get(i1), yList.get(i1), xList.get(i2), yList.get(i2));
      if (distance < 20) {
        shouldAdd = false;
      }
    }
    if (shouldAdd) {
      newDiameterList.add(diameterList.get(i1));
      newXList.add(xList.get(i1));
      newYList.add(yList.get(i1));
    }
  }

  for (int i = 0; i < newDiameterList.size(); i++) {
    ellipse(newXList.get(i), newYList.get(i), newDiameterList.get(i), newDiameterList.get(i));
  }
}
