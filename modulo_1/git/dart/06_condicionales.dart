void main() {
  
  int a = 2;
  if (a > 2){
    print('a > 2 is true');
  }
  if (a < 2){
    print('a < 2 is true');
  }
  if (a == 2) {
    print('a == 2 is true');
  }
  if (a > 2){
    print('a > 2 is true');
  } else {
    print('a <= 2 is true');
  }
  if (a == 2) {
    print('a == 2 is true');
  } else {
    print('a != 2 is true');
  }
  
  int b = 2;
  if (b > 2){
    print('b > 2 is true');
  } else if (b < 2){
    print('b == 2 is true');
  } else {
    print('b == 2 is true');
  }
  
  int age = 10;
  String  agedescription = age >= 18 ? "adult" : "child";
  print(agedescription);

}

