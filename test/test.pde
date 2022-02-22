final int WIDTH =1000;
final int HEIGHT=1000;

//テトリス画面左上座標
int TETRIS_X;
int TETRIS_Y;
//ボード幅
int BOARD_WIDTH;
int BOARD_HEIGHT;
//ブロック幅
int BLOCK_WIDTH;
int BLOCK_HEIGHT;
//ブロック数
int WIDTH_BLOCKS=10;
int HEIGHT_BLOCKS=20;

int score=0;

//メイン画面
boolean board[][]      = new boolean[WIDTH_BLOCKS][HEIGHT_BLOCKS]; //board[x][y]
int     boardColor[][] = new int[WIDTH_BLOCKS][HEIGHT_BLOCKS];

int nextType;
boolean nextBlock[][] = new boolean[4][4];

//落下ミノ
int minoX;
int minoY;
int minoType;
int minoAngle;
boolean downMino[][]=new boolean[WIDTH_BLOCKS][HEIGHT_BLOCKS];

int downSpeed; //ms
PImage img;
void setup() {
  surface.setResizable(true);
  surface.setSize(WIDTH, HEIGHT);
  frameRate(10000);
  makeNewMino(nextBlock);
}


int holdTime;
int lastWidth, lastHeight;
void draw() {
  background(230, 250, 250);
  windowUpdate();

  drawBlocks(TETRIS_X, TETRIS_Y);
  drawNextBlocks(TETRIS_X+BLOCK_WIDTH*(WIDTH_BLOCKS+3), TETRIS_Y);
  drawScore(TETRIS_X+BLOCK_WIDTH*(WIDTH_BLOCKS+3), TETRIS_Y+BLOCK_HEIGHT*6, BLOCK_HEIGHT*14, score);

  getMinoArray(minoType, downMino);
  //println(canMove(minoType, 1, 0, 0, 0));


  int time=millis();
  if (time-holdTime>downSpeed) {
    holdTime=downSpeed;
  }
  //println(frameRate);
}


void getMinoArray(int minoType, boolean array[][]) { //相対座標をもとに配列に変換
  for (int i=0; i<4; i++) {
    int x=minoTable[minoType][i][0];
    int y=minoTable[minoType][i][1];
    array[x+1][y+1]=true;
  }
}

int minoIndex;
int randomMinos[]={0, 1, 2, 3, 4, 5, 6, 7};
void makeNewMino(boolean array[][]) {
  //シャッフル
  if (minoIndex==0) {
    for (int i=0; i<7; i++) {
      int randomIndex=(int)random(6);
      int memory=randomMinos[i];
      randomMinos[i]=randomMinos[randomIndex];
      randomMinos[randomIndex]=memory;
    }
  }
  nextType=randomMinos[minoIndex];
  getMinoArray(nextType, array);
  changeMinoAngle(nextType, (int)random(3), array);
  minoX=0;
  minoY=WIDTH_BLOCKS/2;
  minoIndex++;
  minoIndex%=7;
  println(minoType);
}

//board配列結合
void mergeArray(int minoType, boolean array[][]) {
  for (int i=0; i<4; i++)
    for (int j=0; j<4; j++) {
      if (array[i][j]==true) {
        if (i+minoX<0 || i+minoX>=WIDTH_BLOCKS)continue;
        if (j+minoY<0 || i+minoY>=HEIGHT_BLOCKS)continue;
        board[minoX+i][minoY+j]=true;
        boardColor[minoX+i][minoY+j]=minoType+1;
      }
    }
}

//指定座標方向に動かせるか
boolean canMove(int minoType, int x, int y, int nowAngle, int angle) {
  int singleBlockCount = 0;

  if (angle!=0)changeMinoAngle(minoType, nowAngle+angle, downMino); //仮回転
  for (int i=0; i<4; i++)
    for (int j=0; j<4; j++) {
      if (minoX+x+i<0 || minoX+x+i>=WIDTH_BLOCKS)continue;
      if (minoY+y+j<0 || minoY+y+j>=HEIGHT_BLOCKS)continue;
      if (x+i<0 || x+i>=4)continue;
      if (y+j<0 || y+j>=4)continue;
      if (board[minoX+x+i][minoY+y+j]==false && downMino[i][j]==true)
        singleBlockCount++;
    }
  if (angle!=0)changeMinoAngle(minoType, nowAngle, downMino); //戻す

  if (singleBlockCount==4)return true; //全ブロックが満条件
  return false;
}
