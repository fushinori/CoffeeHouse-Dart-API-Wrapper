import 'dart:io';

import 'package:coffeehouse/coffeehouse.dart';

void main() async {
  var lydia = Lydia("YOUR_ACCESS_KEY");
  var session = await lydia.createSession();
  while (true) {
    print("Enter some text");
    var input = stdin.readLineSync();
    print("Output: ${await session.thinkThought(input)}");
  }
}
