import java.util.ArrayList;
class Oblici{
  float startX, startY; // Varijable za pohranu početnih koordinata kvadrata
  float endX, endY;
  float udalj, srceSize;
  float udaljX, udaljY;
  float Radijus, Broj = 5;
  float centarX, centarY;
  float X1, X2, X3, Y1, Y2, Y3;
  float RX1, RX2, RX3, RX4, RY1, RY2, RY3, RY4;
  

  int mouseHeld = 0;
  int oblikCrtaj = 6;
  
  ArrayList<float[]> pravokutnici = new ArrayList<float[]>();
  ArrayList<float[]> krugovi = new ArrayList<float[]>();
  ArrayList<float[]> srca = new ArrayList<float[]>();
  ArrayList<float[]> zvijezde = new ArrayList<float[]>();
  ArrayList<float[]> trokuti = new ArrayList<float[]>();
  ArrayList<float[]> rombovi = new ArrayList<float[]>();
  
  
  Oblici(){
  }
  void iscrtaj(){
    stroke(0); // Postavljamo boju linije na crnu
    strokeWeight(2); 
    
  //oblik 1 --> pravokutnik
  //oblik 2 --> krug
  //oblik 3 --> srce
  //oblik 4 --> zvijezda
  //oblik 5 --> trokut
  //oblik 6 --> romb 
  
  for (float[] pravokutnik : pravokutnici) {
      float x = pravokutnik[0];
      float y = pravokutnik[1];
      float sirina = pravokutnik[2];
      float visina = pravokutnik[3];
      rect(x,y,sirina,visina);
    }
      for (float[] krug : krugovi) {
      float x = krug[0];
      float y = krug[1];
      float r = krug[2];
      circle(x, y, r); 
    }
      for (float[] srce : srca) {
      float x = srce[0];
      float y = srce[1];
      float d = srce[2];
      nacrtajSrce(x, y, d); 
    }
    
      for (float[] zvijezda : zvijezde) {
      float x = zvijezda[0];
      float y = zvijezda[1];
      float c = zvijezda[2];
      float d = zvijezda[3];
      nacrtajZvijezdu(x, y, c, d); 
    }
    
      for (float[] trokut : trokuti) {
      float x1 = trokut[0];
      float y1 = trokut[1];
      float x2= trokut[2];
      float y2 = trokut[3];
      float x3= trokut[4];
      float y3 = trokut[5];
      triangle(x1, y1, x2, y2, x3, y3); 
    }
    
      for (float[] romb : rombovi) {
      float x1 = romb[0];
      float y1 = romb[1];
      float x2= romb[2];
      float y2 = romb[3];
      float x3= romb[4];
      float y3 = romb[5];
      float x4 = romb[6];
      float y4 = romb[7];
      quad(x1, y1, x2, y2, x3, y3, x4, y4); 
    }
  }
  void dodajOblik() {
      if( mouseHeld == 2  && oblikCrtaj == 1){
        mouseHeld = 0;
        float a[] = {startX, startY, endX, endY};
        pravokutnici.add(a);
  }
        if( mouseHeld == 2  && oblikCrtaj == 2){
        mouseHeld = 0;
        float a[] = {startX, startY, udalj*2};
        krugovi.add(a);
  }
        if( mouseHeld == 2  && oblikCrtaj == 3){
        mouseHeld = 0;
        float a[] = {startX, startY, srceSize};
        srca.add(a);
  }
       if( mouseHeld == 2  && oblikCrtaj == 4){
        mouseHeld = 0;
        float a[] = {centarX, centarY, Radijus, Broj};
        zvijezde.add(a);
  }
         if( mouseHeld == 2  && oblikCrtaj == 5){
        mouseHeld = 0;
        float a[] = {X1, Y1, X2, Y2, X3, Y3};
        trokuti.add(a);
  }
        if( mouseHeld == 2  && oblikCrtaj == 6){
        mouseHeld = 0;
        float a[] = { RX1, RY1, RX2, RY2, RX3, RY3, RX4, RY4};
        rombovi.add(a);
  }
 }
   void nacrtajSrce(float a, float b, float c)
  {
    //Lijeva strana srca
    beginShape();
    vertex(a, b + c / 4);
    bezierVertex(a - c / 2, b - c / 2, a - c, b + c / 3, a, b + c);
    endShape();
    
    // Desna strana srca
    beginShape();
    vertex(a, b + c / 4 );
    bezierVertex(a + c / 2, b - c / 2, a + c, b + c / 3, a, b + c);
    endShape();
  }
  
  void nacrtajZvijezdu(float cx, float cy, float R, float B)
  {
      int numPoints = (int)B; // Broj vrhova zvijezde
      float angle = TWO_PI / numPoints; // Kut između svakog vrha
      
      beginShape();
      for (int i = 0; i < numPoints * 2; i++) {
        float r = (i % 2 == 0) ? R * 0.5 : R; // Odabir vanjskog ili unutarnjeg radijusa
        float x = cx + cos(angle * i - HALF_PI) * r; // X koordinata vrha
        float y = cy + sin(angle * i - HALF_PI) * r; // Y koordinata vrha
        vertex(x, y); // Dodavanje vrha u oblik
        i++;
      }
      endShape(CLOSE);
  }


  void mousePressed() {
  startX = mouseX;
  startY = mouseY;
  mouseHeld = 1;
}
void mouseReleased() {
  
  // ----- za pravokutnik -------------------------------
  endX = mouseX - startX;
  endY = mouseY - startY;

 //------- za krug --------------------------------------
  udalj = dist(startX, startY, mouseX, mouseY);
  
 //------- za srce --------------------------------------
  udaljX = startX + dist(startX, startY, mouseX, mouseY);
  udaljY = startY + dist(startX, startY, mouseX, mouseY);
  srceSize = dist(startX, startY, udaljX, udaljY);
  
 //------ za zvijezdu ---------------------------------- 
 centarX = startX + endX/2;
 centarY = startY + endY/2;
 Radijus = startX < mouseX ? dist(startX, startY, udaljX, udaljY) - 30 : 0;
 
 //------- za trokut ------------------------------------
 X1 = startX ;
 Y1 = mouseY;
 X2 = startX + (mouseX - startX)/2;
 Y2 = startY;
 X3 = mouseX;
 Y3 = mouseY;
 
 //--------za romb ------------------------------------
 RX1 = startX;
 RY1 = startY + (mouseY - startY)/2;
 RX2 = startX + (mouseX - startX)/2;
 RY2 = mouseY;
 RX3 = mouseX;
 RY3 = startY + (mouseY - startY)/2;
 RX4 = startX + (mouseX - startX)/2;
 RY4 = startY;
 
 //------------------------------------------------------
    
  mouseHeld = 2;
  dodajOblik();
}

}
void mousePressed() {
  oblici.mousePressed();
}

void mouseReleased() {
  oblici.mouseReleased();
}
