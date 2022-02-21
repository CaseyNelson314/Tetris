final int WIDTH =1500;
final int HEIGHT=1500;

int TETRIS_X;
int TETRIS_Y;

int BOARD_WIDTH;
int BOARD_HEIGHT;

int BLOCK_WIDTH; //x
int BLOCK_HEIGHT; //y

int WIDTH_BLOCKS=10;
int HEIGHT_BLOCKS=20;

final int COLOR_NUM=7;
final color[] colorTable={
  #555555, //no block
  #99ff99,
  #99ccff,
  #cc99ff,
  #ff9999,
  #FCD7A1,
  #E7D5E8,
  #AE7A26
};

int board[][] = new int[WIDTH_BLOCKS][HEIGHT_BLOCKS]; //board[x][y]
int nextBlock[][] = new int[4][4];
int minoAngle;

//落下してるミノの座標
int minoX;
int minoY;
boolean downMino[][]=new boolean[4][4];

void setup() {
  surface.setResizable(true);
  surface.setSize(WIDTH, HEIGHT);
  frameRate(1000);
}
void draw() {
  windowUpdate();
  background(230, 250, 250);
  drawBlocks(TETRIS_X, TETRIS_Y);
  drawNextBlocks(TETRIS_X+BLOCK_WIDTH*(WIDTH_BLOCKS+3), TETRIS_Y);
  drawScore(TETRIS_X+BLOCK_WIDTH*(WIDTH_BLOCKS+3), TETRIS_Y+BLOCK_HEIGHT*6, BLOCK_HEIGHT*14, 100);
  boolean array[][]=new boolean[4][4];
  int minoType=4;
  println(frameRate);
  int angle=minoAngle;
  getMinoArray(minoType, array);
  changeMinoAngle(minoType, angle, array);
  for (int i=0; i<4; i++)
    for (int j=0; j<4; j++) {
      if (array[i][j]==true)
        board[i][j]=6;
      else
        board[i][j]=0;
    }
}

void keyPressed() {
  if (keyCode=='Q'||keyCode=='q')minoAngle--;
  if (keyCode=='E'||keyCode=='e')minoAngle++;
  if (keyCode=='A'||keyCode=='a')minoX--;
  if (keyCode=='D'||keyCode=='d')minoX++;
  if (keyCode=='S'||keyCode=='s')minoY+=2;
  if (keyCode=='r')makeNewMino();
  minoAngle%=4;
  if (minoAngle<0)minoAngle=3;
  if (minoX<0)minoX=0;
  if (minoX>WIDTH_BLOCKS-1 )minoX=WIDTH_BLOCKS-1;
  if (minoY>HEIGHT_BLOCKS-1)minoY=HEIGHT_BLOCKS-1;
}

void changeMinoAngle(int minoType, int angle, boolean array[][]) {//通常回転
  boolean memory[][]=new boolean[4][4];
  if (minoType==0)return;
  //I型□型の処理を分ける
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

void getMinoArray(int minoType, boolean array[][]) {//相対座標をもとに配列に変換
  for (int i=0; i<4; i++) {
    int x=minoTable[minoType][i][0];
    int y=minoTable[minoType][i][1];
    array[x+1][y+1]=true;
  }
}

void makeNewMino() {
  int minoType=(int)random(6);
  getMinoArray(minoType, downMino);
  changeMinoAngle(minoType,(int)random(3),downMino);
  minoX=0;
  minoY=WIDTH_BLOCKS/2;
}

void windowUpdate() {
  int windowSize;
  if (width>height)windowSize=height;
  else             windowSize=width;
  TETRIS_X=width/2-BLOCK_WIDTH*9;
  TETRIS_Y=height/2-BLOCK_HEIGHT*10;
  BOARD_WIDTH =(int)(float)(windowSize*0.4);
  BOARD_HEIGHT=(int)(float)(windowSize*0.8);
  BLOCK_WIDTH =(int)(float)(BOARD_WIDTH*0.1); //x
  BLOCK_HEIGHT=(int)(float)(BOARD_HEIGHT*0.05); //y
}
