
/* Generate golden spiral 
   CM (cinna.monovic@gmail.com) 05.09.2020
   */


void setup() { 
 size(1920,1080);
 background(255);
 noLoop(); 
}

// important geometry modifiers

int multiplier = 1; // scaling factor
int size = 20; // number of 'vertices'

void draw() {
  Table Sequence = loadTable("Sequence.csv");
  int SeqLength = Sequence.getColumnCount();

  println("Loaded sequence has " + SeqLength + " entries."); 
  
  translate(width/1.5,height/1.5); // move the origin to the center
  
  int i = 0;
  
  PVector TranslationVector;
  TranslationVector = new PVector(0,0);
  
  int FibonacciNumber;
  int mod;
  
  //float[][] VertexCoordinates = new float[size][2];  
  
  
  while (i <= size) {
    
    FibonacciNumber = getElement(i+1,Sequence);
    
    int FN_scaled = FibonacciNumber*multiplier;
    
   // ellipse(0,0,5,5); // draw curve points
    
    fill(150+i*5);
    
    pushMatrix();
    rotate(-PI/2*i);
    fill(0,0,0,0);
    square(0,0,FN_scaled);
    popMatrix(); 
    
    mod = (i+1) % 4;
    
    if (mod == 1){
    TranslationVector.x = FN_scaled;
    TranslationVector.y = FN_scaled;
    pushMatrix();
    translate(FN_scaled,0);
    fill(0,0,0,0);
    arc(0,0,2*FN_scaled,2*FN_scaled,PI/2,PI);
    popMatrix();
}
      else if (mod == 2){
    TranslationVector.x = FN_scaled;
    TranslationVector.y = -FN_scaled;
    pushMatrix();
    translate(0,-FN_scaled);
    fill(0,0,0,0);
    arc(0,0,2*FN_scaled,2*FN_scaled,0,PI/2);
    popMatrix();  
}
        else if (mod == 3){
    TranslationVector.x = -FN_scaled;
    TranslationVector.y = -FN_scaled;
    pushMatrix();
    translate(-FN_scaled,0);
    fill(0,0,0,0);
    arc(0,0,2*FN_scaled,2*FN_scaled,-PI/2,0);
    popMatrix();    
}
          else {
    TranslationVector.x = -FN_scaled;
    TranslationVector.y = FN_scaled;
    pushMatrix();
    translate(0,FN_scaled);
    fill(0,0,0,0);
    arc(0,0,2*FN_scaled,2*FN_scaled,-PI,-PI/2);
    popMatrix();    
}
    translate(TranslationVector.x,TranslationVector.y);

    i++; 
  }
    
  saveFrame("spiral.png");
  }
   
  
  public int getElement(int element, Table Seq){
    return(Seq.getInt(0,element));

  }
