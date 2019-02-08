class Button{ // ESSA CLASSE CONTÉM AS FUNÇÕES DE DESENHO DE TODOS OS BOTÕES DO PROGRAMA
  // INICIALIZA AS VARIÁVEIS QUE SERÃO UTILIZADAS
  String label;
  int x;
  int y;
  int l;
  int c;
  int roundA;
  
  // CONSTRUTOR, ATRIBUI VALOR AS VARIÁVEIS QUE SERÃO UTILIZADAS
  Button(String labelA, int xpos, int ypos, int larg, int comp, int roundB){
    label = labelA;
    x = xpos;
    y = ypos;
    l = larg;
    c = comp;
    roundA = roundB;
  }

// FUNÇÃO UTILIZADA PARA DESENHAR OS QUADRADOS
void DrawSquare(int index){
  if (layerStatus == 0){
    if (ly0[index] == 1){
      fill(255);
    }else{
      fill(0);
    }
  }
  else if (layerStatus == 1){
    if (ly1[index] == 1){
      fill(255);
    }else{
      fill(0);
    }
  }
  else if (layerStatus == 2){
    if (ly2[index] == 1){
      fill(255);
    }else{
      fill(0);
    }
  }
  else if (layerStatus == 3){
    if (ly3[index] == 1){
      fill(255);
    }else{
      fill(0);
    }
  }
  else if (layerStatus == 4){
    if (ly4[index] == 1){
      fill(255);
    }else{
      fill(0);
    }
  }
  else if (layerStatus == 5){
    if (ly0[index] == 1 && ly1[index] == 1 && ly2[index] == 1 && ly3[index] == 1 && ly4[index] == 1){
      fill(255);
    }else{
      fill(0);
    }
  }
  strokeWeight(1);
  stroke(255);
  rect(x, y, l ,c, roundA);
  fill(0);
  textSize(26);
  textAlign(CENTER, CENTER);
  text(label, x + (l/2), y + (c/2)-3);
}

// FUNÇÃO UTILIZADA PARA DESENHAR OS BOTÕES DE APAGAR
void Draw(int value){
  fill(value);
  strokeWeight(1);
  stroke(255);
  rect(x, y, l ,c, roundA);
  fill(0);
  textSize(26);
  textAlign(CENTER, CENTER);
  text(label, x + (l/2), y + (c/2)-3);
}

// FUNÇÃO UTILIZADA PARA DESENHAR OS BOTÕES DAS ANIMAÇÕES
void DrawAnimButton(int inside, int border){
  fill(inside);
  strokeWeight(border);
  stroke(0, 0, 204);
  rect(x, y, l, c, roundA);
  fill(0);
  textSize(26);
  textAlign(CENTER, CENTER);
  text(label, x + (l/2), y + (c/2)-3);
  strokeWeight(0);
}

// FUNÇÃO UTILIZADA PARA DESENHAR OS BOTÕES DAS LAYERS
void DrawLayerButton(int inside, int border){
  fill(inside);
  strokeWeight(border);
  stroke(0, 0, 204);
  rect(x, y, l, c, roundA);
  fill(0);
  textSize(26);
  textAlign(CENTER, CENTER);
  text(label, x + (l/2), y + (c/2)-3);
  strokeWeight(0);
}

// FUNÇÃO UTILIZADA PARA VERIFICAR SE O MOUSE ESTÁ EM CIMA DO OBJETO
boolean mouseOver(){
  if((mouseX >= x && mouseX<= x+l) && (mouseY >= y && mouseY <= y+c)){
    return true;
  }else{
    return false;
  }
}
}

// FUNÇÃO CHAMADA PARA MUDAR A COR DOS QUADRADOS
void changeColor(int state, int layerr, int indexLed){
  if(state == 0){
    if (layerr == 0){
      ly0[indexLed] = 0;
    }
    if (layerr == 1){
      ly1[indexLed] = 0;
    }
    if (layerr == 2){
      ly2[indexLed] = 0;
    }
    if (layerr == 3){
      ly3[indexLed] = 0;
    }
    if (layerr == 4){
      ly4[indexLed] = 0;
    }
    if (layerr == 5){
      ly0[indexLed] = 0;
      ly1[indexLed] = 0;
      ly2[indexLed] = 0;
      ly3[indexLed] = 0;
      ly4[indexLed] = 0;
    }
  }
  else if(state == 1){
    if (layerr == 0){
      ly0[indexLed] = 1;
    }
    if (layerr == 1){
      ly1[indexLed] = 1;
    }
    if (layerr == 2){
      ly2[indexLed] = 1;
    }
    if (layerr == 3){
      ly3[indexLed] = 1;
    }
    if (layerr == 4){
      ly4[indexLed] = 1;
    }
    if (layerr == 5){
      ly0[indexLed] = 1;
      ly1[indexLed] = 1;
      ly2[indexLed] = 1;
      ly3[indexLed] = 1;
      ly4[indexLed] = 1;
    }
  }
}
