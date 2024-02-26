Oblici oblici; // Deklaracija objekta klase Oblici

void setup() {
  size(600, 400);
  background(255);
  oblici = new Oblici(); // Inicijalizacija objekta klase Oblici
}

void draw() {
  fill(255); // Postavite boju na bijelu
  rect(0, 0, width, height); // Iscrtajte kvadrat koristeći dimenzije prozora
  oblici.iscrtaj();
}
