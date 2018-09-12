void ledbyled(){
  for(int y = 5; y >= 0; y = y - 1){
      digitalWrite(gndPins[y], HIGH);
      for(int x = 0; x < 25; x = x + 1){
            digitalWrite(ledPins[x], HIGH);
            delay(30);
        if (x == 24){
          digitalWrite(gndPins[y], LOW);
          allLedsOff();
        }
      }
    }
  for(int y = 0; y <= 5; y = y + 1){
      digitalWrite(gndPins[y], HIGH);
      for(int x = 25; x >= 0; x = x - 1){
            digitalWrite(ledPins[x], HIGH);
            delay(30);
        if (x == 0){
          digitalWrite(gndPins[y], LOW);
          allLedsOff();
        }
      }
    } 
}

void rain(){
  int randomico1 = random(24);
  int randomico2 = random(24);
  int randomico3 = random(24);
  int randomico4 = random(24);
  for(int y = 0; y <= 5; y = y + 1){
    digitalWrite(gndPins[y], HIGH);
      for(int x = 0; x < 25; x = x + 1){
         if(y == 0){
          digitalWrite(ledPins[randomico1], HIGH);
          digitalWrite(ledPins[randomico2], HIGH);
          digitalWrite(ledPins[randomico3], HIGH);
          digitalWrite(ledPins[randomico4], HIGH);
          delay(5);
        }
        else if(y == 1){
          digitalWrite(ledPins[randomico1], HIGH);
          digitalWrite(ledPins[randomico2], HIGH);
          digitalWrite(ledPins[randomico3], HIGH);
          digitalWrite(ledPins[randomico4], HIGH);
          delay(5);
        }
        else if(y == 2){
          digitalWrite(ledPins[randomico1], HIGH);
          digitalWrite(ledPins[randomico2], HIGH);
          digitalWrite(ledPins[randomico3], HIGH);
          digitalWrite(ledPins[randomico4], HIGH);
          delay(5);
        }
        else if(y == 3){
          digitalWrite(ledPins[randomico1], HIGH);
          digitalWrite(ledPins[randomico2], HIGH);
          digitalWrite(ledPins[randomico3], HIGH);
          digitalWrite(ledPins[randomico4], HIGH);
          delay(5);
        }
        else if(y == 4){
          digitalWrite(ledPins[randomico1], HIGH);
          digitalWrite(ledPins[randomico2], HIGH);
          digitalWrite(ledPins[randomico3], HIGH);
          digitalWrite(ledPins[randomico4], HIGH);
          delay(6);
        }
        if (x == 24){
          digitalWrite(gndPins[y], LOW);
          allLedsOff();
        } 
      }
  }
}

void multiplex(){
  for (int t = 100; t >= 0; t = t - 10){
   if(t == 0){
    for(int r = 0; r <= 100; r = r + 1){
      for(int y = 0; y <= 5; y = y + 1){
      digitalWrite(gndPins[y], HIGH);
      for(int x = 0; x < 25; x = x + 1){
            digitalWrite(ledPins[x], HIGH);
            delayMicroseconds(tempo);
        if (x == 24){
          delay(t);
          digitalWrite(gndPins[y], LOW);
          allLedsOff();
        }
      }
    }
    for(int y = 5; y >= 0; y = y - 1){
      digitalWrite(gndPins[y], HIGH);
      for(int x = 0; x < 25; x = x + 1){
            digitalWrite(ledPins[x], HIGH);
            delayMicroseconds(tempo);
        if (x == 24){
          delay(t);
          digitalWrite(gndPins[y], LOW);
          allLedsOff();
        }
      }
    }
    }    
   }else{
     for(int y = 0; y <= 5; y = y + 1){
      digitalWrite(gndPins[y], HIGH);
      for(int x = 0; x < 25; x = x + 1){
            digitalWrite(ledPins[x], HIGH);
            delayMicroseconds(tempo);
        if (x == 24){
          delay(t);
          digitalWrite(gndPins[y], LOW);
          allLedsOff();
        }
      }
    }
    for(int y = 5; y >= 0; y = y - 1){
      digitalWrite(gndPins[y], HIGH);
      for(int x = 0; x < 25; x = x + 1){
            digitalWrite(ledPins[x], HIGH);
            delayMicroseconds(tempo);
        if (x == 24){
          delay(t);
          digitalWrite(gndPins[y], LOW);
          allLedsOff();
        }
      }
    }
   }
  }
}

void apagarAll(){
  for(int f = 0; f <= 5; f = f + 1){
     for(int e = 0; e <= 5; e = e + 1){
        int numero = e + f*5; 
        gnd0[numero] = 0;
        gnd1[numero] = 0;
        gnd2[numero] = 0;
        gnd3[numero] = 0;
        gnd4[numero] = 0;
      }
   }
}

void apagar(int layerNumber){
        for(int f = 0; f <= 5; f = f + 1){
          for(int e = 0; e < 5; e = e + 1){
          int numero =  e + layerNumber*5;
          gnd0[numero] = 0;
          gnd1[numero] = 0;
          gnd2[numero] = 0;
          gnd3[numero] = 0;
          gnd4[numero] = 0;
        }
        }
}

void normal(){
  for(int y = 0; y < 5; y = y + 1){
      digitalWrite(gndPins[y], HIGH);
      for(int x = 0; x < 25; x = x + 1){ // Esse "for" era usado quando os leds eram acesos um por vez, como agora isso foi mudado ele não é mais necessário
        if (y == 0){
          digitalWrite(ledPins[0], gnd0[0]);
          digitalWrite(ledPins[1], gnd0[1]);
          digitalWrite(ledPins[2], gnd0[2]);
          digitalWrite(ledPins[3], gnd0[3]);
          digitalWrite(ledPins[4], gnd0[4]);
          digitalWrite(ledPins[5], gnd0[5]);
          digitalWrite(ledPins[6], gnd0[6]);
          digitalWrite(ledPins[7], gnd0[7]);
          digitalWrite(ledPins[8], gnd0[8]);
          digitalWrite(ledPins[9], gnd0[9]);
          digitalWrite(ledPins[10], gnd0[10]);
          digitalWrite(ledPins[11], gnd0[11]);
          digitalWrite(ledPins[12], gnd0[12]);
          digitalWrite(ledPins[13], gnd0[13]);
          digitalWrite(ledPins[14], gnd0[14]);
          digitalWrite(ledPins[15], gnd0[15]);
          digitalWrite(ledPins[16], gnd0[16]);
          digitalWrite(ledPins[17], gnd0[17]);
          digitalWrite(ledPins[18], gnd0[18]);
          digitalWrite(ledPins[19], gnd0[19]);
          digitalWrite(ledPins[20], gnd0[20]);
          digitalWrite(ledPins[21], gnd0[21]);
          digitalWrite(ledPins[22], gnd0[22]);
          digitalWrite(ledPins[23], gnd0[23]);
          digitalWrite(ledPins[24], gnd0[24]);
          delayMicroseconds(tempo2);
        }
        else if (y == 1){
          digitalWrite(ledPins[0], gnd1[0]);
          digitalWrite(ledPins[1], gnd1[1]);
          digitalWrite(ledPins[2], gnd1[2]);
          digitalWrite(ledPins[3], gnd1[3]);
          digitalWrite(ledPins[4], gnd1[4]);
          digitalWrite(ledPins[5], gnd1[5]);
          digitalWrite(ledPins[6], gnd1[6]);
          digitalWrite(ledPins[7], gnd1[7]);
          digitalWrite(ledPins[8], gnd1[8]);
          digitalWrite(ledPins[9], gnd1[9]);
          digitalWrite(ledPins[10], gnd1[10]);
          digitalWrite(ledPins[11], gnd1[11]);
          digitalWrite(ledPins[12], gnd1[12]);
          digitalWrite(ledPins[13], gnd1[13]);
          digitalWrite(ledPins[14], gnd1[14]);
          digitalWrite(ledPins[15], gnd1[15]);
          digitalWrite(ledPins[16], gnd1[16]);
          digitalWrite(ledPins[17], gnd1[17]);
          digitalWrite(ledPins[18], gnd1[18]);
          digitalWrite(ledPins[19], gnd1[19]);
          digitalWrite(ledPins[20], gnd1[20]);
          digitalWrite(ledPins[21], gnd1[21]);
          digitalWrite(ledPins[22], gnd1[22]);
          digitalWrite(ledPins[23], gnd1[23]);
          digitalWrite(ledPins[24], gnd1[24]);
          delayMicroseconds(tempo2);
        }
        else if (y == 2){
          digitalWrite(ledPins[0], gnd2[0]);
          digitalWrite(ledPins[1], gnd2[1]);
          digitalWrite(ledPins[2], gnd2[2]);
          digitalWrite(ledPins[3], gnd2[3]);
          digitalWrite(ledPins[4], gnd2[4]);
          digitalWrite(ledPins[5], gnd2[5]);
          digitalWrite(ledPins[6], gnd2[6]);
          digitalWrite(ledPins[7], gnd2[7]);
          digitalWrite(ledPins[8], gnd2[8]);
          digitalWrite(ledPins[9], gnd2[9]);
          digitalWrite(ledPins[10], gnd2[10]);
          digitalWrite(ledPins[11], gnd2[11]);
          digitalWrite(ledPins[12], gnd2[12]);
          digitalWrite(ledPins[13], gnd2[13]);
          digitalWrite(ledPins[14], gnd2[14]);
          digitalWrite(ledPins[15], gnd2[15]);
          digitalWrite(ledPins[16], gnd2[16]);
          digitalWrite(ledPins[17], gnd2[17]);
          digitalWrite(ledPins[18], gnd2[18]);
          digitalWrite(ledPins[19], gnd2[19]);
          digitalWrite(ledPins[20], gnd2[20]);
          digitalWrite(ledPins[21], gnd2[21]);
          digitalWrite(ledPins[22], gnd2[22]);
          digitalWrite(ledPins[23], gnd2[23]);
          digitalWrite(ledPins[24], gnd2[24]);
          delayMicroseconds(tempo2);
        }
        else if (y == 3){
          digitalWrite(ledPins[0], gnd3[0]);
          digitalWrite(ledPins[1], gnd3[1]);
          digitalWrite(ledPins[2], gnd3[2]);
          digitalWrite(ledPins[3], gnd3[3]);
          digitalWrite(ledPins[4], gnd3[4]);
          digitalWrite(ledPins[5], gnd3[5]);
          digitalWrite(ledPins[6], gnd3[6]);
          digitalWrite(ledPins[7], gnd3[7]);
          digitalWrite(ledPins[8], gnd3[8]);
          digitalWrite(ledPins[9], gnd3[9]);
          digitalWrite(ledPins[10], gnd3[10]);
          digitalWrite(ledPins[11], gnd3[11]);
          digitalWrite(ledPins[12], gnd3[12]);
          digitalWrite(ledPins[13], gnd3[13]);
          digitalWrite(ledPins[14], gnd3[14]);
          digitalWrite(ledPins[15], gnd3[15]);
          digitalWrite(ledPins[16], gnd3[16]);
          digitalWrite(ledPins[17], gnd3[17]);
          digitalWrite(ledPins[18], gnd3[18]);
          digitalWrite(ledPins[19], gnd3[19]);
          digitalWrite(ledPins[20], gnd3[20]);
          digitalWrite(ledPins[21], gnd3[21]);
          digitalWrite(ledPins[22], gnd3[22]);
          digitalWrite(ledPins[23], gnd3[23]);
          digitalWrite(ledPins[24], gnd3[24]);
          delayMicroseconds(tempo2);
        }
        else if (y == 4){
          digitalWrite(ledPins[0], gnd4[0]);
          digitalWrite(ledPins[1], gnd4[1]);
          digitalWrite(ledPins[2], gnd4[2]);
          digitalWrite(ledPins[3], gnd4[3]);
          digitalWrite(ledPins[4], gnd4[4]);
          digitalWrite(ledPins[5], gnd4[5]);
          digitalWrite(ledPins[6], gnd4[6]);
          digitalWrite(ledPins[7], gnd4[7]);
          digitalWrite(ledPins[8], gnd4[8]);
          digitalWrite(ledPins[9], gnd4[9]);
          digitalWrite(ledPins[10], gnd4[10]);
          digitalWrite(ledPins[11], gnd4[11]);
          digitalWrite(ledPins[12], gnd4[12]);
          digitalWrite(ledPins[13], gnd4[13]);
          digitalWrite(ledPins[14], gnd4[14]);
          digitalWrite(ledPins[15], gnd4[15]);
          digitalWrite(ledPins[16], gnd4[16]);
          digitalWrite(ledPins[17], gnd4[17]);
          digitalWrite(ledPins[18], gnd4[18]);
          digitalWrite(ledPins[19], gnd4[19]);
          digitalWrite(ledPins[20], gnd4[20]);
          digitalWrite(ledPins[21], gnd4[21]);
          digitalWrite(ledPins[22], gnd4[22]);
          digitalWrite(ledPins[23], gnd4[23]);
          digitalWrite(ledPins[24], gnd4[24]);
          delayMicroseconds(tempo2);
        }
        if (x == 24){
          digitalWrite(gndPins[y], LOW);
          allLedsOff();
        }
      }
    }
}
