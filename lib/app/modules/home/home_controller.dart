import 'package:get/get.dart';
import 'dart:math';

class HomeController extends GetxController {
  var code = 0.obs;

  int generate(int from, int to) {try{
    code.value = Random(DateTime.now().millisecondsSinceEpoch).nextInt(to - from+1) + from;}
    catch(e)
    {
      code.value=0;
    }
    return code.value;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
