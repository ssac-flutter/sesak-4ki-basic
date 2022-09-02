extension StringExt on String {
  String last() {
    return substring(length - 1);
  }

  bool isLetter() {
    return contains(RegExp(r'[A-Za-z]'));
  }

  String dropLast() {
    return substring(0, length - 1);
  }

  int count(bool Function(String ch) callback) {
    int check = 0;
    for (int i = 0; i < length; i++) {
      if (callback(this[i])) {
        check++;
      }
    }
    return check;
  }

  String take(int n) {
    return substring(0, n);
  }

  String takeLast(int n) {
    return substring(length - n);
  }

  String takeWhile(bool Function(String ch) callback) {
    String str = '';

    for (int i = 0; i < length; i++) {
      if (callback(this[i])) {
        str += this[i];
      } else {
        break;
      }
    }

    return str;
  }
}
