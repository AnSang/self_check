import 'package:get/get.dart';

class ScreenController extends GetxController {
  var isButtonView = true;
  var showScreenIndex = 0;
  var showBottomIndex = 0;

  void setScreen(int index) {
    showScreenIndex = index;
    update();
  }

  void setBottom(int index) {
    showBottomIndex = index;
    update();
  }

  void setButtonView(bool value) {
    isButtonView = value;
    update();
  }
}