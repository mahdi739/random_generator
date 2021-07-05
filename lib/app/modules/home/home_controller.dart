import 'package:get/get.dart';
import 'dart:math';

class HomeController extends GetxController {
  final from = 0.obs;
  final to = 0.obs;
  final rnd = 0.obs;

  void generate(int from, int to) {
    var code = 0;
    try {
      code = Random(DateTime.now().millisecondsSinceEpoch).nextInt(to - from + 1) + from;
    } catch (e) {
      code = 0;
    }
    rnd.value = code;
  }
}
