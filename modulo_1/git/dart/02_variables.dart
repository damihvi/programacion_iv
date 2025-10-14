void main() {
  
    print("tipos de variables en dart");
  
  
  final String pokemon = "ditto";
  print(pokemon);
  String myname = "damian";
  myname = "herrera";
  print(myname);
  const String elemento = "fuego";
  print ("elemento: $elemento");
  bool active = false;
  active = false;
  print("Es activo: $active");
  int hp = 1000;
  print("caballos de fuerza: $hp ");
  List<String> abilities=["impostor","correlon"];
  print("habilidades $abilities");
  final sprites = <String>["src/image1.jpg",
                          "image2"];
  print("imagenes $sprites ");
  print("impresion en varias lineas ");
  print("""
  $pokemon
  $hp
  $sprites
  $abilities
  """);
  
}

