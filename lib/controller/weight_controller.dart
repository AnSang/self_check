import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:self_check/models/weight.dart';

class WeightController extends GetxController {
  static const key = 'weigth';

  late SharedPreferences pref;
  List<Weight>? items;
  List<Weight>? monthItems;

  var isInput = false;
  var yearMonth = DateTime.now(); //
  final textController = TextEditingController();

  @override
  void onInit() async {
    textController.text = '0.0';
    pref = await SharedPreferences.getInstance();
    items = initItems();
    monthItems = getMonthItem();
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

  void plusMonth() {
    yearMonth = DateTime(yearMonth.year, yearMonth.month + 1);
    update();
  }

  void minMonth() {
    yearMonth = DateTime(yearMonth.year, yearMonth.month - 1);
    update();
  }

  String getMonth() {
    return DateFormat('yyyy.MM').format(yearMonth);
  }

  String validator(String value) {
    if (value.isEmpty) {
      return 'Please this field must be filled';
    }
    return '';
  }

  List<Weight> getMonthItem() {
    List<Weight> list = [];
    for (Weight row in items!) {
      if (row.date.contains(getMonth())) {
        list.add(row);
      }
    }
    return list;
  }

  // preferences

  List<Weight> initItems() {
    String? list = pref.getString(key);
    if (list == null) {
      return <Weight>[];  // 없으면 빈 list 반환
    } else {
      List list_ = jsonDecode(list);
      return list_.cast<Weight>();
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
    monthItems = getMonthItem();
  }
}