import 'package:get/get.dart';

class WakeController extends GetxController {
  var isInput = true;
  var time = DateTime.now();
  // var timer;

  @override
  void onInit() async {
    // updateTime();
    super.onInit();
  }

  void setInput(bool value) {
    isInput = value;
    update();
  }

  void getTime() {
    time = DateTime.now();
    update();
  }

  /*void updateTime() {
    getTime();
    timer = Timer(Duration(seconds: 1) , updateTime);
    printInfo(info: '갱신 $time');
  }*/
}