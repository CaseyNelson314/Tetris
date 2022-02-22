
//置換回転
void changeMinoAngle(int minoType, int angle, boolean array[][]) {
  angle%=4;
  boolean memory[][]=new boolean[4][4];
  if (minoType==0)return;
  int arrayIndex;
  if (minoType==1)arrayIndex=3;
  else            arrayIndex=2;

  for (int i=0; i<=arrayIndex; i++)
    for (int j=0; j<=arrayIndex; j++) {
      if      (angle==0) memory[i][j]=array[     i      ][     j      ];
      else if (angle==1) memory[i][j]=array[     j      ][arrayIndex-i];
      else if (angle==2) memory[i][j]=array[arrayIndex-i][arrayIndex-j];
      else if (angle==3) memory[i][j]=array[arrayIndex-j][     i      ];
    }
  for (int i=0; i<4; i++)
    for (int j=0; j<4; j++)
      array[i][j]=memory[i][j];
}


//ウィンドウサイズ調整
void windowUpdate() {
  int windowSize;
  if (width>height)windowSize=height;
  else             windowSize=width;
  TETRIS_X=width/2-(int)(BLOCK_WIDTH*8.5);
  TETRIS_Y=height/2-BLOCK_HEIGHT*10;
  BOARD_WIDTH =(int)(windowSize*0.4);
  BOARD_HEIGHT=(int)(windowSize*0.8);
  BLOCK_WIDTH =(int)(BOARD_WIDTH*0.1); //x
  BLOCK_HEIGHT=(int)(BOARD_HEIGHT*0.05); //y
}


void keyPressed() {
  if (keyCode=='Q'||keyCode=='q')if (canMove(minoType, 0, 0, minoAngle, -1))minoAngle--;
  if (keyCode=='E'||keyCode=='e')if (canMove(minoType, 0, 0, minoAngle, 1))minoAngle++;
  if (keyCode=='A'||keyCode=='a')if (canMove(minoType, -1, 0, minoAngle, 0))minoX--;
  if (keyCode=='D'||keyCode=='d')if (canMove(minoType, 1, 0, minoAngle, -1))minoX++;
  if (keyCode=='S'||keyCode=='s')minoY++;
  //if (keyCode=='r')makeNewMino();
  minoAngle%=4;
  //if (minoAngle<0)minoAngle=3;
  //if (minoX<0)minoX=0;
  //if (minoX>WIDTH_BLOCKS-1 )minoX=WIDTH_BLOCKS-1;
  //if (minoY>HEIGHT_BLOCKS-1)minoY=HEIGHT_BLOCKS-1;
}