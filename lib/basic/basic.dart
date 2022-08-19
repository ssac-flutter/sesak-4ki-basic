void main() {
  final person = Person('홍길동'); //20
  final person2 = Person('홍길동'); //10

  final person3 = person; // 20
  var person4 = person3;

  // hashCode
  Map<Person, int> personMap = {
    person: 20,
    person2: 10,
  };

  print(personMap.length); // 1
  print(personMap[person]);

  print(person.hashCode);
  print(person2.hashCode);

  if (person == person2) {
    print('같은놈'); //
  } else {
    print('다른놈'); //
  }
}

class Person {
  // member, property, 전역변수
  String name;

  Person(this.name);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Person && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() {
    return 'Person{name: $name}';
  }
}
