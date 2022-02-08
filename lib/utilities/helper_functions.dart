import 'dart:math';

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
