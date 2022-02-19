
void drawScore(int x, int y, int Height, int score) { //4BLOCK_WIDTH × 390
  fill(200);
  stroke(200);
  strokeWeight(20);
  rect(x, y, BLOCK_WIDTH*4, Height, 2);
  fill(50);
  textSize(50);
  textAlign(CENTER);
  text(score, x+BLOCK_WIDTH*2, y+Height/2);
}

void drawNextBlock(int x, int y) { //4BLOCK_WIDTH × 4BLOCK_HEIGHT
  noFill();
  stroke(200);
  strokeWeight(20);
  rect(x, y, BLOCK_WIDTH*4, BLOCK_HEIGHT*4, 2);
  for (int i=0; i<4; i++) //x
    for (int j=0; j<4; j++) { //y
      strokeWeight(2);
      stroke(colorTable[0]);
      fill(colorTable[nextBlock[i][j]]);
      rect(x+BLOCK_WIDTH*i, y+BLOCK_HEIGHT*j, BLOCK_WIDTH, BLOCK_HEIGHT);
    }
}

void drawBlocks(int x, int y) { //left up
  noFill();
  stroke(200);
  strokeWeight(20);
  rect(x, y, BOARD_WIDTH, BOARD_HEIGHT, 2);
  for (int i=0; i<WIDTH_BLOCKS; i++) //x
    for (int j=0; j<HEIGHT_BLOCKS; j++) { //y
      strokeWeight(2);
      stroke(colorTable[0]);
      fill(colorTable[board[i][j]]);
      rect(x+BLOCK_WIDTH*i, y+BLOCK_HEIGHT*j, BLOCK_WIDTH, BLOCK_HEIGHT);
    }
}
