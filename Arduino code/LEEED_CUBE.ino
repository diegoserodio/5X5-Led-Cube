int ledPins[] = {A1, A7, 2, 3, 4, 5, 6, 7, 8, 9, A3, 11, 12, A2, A0, 26, 27, 28, 29, 30, 31, 32, 33, 34, A6}; // Pinos das trilhas positivas
int gndPins[] = {37, 38, 39, 40, 41}; // Pinos das trilhas negativas
int gnd0[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
int gnd1[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
int gnd2[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
int gnd3[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
int gnd4[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}; // Arrays para determinar quais leds de cada GND devem ser acesos

int animNumber = 0; //Determina o comportamento do cubo

/*int gnd0[] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
int gnd1[] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
int gnd2[] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
int gnd3[] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
int gnd4[] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};*/

int tempo = 170;
int tempo2 = 130; 

void setup() {
  // put your setup code here, to run once:
  for (int i = 0; i <= 5; i = i + 1){
    pinMode(gndPins[i], OUTPUT);
  }
  for (int v = 0; v <= 25; v = v + 1){
    pinMode(ledPins[v], OUTPUT);
  }
  for (int i = 0; i <= 5; i = i + 1){
    digitalWrite(gndPins[i], LOW);
  }
  for (int v = 0; v <= 25; v = v + 1){
    digitalWrite(ledPins[v], LOW);
  }
  Serial.begin(9600);
  startSignal(); // Sinaliza que a porta serial está pronta
}

void loop() {
  // put your main code here, to run repeatedly:
  while(Serial.available() > 0){
    String data = Serial.readString();
    if(data.startsWith("apagar")){
      if(data == "apagarAll"){ // Recebeu o comando para apagar todos os leds
        apagarAll();
      }
      else{ // Recebeu o comando para apagar os leds de uma determinada layer
        String layer = data.substring(7);
        int layerint = layer.toInt();
        apagar(layerint);
      }
    }
    else if (data.startsWith("anim")){ // Recebeu o comando para alguma animação
      String anim = data.substring(4);
      animNumber = anim.toInt();
    }
    else{ // Se nenhum dos acima, recebeu o comando para acender um led específico
    String state = data.substring(0, 1);
    String layer = data.substring(2, 3);
    String ledY = data.substring(4, 5);
    String ledX = data.substring(5);
    int stateint = state.toInt(); // Indica se o led será ligado ou desligado
    int layerint = layer.toInt(); // Indica a camada
    int ledYint = ledY.toInt(); // Indica o GND
    int ledXint = ledX.toInt();
    int ledIndex = (ledXint + layerint*5) - 1; // Indica o pino do positivo
    
    if (layerint != 5){
     // Atribuirá na matriz indicada o estado do led segundo as informações recebidas
     if(ledYint == 1){
      if(stateint == 1){
        gnd0[ledIndex] = 1;
      }else if (stateint == 0){
        gnd0[ledIndex] = 0;
      }
    }
    else if(ledYint == 2){
      if(stateint == 1){
        gnd1[ledIndex] = 1;
      }else if (stateint == 0){
        gnd1[ledIndex] = 0;
      }
    }
    else if(ledYint == 3){
      if(stateint == 1){
        gnd2[ledIndex] = 1;
      }else if (stateint == 0){
        gnd2[ledIndex] = 0;
      }
    }
    else if(ledYint == 4){
      if(stateint == 1){
        gnd3[ledIndex] = 1;
      }else if (stateint == 0){
        gnd3[ledIndex] = 0;
      }
    }
    else if(ledYint == 5){
      if(stateint == 1){
        gnd4[ledIndex] = 1;
      }else if (stateint == 0){
        gnd4[ledIndex] = 0;
      }
    } 
    }
    
    else if(layerint == 5){ // Se recebeu o comando de acender um led numa posição específica em todas as layers
      int ledLy0Index = ledXint - 1;
      int ledLy1Index = ledXint + 4;
      int ledLy2Index = ledXint + 9;
      int ledLy3Index = ledXint + 14;
      int ledLy4Index = ledXint + 19;
     if(stateint == 1){
        if(ledYint == 1){
          gnd0[ledLy0Index] = 1;
          gnd0[ledLy1Index] = 1;
          gnd0[ledLy2Index] = 1;
          gnd0[ledLy3Index] = 1;
          gnd0[ledLy4Index] = 1;
        }
        else if(ledYint == 2){
          gnd1[ledLy0Index] = 1;
          gnd1[ledLy1Index] = 1;
          gnd1[ledLy2Index] = 1;
          gnd1[ledLy3Index] = 1;
          gnd1[ledLy4Index] = 1;
        }
        else if(ledYint == 3){
          gnd2[ledLy0Index] = 1;
          gnd2[ledLy1Index] = 1;
          gnd2[ledLy2Index] = 1;
          gnd2[ledLy3Index] = 1;
          gnd2[ledLy4Index] = 1;
        }
        else if(ledYint == 4){
          gnd3[ledLy0Index] = 1;
          gnd3[ledLy1Index] = 1;
          gnd3[ledLy2Index] = 1;
          gnd3[ledLy3Index] = 1;
          gnd3[ledLy4Index] = 1;
        }
        else if(ledYint == 5){
          gnd4[ledLy0Index] = 1;
          gnd4[ledLy1Index] = 1;
          gnd4[ledLy2Index] = 1;
          gnd4[ledLy3Index] = 1;
          gnd4[ledLy4Index] = 1;
        }
      }else if (stateint == 0){
        if(ledYint == 1){
          gnd0[ledLy0Index] = 0;
          gnd0[ledLy1Index] = 0;
          gnd0[ledLy2Index] = 0;
          gnd0[ledLy3Index] = 0;
          gnd0[ledLy4Index] = 0;
        }
        else if(ledYint == 2){
          gnd1[ledLy0Index] = 0;
          gnd1[ledLy1Index] = 0;
          gnd1[ledLy2Index] = 0;
          gnd1[ledLy3Index] = 0;
          gnd1[ledLy4Index] = 0;
        }
        else if(ledYint == 3){
          gnd2[ledLy0Index] = 0;
          gnd2[ledLy1Index] = 0;
          gnd2[ledLy2Index] = 0;
          gnd2[ledLy3Index] = 0;
          gnd2[ledLy4Index] = 0;
        }
        else if(ledYint == 4){
          gnd3[ledLy0Index] = 0;
          gnd3[ledLy1Index] = 0;
          gnd3[ledLy2Index] = 0;
          gnd3[ledLy3Index] = 0;
          gnd3[ledLy4Index] = 0;
        }
        else if(ledYint == 5){
          gnd4[ledLy0Index] = 0;
          gnd4[ledLy1Index] = 0;
          gnd4[ledLy2Index] = 0;
          gnd4[ledLy3Index] = 0;
          gnd4[ledLy4Index] = 0;
        }
      } 
    }
  }
  }

  // Determinará pela variável animNumber, o comportamento do cubo
  if (animNumber == 1){
     ledbyled();
  }
  else if (animNumber == 2){
     rain();
  }
  else if (animNumber == 3){
     multiplex();
  }
  else if (animNumber == 4){
     normal();
  }
  else{
     normal();
  }
}

void allGndOn(){
  digitalWrite(gndPins[0], HIGH);
  digitalWrite(gndPins[1], HIGH);
  digitalWrite(gndPins[2], HIGH);
  digitalWrite(gndPins[3], HIGH);
  digitalWrite(gndPins[4], HIGH);
}

void allGndOff(){
  digitalWrite(gndPins[0], LOW);
  digitalWrite(gndPins[1], LOW);
  digitalWrite(gndPins[2], LOW);
  digitalWrite(gndPins[3], LOW);
  digitalWrite(gndPins[4], LOW);
}

void allLedsOn(){
  digitalWrite(ledPins[0], HIGH);
  digitalWrite(ledPins[1], HIGH);
  digitalWrite(ledPins[2], HIGH);
  digitalWrite(ledPins[3], HIGH);
  digitalWrite(ledPins[4], HIGH);
  digitalWrite(ledPins[5], HIGH);
  digitalWrite(ledPins[6], HIGH);
  digitalWrite(ledPins[7], HIGH);
  digitalWrite(ledPins[8], HIGH);
  digitalWrite(ledPins[9], HIGH);
  digitalWrite(ledPins[10], HIGH);
  digitalWrite(ledPins[11], HIGH);
  digitalWrite(ledPins[12], HIGH);
  digitalWrite(ledPins[13], HIGH);
  digitalWrite(ledPins[14], HIGH);
  digitalWrite(ledPins[15], HIGH);
  digitalWrite(ledPins[16], HIGH);
  digitalWrite(ledPins[17], HIGH);
  digitalWrite(ledPins[18], HIGH);
  digitalWrite(ledPins[19], HIGH);
  digitalWrite(ledPins[20], HIGH);
  digitalWrite(ledPins[21], HIGH);
  digitalWrite(ledPins[22], HIGH);
  digitalWrite(ledPins[23], HIGH);
  digitalWrite(ledPins[24], HIGH);
}

void allLedsOff(){
  digitalWrite(ledPins[0], LOW);
  digitalWrite(ledPins[1], LOW);
  digitalWrite(ledPins[2], LOW);
  digitalWrite(ledPins[3], LOW);
  digitalWrite(ledPins[4], LOW);
  digitalWrite(ledPins[5], LOW);
  digitalWrite(ledPins[6], LOW);
  digitalWrite(ledPins[7], LOW);
  digitalWrite(ledPins[8], LOW);
  digitalWrite(ledPins[9], LOW);
  digitalWrite(ledPins[10], LOW);
  digitalWrite(ledPins[11], LOW);
  digitalWrite(ledPins[12], LOW);
  digitalWrite(ledPins[13], LOW);
  digitalWrite(ledPins[14], LOW);
  digitalWrite(ledPins[15], LOW);
  digitalWrite(ledPins[16], LOW);
  digitalWrite(ledPins[17], LOW);
  digitalWrite(ledPins[18], LOW);
  digitalWrite(ledPins[19], LOW);
  digitalWrite(ledPins[20], LOW);
  digitalWrite(ledPins[21], LOW);
  digitalWrite(ledPins[22], LOW);
  digitalWrite(ledPins[23], LOW);
  digitalWrite(ledPins[24], LOW);
}

/*void testing(){
  Serial.print("Comando: ");
  Serial.print(stateint);
  Serial.print("   ");
  Serial.print("GND: ");
  Serial.print(ledYint);
  Serial.print("   ");
  Serial.print("Led Index: ");
  Serial.println(ledIndex);
}*/

void startSignal(){
  allGndOn();
  allLedsOn();
  delay(500);
  allGndOff();
  allLedsOff();
  delay(300);
  allGndOn();
  allLedsOn();
  delay(500);
  allGndOff();
  allLedsOff();
}

