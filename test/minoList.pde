final int[][][] minoTable={ //各ブロック相対座標
  
  { //I
    { 0, -1}, 
    { 0,  0}, 
    { 0,  1}, 
    { 0,  2}, 
  },
  
  { //□
    { 0,  0}, { 1,  0}, 
    { 0,  1}, { 1,  1}, 
  },
  
  { //L
    { 0, -1}, 
    { 0,  0}, 
    { 0,  1}, { 1,  1}, 
  },
  
  { //逆L
              { 0, -1}, 
              { 0,  0}, 
    {-1,  1}, { 0,  1}, 
  },
  
  { //Z
    {-1, -1}, { 0, -1}, 
              { 0,  0}, { 1,  0}, 
  },
  
  { //逆Z
              { 0, -1}, { 1, -1}, 
    {-1,  0}, { 0,  0}, 
  },
  
  { //T
              { 0, -1}, 
    {-1,  0}, { 0,  0}, { 1,  0}, 
  },  
};