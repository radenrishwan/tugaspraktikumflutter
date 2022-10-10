void main() {
  // every data type in dart
  final String name = "Raden Mohamad Rishwan"; // String
  final int age = 20; // Integer
  final bool isMale = true; // Boolean
  final double height = 1.7; // Double

  // loop
  final int size = 10; // initiate size for triangle
  for (var i = 0; i < size; i++) {
    print("*" * i);
  }

  print("==================");

  // list
  final List<String> list = ["Eat", "Sleep", "Repeat"]; // List
  list.forEach((element) => print("I like to $element")); // print every element

  print("==================");

  // map
  final Map<String, dynamic> address = {
    "street": "Jl. Raden Hanafiah",
    "city": "Bogor",
    "province": "Jawa Barat",
  };
  address.forEach((key, value) => print("$key: $value")); // print every key and value

  print("==================");

  // different between set and list
  // every add value in set will ignore when the value is same
  final Set<String> set = {"Eat", "Sleep", "Repeat", "Repeat", "Repeat"}; // Set
  set.forEach((element) => print(element)); // print every element

  print("==================");

  // program if else penentuan ipk
  final Map<String, double> nilai = {
    "MTK": 0.7,
    "IPA": 0.8,
    "IPS": 0.9,
    "B.Indonesia": 0.6,
  };

  ipk(nilai);
}

void ipk(Map<String, double> matkul) {
  double ipk = 0;
  // print all matkul
  print("list nilai kamu  : ");
  matkul.forEach((key, value) {
    ipk += value; // count total ipk
    print("$key : $value");
  });

  print("==================");

  // print ipk
  print("ipk kamu : $ipk");

  print("==================");

  if (ipk >= 3.5) {
    print("Hasil : kamu cumlaude");
  } else {
    print("Hasil : kamu tidak cumlaude");
  }
}
