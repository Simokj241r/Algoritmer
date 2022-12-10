import java.util.HashSet; //<>// //<>//
//char [] boeger = {'A', 'E', 'F', 'B', 'G','C'};
HashSet<Character> alfabetRandomizer = new HashSet<Character>();
int n = 27;
char [] boeger = new char[n];
char [] Quick = new char[boeger.length];
char [] select = new char[boeger.length];
char bogstav;
char temp;
int rigtig = 0;
int iderationer = 0;
int [][] iderationer3 = new int[boeger.length][2];
int iderationer1 = 0;
int iderationer2 = 0;
int min = 0;

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
  for (int i = 0; i < boeger.length; i++) {
    Quick[i] = boeger[i];
  }
  for (int i = 0; i < boeger.length; i++) {
    select[i] = boeger[i];
  }
}

void draw() {


  System.out.println(boeger);
  println();
  System.out.println(sorter(boeger));
  println("iderationer", iderationer, "\n");
  //System.out.println(select);
  System.out.println(selection(boeger));
  println("iderationer1", iderationer1, "\n");
  System.out.println(quick(Quick));
  println("iderationer2", iderationer2);
  noLoop();
}

char [] sorter(char [] reol) {

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

char [] selection(char [] reol) {
  for (int i = 0; i < select.length; i++) {
    min = i;
    for (int j = i+1; j < select.length; j++) {
      if (int(select[min]) > int(select[j])) {
        min = j;
        //iderationer1 += 1;
      }
      iderationer1 += 1;
    }
    temp = select[i];
    select[i] = select[min];
    select[min] = temp;
  }
  return reol;
}

char [] quick(char [] reol) {
  iderationer2++;
  int lenArr = reol.length;

  int l = 0, r = 0;
  if (lenArr < 2) {
    return reol;
  }
  char pivot = reol[lenArr/2];
  char [] left = new char[lenArr];
  char [] right = new char[lenArr];
  char [] sorted = new char[lenArr];

  for (int i = 0; i < lenArr; i++) {
    if (int(reol[i]) != int(pivot)) {
      if (int(reol[i]) < int(pivot)) {
        left[l] = reol[i];
        l++;
      } else {
        right[r] = reol[i];
        r++;
      }
    }
  }
  char [] sortLeft = new char[l];
  char [] sortRight = new char[r];
  arrayCopy(left, 0, sortLeft, 0, l);
  arrayCopy(right, 0, sortRight, 0, r);
  sortLeft = quick(sortLeft);

  sortRight = quick(sortRight);
  arrayCopy(sortLeft, 0, sorted, 0, l);
  sorted[l] = pivot;
  arrayCopy(sortRight, 0, sorted, l+1, r);

  return sorted;
}
