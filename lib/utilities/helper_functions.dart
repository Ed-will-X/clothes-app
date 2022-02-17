import 'dart:math';

class HelperFunctions {
  randomId(num, string) {
    String result = '';
    String chars =
        '1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM';

    for (int i = 0; i < num; i++) {
      result += chars[Random().nextInt(chars.length)];
    }

    String id = '${string}-${result}';

    return id;
  }

  static allWordsCapitalize(String str) {
    return str.toLowerCase().split(' ').map((word) {
      String leftText = (word.length > 1) ? word.substring(1, word.length) : '';
      return word[0].toUpperCase() + leftText;
    }).join(' ');
  }
}
