final int WIDTH =850;
final int HEIGHT=700;

final int BOARD_WIDTH =400;
final int BOARD_HEIGHT=600;

final int BLOCK_WIDTH =40; //x
final int BLOCK_HEIGHT=40; //y

final int WIDTH_BLOCKS =BOARD_WIDTH /BLOCK_WIDTH;
final int HEIGHT_BLOCKS=BOARD_HEIGHT/BLOCK_HEIGHT;

final int COLOR_NUM=7;
final int[] colorTable={
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

void setup() {
  surface.setSize(WIDTH, HEIGHT);

  board[0][0]=1;
  nextBlock[0][0]=1;
}
void draw() {
  background(230, 250, 250);
  drawBlocks(100, 50);
  drawNextBlock(600, 50);
  drawScore(600, 260, 390, 100);
}

int ax, ay;
void keyPressed() {
  board[ax][ay]=0;
  if (keyCode=='A'||keyCode=='a')ax--;
  if (keyCode=='W'||keyCode=='w')ay--;
  if (keyCode=='S'||keyCode=='s')ay++;
  if (keyCode=='D'||keyCode=='d')ax++;
  if (ax<0)ax=0;
  if (ay<0)ay=0;
  if (ax>WIDTH_BLOCKS-1 )ax=WIDTH_BLOCKS-1;
  if (ay>HEIGHT_BLOCKS-1)ay=HEIGHT_BLOCKS-1;
  board[ax][ay]=1;
}
