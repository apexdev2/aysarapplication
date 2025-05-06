import 'package:get/get.dart';

class BnbController extends GetxController {
  int currentIndex = 0; // Track the current index
  changeCurrentIndex({required int index}) {
    currentIndex = index;
    update();
  }

  @override
  void dispose() {
    currentIndex = 0;
    super.dispose();
  }
}
