import processing.serial.*;

Button sq11, sq12, sq13, sq14, sq15, sq21, sq22, sq23, sq24, sq25, sq31, sq32, sq33, sq34, sq35, sq41, sq42, sq43, sq44, sq45, sq51, sq52, sq53, sq54, sq55;
Button btn_apagarTudo;
Button btn_li;
Button btn_apagar;
Button btn_ly1, btn_ly2, btn_ly3, btn_ly4, btn_ly5, btn_ly6;
Button btn_anim1, btn_anim2, btn_anim3, btn_anim4, btn_anim5;
int border6, border5, border2, border3, border4, border1 = 3;
int borderAnim1, borderAnim2, borderAnim3, borderAnim4, borderAnim5 = 3;
// ARRAYS QUE ARMAZENAM O ESTADO DOS LEDS
int ly0[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
int ly1[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
int ly2[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
int ly3[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
int ly4[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
int comp = 60;
int x_space = 300;
int y_space = 130;
int layerStatus = 0;
String sendData;
PImage logo;
PImage flopLogo;
PImage raslogo;

Serial port;

void setup(){
  size(1024, 768);
  // INICIALIZA A PORTA SERIAL
  port = new Serial(this, "/dev/ttyUSB1", 9600);
  // INICIALIZA OS QUADRADOS DOS LEDS
  sq11 = new Button("", x_space, y_space, comp, comp, 5);
  sq12 = new Button("", x_space+comp+30, y_space, comp, comp, 5);
  sq13 = new Button("", x_space+(comp+30)*2, y_space, comp, comp, 5);
  sq14 = new Button("", x_space+(comp+30)*3, y_space, comp, comp, 5);
  sq15 = new Button("", x_space+(comp+30)*4, y_space, comp, comp, 5);
  sq21 = new Button("", x_space, y_space+comp+30, comp, comp, 5);
  sq22 = new Button("", x_space+comp+30, y_space+comp+30, comp, comp, 5);
  sq23 = new Button("", x_space+(comp+30)*2, y_space+comp+30, comp, comp, 5);
  sq24 = new Button("", x_space+(comp+30)*3, y_space+comp+30, comp, comp, 5);
  sq25 = new Button("", x_space+(comp+30)*4, y_space+comp+30, comp, comp, 5);
  sq31 = new Button("", x_space, y_space+(comp+30)*2, comp, comp, 5);
  sq32 = new Button("", x_space+comp+30, y_space+(comp+30)*2, comp, comp, 5);
  sq33 = new Button("", x_space+(comp+30)*2, y_space+(comp+30)*2, comp, comp, 5);
  sq34 = new Button("", x_space+(comp+30)*3, y_space+(comp+30)*2, comp, comp, 5);
  sq35 = new Button("", x_space+(comp+30)*4, y_space+(comp+30)*2, comp, comp, 5);
  sq41 = new Button("", x_space, y_space+(comp+30)*3, comp, comp, 5);
  sq42 = new Button("", x_space+comp+30, y_space+(comp+30)*3, comp, comp, 5);
  sq43 = new Button("", x_space+(comp+30)*2, y_space+(comp+30)*3, comp, comp, 5);
  sq44 = new Button("", x_space+(comp+30)*3, y_space+(comp+30)*3, comp, comp, 5);
  sq45 = new Button("", x_space+(comp+30)*4, y_space+(comp+30)*3, comp, comp, 5);
  sq51 = new Button("", x_space, y_space+(comp+30)*4, comp, comp, 5);
  sq52 = new Button("", x_space+comp+30, y_space+(comp+30)*4, comp, comp, 5);
  sq53 = new Button("", x_space+(comp+30)*2, y_space+(comp+30)*4, comp, comp, 5);
  sq54 = new Button("", x_space+(comp+30)*3, y_space+(comp+30)*4, comp, comp, 5);
  sq55 = new Button("", x_space+(comp+30)*4, y_space+(comp+30)*4, comp, comp, 5);
  // INICIALIZA OS BOTÕES DE APAGAR
  btn_apagarTudo = new Button("Apagar Tudo", x_space+(comp+55)*4+80, y_space+(comp+30)*4, 180, 40, 0);
  btn_apagar = new Button("Apagar", x_space+(comp+55)*3+90, y_space+(comp+30)*4, 100, 40, 0);
  // INICIALIZA OS BOTÕES DAS LAYERS
  btn_ly1 = new Button("1", x_space, y_space+(comp+30)*5+30, 60, 60, 10);
  btn_ly2 = new Button("2", x_space+comp+30, y_space+(comp+30)*5+30, 60, 60, 10);
  btn_ly3 = new Button("3", x_space+(comp+30)*2, y_space+(comp+30)*5+30, 60, 60, 10);
  btn_ly4 = new Button("4", x_space+(comp+30)*3, y_space+(comp+30)*5+30, 60, 60, 10);
  btn_ly5 = new Button("5", x_space+(comp+30)*4, y_space+(comp+30)*5+30, 60, 60, 10);
  btn_ly6 = new Button("TC", x_space+(comp+30)*5, y_space+(comp+30)*5+30, 60, 60, 10);
  // INICIALIZA OS BOTÕES DE ANIMAÇÕES
  btn_anim1 = new Button("1", x_space+(comp+55)*4+35, y_space+40, 50, 50, 10);
  btn_anim2 = new Button("2", x_space+(comp+55)*4+105, y_space+40, 50, 50, 10);
  btn_anim3 = new Button("3", x_space+(comp+55)*4+35, y_space+110, 50, 50, 10);
  btn_anim4 = new Button("4", x_space+(comp+55)*4+105, y_space+110, 50, 50, 10);
  btn_anim5 = new Button("NA", x_space+(comp+55)*4+35, y_space+180, 50, 50, 10);
  // INICIALIZA AS IMAGENS
  logo = loadImage("logo02_inverted.png");
  flopLogo = loadImage("flop_logo_resized.png");
  raslogo = loadImage("ras_logo2.png");
}

void draw(){
  background(0);
  tint(0, 153, 204); // COLORE TODAS AS IMAGENS COM UM TOM AZULADO
  // DESENHA TODOS OD OBJETOS INICIALIZADOS NO SETUP
  image(logo, 260, 30);
  image(flopLogo, x_space+(comp+55)*4+90, y_space+(comp+30)*5-45);
  image(raslogo, x_space-270, y_space+(comp+30)*4-10);
  sq11.DrawSquare(0);
  sq12.DrawSquare(1);
  sq13.DrawSquare(2);
  sq14.DrawSquare(3);
  sq15.DrawSquare(4);
  sq21.DrawSquare(5);
  sq22.DrawSquare(6);
  sq23.DrawSquare(7);
  sq24.DrawSquare(8);
  sq25.DrawSquare(9);
  sq31.DrawSquare(10);
  sq32.DrawSquare(11);
  sq33.DrawSquare(12);
  sq34.DrawSquare(13);
  sq35.DrawSquare(14);
  sq41.DrawSquare(15);
  sq42.DrawSquare(16);
  sq43.DrawSquare(17);
  sq44.DrawSquare(18);
  sq45.DrawSquare(19);
  sq51.DrawSquare(20);
  sq52.DrawSquare(21);
  sq53.DrawSquare(22);
  sq54.DrawSquare(23);
  sq55.DrawSquare(24);
  btn_apagarTudo.Draw(255);
  btn_apagar.Draw(255);
  btn_ly1.DrawLayerButton(255, border1);
  btn_ly2.DrawLayerButton(255, border2);
  btn_ly3.DrawLayerButton(255, border3);
  btn_ly4.DrawLayerButton(255, border4);
  btn_ly5.DrawLayerButton(255, border5);
  btn_ly6.DrawLayerButton(255, border6);
  btn_anim1.DrawLayerButton(255, borderAnim1);
  btn_anim2.DrawLayerButton(255, borderAnim2);
  btn_anim3.DrawLayerButton(255, borderAnim3);
  btn_anim4.DrawLayerButton(255, borderAnim4);
  btn_anim5.DrawLayerButton(255, borderAnim5);
  DrawnTextBox("Selecione a camada desejada: ", 20, x_space, y_space+(comp+30)*5+10);
  DrawnTextBox("Animações:", 28, x_space+(comp+55)*4+20, y_space+20);
}

// FUNÇÃO UTILIZADA PARA DESENHAR AS CAIXAS DE TEXTO
void DrawnTextBox(String text, int size, int x, int y){
  fill(255);
  textAlign(LEFT);
  textSize(size);
  text(text, x, y);
  fill(0);
}

void mousePressed(){ // FUNÇÃO CHAMADA QUANDO O MOUSE É PRESSIONADO
  if(mouseButton == LEFT){ // SE O BOTÃO ESQUERDO DO MOUSE FOR PRESSIONADO
  // A FUNÇÃO "mouseOVer()", CRIADA NA CLASS BUTTON, VERIFICA SE AS COORDENADAS DO MOUSE ESTÃO DENTRO DOS LIMITES DO OBJETO
  if(sq11.mouseOver()){
    sendData = dataSent(1, layerStatus, 11);
    port.write(sendData); // ESCREVE NA PORTA SERIAL A MENSAGEM PARA O CHIPKIT, INDICANDO QUAL LED DEVE SER ACESO
    changeColor(1, layerStatus, 0); // MUDA A COR DO QUADRADO PARA BRANCO
  }
  else if(sq12.mouseOver()){
    sendData = dataSent(1, layerStatus, 12);
    port.write(sendData);
    changeColor(1, layerStatus, 1);
  }
  else if(sq13.mouseOver()){
    sendData = dataSent(1, layerStatus, 13);
    port.write(sendData);
    changeColor(1, layerStatus, 2);
  }
  else if(sq14.mouseOver()){
    sendData = dataSent(1, layerStatus, 14);
    port.write(sendData);
    changeColor(1, layerStatus, 3);
  }
  else if(sq15.mouseOver()){
    sendData = dataSent(1, layerStatus, 15);
    port.write(sendData);
    changeColor(1, layerStatus, 4);
  }
  else if(sq21.mouseOver()){
    sendData = dataSent(1, layerStatus, 21);
    port.write(sendData);
    changeColor(1, layerStatus, 5);
  }
  else if(sq22.mouseOver()){
    sendData = dataSent(1, layerStatus, 22);
    port.write(sendData);
    changeColor(1, layerStatus, 6);
  }
  else if(sq23.mouseOver()){
    sendData = dataSent(1, layerStatus, 23);
    port.write(sendData);
    changeColor(1, layerStatus, 7);
  }
  else if(sq24.mouseOver()){
    sendData = dataSent(1, layerStatus, 24);
    port.write(sendData);
    changeColor(1, layerStatus, 8);
  }
  else if(sq25.mouseOver()){
    sendData = dataSent(1, layerStatus, 25);
    port.write(sendData);
    changeColor(1, layerStatus, 9);
  }
  else if(sq31.mouseOver()){
    sendData = dataSent(1, layerStatus, 31);
    port.write(sendData);
    changeColor(1, layerStatus, 10);
  }
  else if(sq32.mouseOver()){
    sendData = dataSent(1, layerStatus, 32);
    port.write(sendData);
    changeColor(1, layerStatus, 11);
  }
  else if(sq33.mouseOver()){
    sendData = dataSent(1, layerStatus, 33);
    port.write(sendData);
    changeColor(1, layerStatus, 12);
  }
  else if(sq34.mouseOver()){
    sendData = dataSent(1, layerStatus, 34);
    port.write(sendData);
    changeColor(1, layerStatus, 13);
  }
  else if(sq35.mouseOver()){
    sendData = dataSent(1, layerStatus, 35);
    port.write(sendData);
    changeColor(1, layerStatus, 14);
  }
  else if(sq41.mouseOver()){
    sendData = dataSent(1, layerStatus, 41);
    port.write(sendData);
    changeColor(1, layerStatus, 15);
  }
  else if(sq42.mouseOver()){
    sendData = dataSent(1, layerStatus, 42);
    port.write(sendData);
    changeColor(1, layerStatus, 16);
  }
  else if(sq43.mouseOver()){
    sendData = dataSent(1, layerStatus, 43);
    port.write(sendData);
    changeColor(1, layerStatus, 17);
  }
  else if(sq44.mouseOver()){
    sendData = dataSent(1, layerStatus, 44);
    port.write(sendData);
    changeColor(1, layerStatus, 18);
  }
  else if(sq45.mouseOver()){
    sendData = dataSent(1, layerStatus, 45);
    port.write(sendData);
    changeColor(1, layerStatus, 19);
  }
  else if(sq51.mouseOver()){
    sendData = dataSent(1, layerStatus, 51);
    port.write(sendData);
    changeColor(1, layerStatus, 20);
  }
  else if(sq52.mouseOver()){
    sendData = dataSent(1, layerStatus, 52);
    port.write(sendData);
    changeColor(1, layerStatus, 21);
  }
  else if(sq53.mouseOver()){
    sendData = dataSent(1, layerStatus, 53);
    port.write(sendData);
    changeColor(1, layerStatus, 22);
  }
  else if(sq54.mouseOver()){
    sendData = dataSent(1, layerStatus, 54);
    port.write(sendData);
    changeColor(1, layerStatus, 23);
  }
  else if(sq55.mouseOver()){
    sendData = dataSent(1, layerStatus, 55);
    port.write(sendData);
    changeColor(1, layerStatus, 24);
  }
  else if(btn_apagarTudo.mouseOver()){
    port.write("apagarAll"); // ESCREVE NA PORTA SERIAL A MENSAGEM PARA O CHIPKIT, INDICANDO QUE TODOS OS LEDS DEVEM SER APAGADOS
    for(int f = 0; f < 5; f = f + 1){ // MUDA A COR DE TODOS OS QUADRADOS PARA PRETO
          for(int e = 0; e < 5; e = e + 1){
          int numero = e + f*5; 
          ly0[numero] = 0;
          ly1[numero] = 0;
          ly2[numero] = 0;
          ly3[numero] = 0;
          ly4[numero] = 0;
        }
        }
  }
  else if(btn_apagar.mouseOver()){
    if(layerStatus != 5){
    String apagar = "apagar";
    String v = ",";
    String specificErase = apagar + v + layerStatus;
    port.write(specificErase); // ESCREVE NA PORTA SERIAL A MENSAGEM PARA O CHIPKIT, INDICANDO QUAL A CAMADA QUE DEVE SER APAGADA
      for(int f = 0; f < 5; f = f + 1){ // MUDA A COR DOS QUADRADOS DA CAMADA EM QUESTÃO
          for(int e = 0; e < 5; e = e + 1){
          int numero =  e + layerStatus*5;
          ly0[numero] = 0;
          ly1[numero] = 0;
          ly2[numero] = 0;
          ly3[numero] = 0;
          ly4[numero] = 0;
        }
        }
    }
    else if(layerStatus == 5){
    port.write("apagarAll");
    for(int f = 0; f < 5; f = f + 1){
          for(int e = 0; e < 5; e = e + 1){
          int numero = e + f*5; 
          ly0[numero] = 0;
          ly1[numero] = 0;
          ly2[numero] = 0;
          ly3[numero] = 0;
          ly4[numero] = 0;
        }
        }
    }
  }
  // REGISTRA O EVENTO DE CLIQUE NOS BOTÕES DAS CAMADAS
  else if(btn_ly1.mouseOver()){
    layerStatus = 0; // VARIÁVEL QUE INDICA EM QUAL CAMADA O PROGRAMA ESTÁ TRABALHANDO
    // INDICAÇÃO VISUAL PARA O USUÁRIO AO MUDAR O TAMANHO DA BORDA DO BOTÃO DA CAMADA CLICADA
    border1 = 3;
    border2 = 0;
    border3 = 0;
    border4 = 0;
    border5 = 0;
    border6 = 0;
  }
  else if(btn_ly2.mouseOver()){
    layerStatus = 1;
    border1 = 0;
    border2 = 3;
    border3 = 0;
    border4 = 0;
    border5 = 0;
    border6 = 0;
  }
  else if(btn_ly3.mouseOver()){
    layerStatus = 2;
    border1 = 0;
    border2 = 0;
    border3 = 3;
    border4 = 0;
    border5 = 0;
    border6 = 0;
  }
  else if(btn_ly4.mouseOver()){
    layerStatus = 3;
    border1 = 0;
    border2 = 0;
    border3 = 0;
    border4 = 3;
    border5 = 0;
    border6 = 0;
  }
  else if(btn_ly5.mouseOver()){
    layerStatus = 4;
    border1 = 0;
    border2 = 0;
    border3 = 0;
    border4 = 0;
    border5 = 3;
    border6 = 0;
  }
  else if(btn_ly6.mouseOver()){
    layerStatus = 5;
    border1 = 0;
    border2 = 0;
    border3 = 0;
    border4 = 0;
    border5 = 0;
    border6 = 3;
  }
  // REGISTRA O EVENTO DE CLIQUE NOS BOTÕES DAS ANIMAÇÕES
  else if(btn_anim1.mouseOver()){
    port.write("anim1"); // ESCREVE NA PORTA SERIAL A ANIMAÇÃO QUE O CHIPKIT DEVE EXECUTAR
    borderAnim1 = 3;
    borderAnim2 = 0;
    borderAnim3 = 0;
    borderAnim4 = 0;
    borderAnim5 = 0;
  }
  else if(btn_anim2.mouseOver()){
    port.write("anim2");
    borderAnim1 = 0;
    borderAnim2 = 3;
    borderAnim3 = 0;
    borderAnim4 = 0;
    borderAnim5 = 0;
  }
  else if(btn_anim3.mouseOver()){
    port.write("anim3");
    borderAnim1 = 0;
    borderAnim2 = 0;
    borderAnim3 = 3;
    borderAnim4 = 0;
    borderAnim5 = 0;
  }
  else if(btn_anim4.mouseOver()){
    port.write("anim4");
    borderAnim1 = 0;
    borderAnim2 = 0;
    borderAnim3 = 0;
    borderAnim4 = 3;
    borderAnim5 = 0;
  }
  else if(btn_anim5.mouseOver()){
    port.write("anim5");
    borderAnim1 = 0;
    borderAnim2 = 0;
    borderAnim3 = 0;
    borderAnim4 = 0;
    borderAnim5 = 5;
  }
  }
  else if(mouseButton == RIGHT){ // SE O BOTÃO DIREITO DO MOUSE FOR PRESSIONADO
  if(sq11.mouseOver()){
    sendData = dataSent(0, layerStatus, 11);
    port.write(sendData); // ESCREVE NA PORTA SERIAL A MENSAGEM PARA O CHIPKIT, INDICANDO QUAL LED DEVE SER APAGADO
    changeColor(0, layerStatus, 0); // MUDA A COR DO QUADRADO PARA PRETO
  }
  else if(sq12.mouseOver()){
    sendData = dataSent(0, layerStatus, 12);
    port.write(sendData);
    changeColor(0, layerStatus, 1);
  }
  else if(sq13.mouseOver()){
    sendData = dataSent(0, layerStatus, 13);
    port.write(sendData);
    changeColor(0, layerStatus, 2);
  }
  else if(sq14.mouseOver()){
    sendData = dataSent(0, layerStatus, 14);
    port.write(sendData);
    changeColor(0, layerStatus, 3);
  }
  else if(sq15.mouseOver()){
    sendData = dataSent(0, layerStatus, 15);
    port.write(sendData);
    changeColor(0, layerStatus, 4);
  }
  else if(sq21.mouseOver()){
    sendData = dataSent(0, layerStatus, 21);
    port.write(sendData);
    changeColor(0, layerStatus, 5);
  }
  else if(sq22.mouseOver()){
    sendData = dataSent(0, layerStatus, 22);
    port.write(sendData);
    changeColor(0, layerStatus, 6);
  }
  else if(sq23.mouseOver()){
    sendData = dataSent(0, layerStatus, 23);
    port.write(sendData);
    changeColor(0, layerStatus, 7);
  }
  else if(sq24.mouseOver()){
    sendData = dataSent(0, layerStatus, 24);
    port.write(sendData);
    changeColor(0, layerStatus, 8);
  }
  else if(sq25.mouseOver()){
    sendData = dataSent(0, layerStatus, 25);
    port.write(sendData);
    changeColor(0, layerStatus, 9);
  }
  else if(sq31.mouseOver()){
    sendData = dataSent(0, layerStatus, 31);
    port.write(sendData);
    changeColor(0, layerStatus, 10);
  }
  else if(sq32.mouseOver()){
    sendData = dataSent(0, layerStatus, 32);
    port.write(sendData);
    changeColor(0, layerStatus, 11);
  }
  else if(sq33.mouseOver()){
    sendData = dataSent(0, layerStatus, 33);
    port.write(sendData);
    changeColor(0, layerStatus, 12);
  }
  else if(sq34.mouseOver()){
    sendData = dataSent(0, layerStatus, 34);
    port.write(sendData);
    changeColor(0, layerStatus, 13);
  }
  else if(sq35.mouseOver()){
    sendData = dataSent(0, layerStatus, 35);
    port.write(sendData);
    changeColor(0, layerStatus, 14);
  }
  else if(sq41.mouseOver()){
    sendData = dataSent(0, layerStatus, 41);
    port.write(sendData);
    changeColor(0, layerStatus, 15);
  }
  else if(sq42.mouseOver()){
    sendData = dataSent(0, layerStatus, 42);
    port.write(sendData);
    changeColor(0, layerStatus, 16);
  }
  else if(sq43.mouseOver()){
    sendData = dataSent(0, layerStatus, 43);
    port.write(sendData);
    changeColor(0, layerStatus, 17);
  }
  else if(sq44.mouseOver()){
    sendData = dataSent(0, layerStatus, 44);
    port.write(sendData);
    changeColor(0, layerStatus, 18);
  }
  else if(sq45.mouseOver()){
    sendData = dataSent(0, layerStatus, 45);
    port.write(sendData);
    changeColor(0, layerStatus, 19);
  }
  else if(sq51.mouseOver()){
    sendData = dataSent(0, layerStatus, 51);
    port.write(sendData);
    changeColor(0, layerStatus, 20);
  }
  else if(sq52.mouseOver()){
    sendData = dataSent(0, layerStatus, 52);
    port.write(sendData);
    changeColor(0, layerStatus, 21);
  }
  else if(sq53.mouseOver()){
    sendData = dataSent(0, layerStatus, 53);
    port.write(sendData);
    changeColor(0, layerStatus, 22);
  }
  else if(sq54.mouseOver()){
    sendData = dataSent(0, layerStatus, 54);
    port.write(sendData);
    changeColor(0, layerStatus, 23);
  }
  else if(sq55.mouseOver()){
    sendData = dataSent(0, layerStatus, 55);
    port.write(sendData);
    changeColor(0, layerStatus, 24);
  }
  }
}
