void drawScore(int x, int y, int Height, int score) { //4BLOCK_WIDTH × 390
  fill(200);
  stroke(200);
  strokeWeight(BLOCK_WIDTH);
  rect(x, y, BLOCK_WIDTH*4, Height);
  fill(50);
  textSize(BLOCK_WIDTH);
  textAlign(CENTER);
  text(score, x+BLOCK_WIDTH*2, y+Height/2);
}

void drawNextBlocks(int x, int y) { //4BLOCK_WIDTH × 4BLOCK_HEIGHT　次のブロック描画
  noFill();
  stroke(200);
  strokeWeight(BLOCK_WIDTH);
  rect(x, y, BLOCK_WIDTH*4, BLOCK_HEIGHT*4);
  for (int i=0; i<4; i++) //x
    for (int j=0; j<4; j++) { //y
      strokeWeight(2);
      stroke(colorTable[0]);
      if (nextBlock[i][j]==true)
        fill(colorTable[nextType]);
      else
        fill(colorTable[0]);
      rect(x+BLOCK_WIDTH*i, y+BLOCK_HEIGHT*j, BLOCK_WIDTH, BLOCK_HEIGHT);
    }
}

void drawBlocks(int x, int y) { //ブロック描画
  noFill();
  stroke(200);
  strokeWeight(BLOCK_WIDTH);
  rect(x, y, BOARD_WIDTH, BOARD_HEIGHT);
  for (int i=0; i<WIDTH_BLOCKS; i++) //x
    for (int j=0; j<HEIGHT_BLOCKS; j++) { //y
      strokeWeight(2);
      stroke(colorTable[0]);
      fill(colorTable[boardColor[i][j]]);
      rect(x+BLOCK_WIDTH*i, y+BLOCK_HEIGHT*j, BLOCK_WIDTH, BLOCK_HEIGHT);
    }
}