import java.util.HashSet; //<>//
//char [] boeger = {'A', 'E', 'F', 'B', 'G','C'};
HashSet<Character> alfabetRandomizer = new HashSet<Character>();
char [] boeger = new char[26];
char bogstav;
char temp;
int rigtig = 0;
int iderationer = 0;
void setup() {
  for (int i = 0; i < boeger.length; i++) {
    bogstav = char(int(random(65, 91)));
    alfabetRandomizer.add(bogstav);

    while (alfabetRandomizer.size() != i+1) {
      bogstav = char(int(random(65, 65+boeger.length)));
      alfabetRandomizer.add(bogstav);
    }
    //System.out.println(alfabetRandomizer);
    boeger[i] = bogstav;
  }
}

void draw() {

  System.out.println(boeger);
  System.out.println(sorter(boeger));
  print("iderationer:", iderationer);
  noLoop();
}

char [] sorter(char [] reol) {
  reol = boeger;
  iderationer++;
  for (int i = 1; i < reol.length; i++) {
    //println(i, "i-1", int(reol[i-1]), "i", int(reol[i]), "temp", temp);
    
    if (int(reol[i-1]) >= int(reol[i])) {

      temp = reol[i-1];
      reol[i-1] = reol[i];
      reol[i] = temp;
      
      return sorter(reol);
    }
  }



  return reol;
}
