class Trader {
  String name;
  String city;

  Trader(this.name, this.city);

  @override
  String toString() {
    return 'Trader{name: $name, city: $city}';
  }
}

class Transaction {
  Trader trader;
  int year;
  int value;

  Transaction(this.trader, this.year, this.value);

  @override
  String toString() {
    return 'Transaction{trader: $trader, year: $year, value: $value}';
  }
}

final transactions = [
  Transaction(Trader("Brian", "Cambridge"), 2011, 300),
  Transaction(Trader("Raoul", "Cambridge"), 2012, 1000),
  Transaction(Trader("Raoul", "Cambridge"), 2011, 400),
  Transaction(Trader("Mario", "Milan"), 2012, 710),
  Transaction(Trader("Mario", "Milan"), 2012, 700),
  Transaction(Trader("Alan", "Cambridge"), 2012, 950),
];

// void main() {
//   // 1. 2011년에 일어난 모든 트랜잭션을 찾아 가격 기준 오름차순으로 정리하여 이름을 나열하시오
//   print('// 1. 2011년에 일어난 모든 트랜잭션을 찾아 가격 기준 오름차순으로 정리하여 이름을 나열하시오');
//   (transactions.where((e) => e.year == 2011).toList()
//         ..sort((a, b) => a.value.compareTo(b.value)))
//       .forEach((e) {
//     print(e.trader.name);
//   });
//
//   // 2
// }

void main() {
  print('7. 전체 트랜잭션 중 value의 최대값은 얼마인가?');
}

class Person {
  String name;
  int age;

  Person(this.name, this.age);

  @override
  String toString() {
    return 'Person{name: $name, age: $age}';
  }
}
