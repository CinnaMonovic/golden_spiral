// Playing around with Fibonacci sequence
// 30.07.2020 CM (cinna.monovic@gmail.com)
import java.util.Arrays;
import java.util.Scanner;

import java.io.*; // handling errors

public class Fibonacci {
  public static void main(String[] args) {

  Scanner lengthQuery = new Scanner (System.in);
  System.out.println("Length of a sequence:");

  int seqLength = lengthQuery.nextInt();
  long[] Sequence = GenerateSequence(seqLength);
  System.out.println("Fibonacci sequence: \r\n" + Arrays.toString(Sequence));

  float[] Ratios = FindRatios(Sequence);
  System.out.println("Ratios: \r\n" + Arrays.toString(Ratios));

  try {
  FileWriter Writer = new FileWriter("Fibonacci_sketch/Sequence.csv");
  String SequenceStr = Arrays.toString(Sequence).substring(1,Arrays.toString(Sequence).length()-1);
  String SequenceCSV = SequenceStr.replaceAll("\\s+","");
  Writer.write(SequenceCSV);
  Writer.close();
  System.out.println("Sequence of length " + seqLength + " succesfully written to file.");

  Writer.close();

} catch (IOException e) {
  System.out.println("Error!");
  e.printStackTrace();
}
    }


static long[] GenerateSequence(int threshold) {

    long[] Sequence = new long[threshold];
    int n = 0;
    Sequence[1] = 1;
    while (n<threshold-2) {
      Sequence[n+2] = Sequence[n]+Sequence[n+1];
      n = n+1;
    }
    return Sequence;
  }

static float[] FindRatios(long[] Sequence) {

    float[] Ratios = new float[Sequence.length - 2];

    for (int i = 0; i < Ratios.length; i++) {
      Ratios[i] = (float)Sequence[i+2] / (float)Sequence[i+1];
    }
    return Ratios;
}
}
