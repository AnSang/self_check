import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeightController extends GetxController {
  var isInput = false;
  final textController = TextEditingController();

  @override
  void onInit() {
    textController.text = '0.0';
  }

  @override
  void onClose() {
    textController.dispose();
    super.dispose();
  }

  void setInput(bool value) {
    isInput = value;
    update();
  }

  String validator(String value) {
    if (value.isEmpty) {
      return 'Please this field must be filled';
    }
    return '';
  }
}