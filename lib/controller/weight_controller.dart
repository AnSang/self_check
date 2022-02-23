import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:self_check/models/weight.dart';

class WeightController extends GetxController {
  static const key = 'weigth';

  late SharedPreferences pref;
  List<Weight>? items;

  var isInput = false;
  final textController = TextEditingController();

  @override
  void onInit() async {
    textController.text = '0.0';
    pref = await SharedPreferences.getInstance();
    items = initItems();
    super.onInit();
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


  // preferences


  List<Weight> initItems() {
    String? _list = pref.getString(key);
    if (_list == null) {
      return <Weight>[];  // 없으면 빈 list 반환
    } else {
      List list = jsonDecode(_list!);
      return list.cast<Weight>();
    }
  }

  Weight getItem(int index) {
    return items![index];
  }

  void addItemRow(Weight item) {
    items!.add(item);
  }

  void addItemData(String date, double weight) {
    items!.add(Weight(date: date, weight: weight));
    pref.setString(key, jsonEncode(items!));

    items!.clear();
    items = initItems();
  }
}