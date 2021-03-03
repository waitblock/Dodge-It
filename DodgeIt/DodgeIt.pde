float playerX = 300;
float playerY = 215;

int scene = 0;

boolean wKey = false;
boolean aKey = false;
boolean sKey = false;
boolean dKey = false;
boolean upKey = false;
boolean leftKey = false;
boolean downKey = false;
boolean rightKey = false;
boolean spaceKey = false;

ArrayList<Square> squares = new ArrayList<Square>();

void setup(){
  size(600, 430);
}

void draw(){
  if(scene == 0){
    background(0);
    textAlign(CENTER);
    textSize(30);
    fill(255);
    text("Press the fire key (space) to play.",width/2,height/2);
    if(spaceKey){
      squares.add(new Square(random(0,width-30),random(0,height-30)));
      scene = 1;
    }
  }
  if(scene == 1){
    background(255);
    drawPlayer();
    addSquares();
    updateSquares();
    if(playerCollision()){
      reset();
      scene = 0;
    }
  }
}

void drawPlayer(){
  fill(0);
  noStroke();
  rect(playerX, playerY, 30, 30);
  movePlayer();
}

void movePlayer(){
  if((wKey || upKey) && playerY > 0){
    playerY -= 10;
  }
  if((aKey || leftKey) && playerX > 0){
    playerX -= 10;
  }
  if((sKey || downKey) && playerY < height - 30){
    playerY += 10;
  }
  if((dKey || rightKey) && playerX < width - 30){
    playerX += 10;
  }
}

void addSquares(){
  if(frameCount % 300 == 0){
    squares.add(new Square(random(0,width-30),random(0,height-30)));
  }
}

void updateSquares(){
  for (Square square : squares){
    square.update();
    square.bounce();
    square.display();
  }
}

boolean playerCollision(){
  for (Square square: squares){
    if(square.squareX >= playerX-30 && square.squareX <= playerX+30 && square.squareY >= playerY-30 && square.squareY <= playerY+30){
      return true;
    }
  }
  return false;
}

void reset(){
  frameCount = 0;
  for (int i = squares.size(); i-- != 0; squares.remove(i));
  playerX = 300;
  playerY = 215;
}

void keyPressed(){
  if(key == 'W' || key == 'w'){
    wKey = true;
  }
  if(key == 'A' || key == 'a'){
    aKey = true;
  }
  if(key == 'S' || key == 's'){
    sKey = true;
  }
  if(key == 'D' || key == 'd'){
    dKey = true;
  }
  if(keyCode == UP){
    upKey = true;
  }
  if(keyCode == LEFT){
    leftKey = true;
  }
  if(keyCode == DOWN){
    downKey = true;
  }
  if(keyCode == RIGHT){
    rightKey = true;
  }
  if(key == ' '){
    spaceKey = true;
  }
}

void keyReleased(){
  if(key == 'W' || key == 'w'){
    wKey = false;
  }
  if(key == 'A' || key == 'a'){
    aKey = false;
  }
  if(key == 'S' || key == 's'){
    sKey = false;
  }
  if(key == 'D' || key == 'd'){
    dKey = false;
  }
  if(keyCode == UP){
    upKey = false;
  }
  if(keyCode == LEFT){
    leftKey = false;
  }
  if(keyCode == DOWN){
    downKey = false;
  }
  if(keyCode == RIGHT){
    rightKey = false;
  }
  if(key == ' '){
    spaceKey = false;
  }
}
