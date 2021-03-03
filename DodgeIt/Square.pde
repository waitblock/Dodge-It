class Square{
  float squareX;
  float squareY;
  float squareWidth = 30;
  float squareHeight = 30;
  float redValue = random(0,255);
  float blueValue = random(0,255);
  float greenValue = random(0,255);
  float squareXVelocity = random(3,4);
  float squareYVelocity = random(3,4);
  
  Square(float x, float y) {
    squareX = x;
    squareY = y;
  }
  
  void update(){
    squareX += squareXVelocity;
    squareY += squareYVelocity;
  }
  
  void bounce(){
    if (squareX > width-squareWidth || squareX < 0) {
      squareXVelocity *= -1 + random(-0.01,0.01);
    }
    if (squareY > height-squareHeight || squareY < 0) {
      squareYVelocity *= -1 + random(-0.01,0.01);
    }
  }
  
  void display(){
    noStroke();
    fill(redValue, blueValue, greenValue);
    rect(squareX, squareY, squareWidth, squareHeight);
  }
}
