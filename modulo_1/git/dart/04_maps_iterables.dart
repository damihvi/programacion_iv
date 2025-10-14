void main() {
  
    print("maps iterables");
  final numbers = [1,2,3,4,5,6,7,8,9,10];
  print("lista original: $numbers");
  print("tamaño ${numbers.length}");
  print("indice 4: ${numbers[4]}");
  print("primer elemento ${numbers.first}");
  final reversednumbers = numbers.reversed;
  print("reverso de numbers ${numbers.reversed}");
  print("list: ${reversednumbers.toList()}");
  print("set: ${reversednumbers.toSet()}");

}

