// ignore: constant_identifier_names
const NAMES = [
  "Maria",
  "Pedro",
  "Sofia",
  "Rafael",
  "Laura",
  "Carlos",
  "Beatriz",
  "André",
  "Isabel",
  "Lucas",
  "Carolina",
  "Daniel",
  "Gabriela"
];

List map(arr, func) {
  int count = 0;
  return arr.map((item) {
    final result = func(item, count);
    count++;
    return result;
  }).toList();
}

class FakeData {
  List<dynamic> generateNames() {
    final names = map(NAMES, (name, index) => {'id': index, 'name': name});

    return names;
  }
}
