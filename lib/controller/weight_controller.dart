import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:self_check/models/chart_spot.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:self_check/models/weight.dart';

class WeightController extends GetxController {
  static const key = 'weigth';

  late SharedPreferences pref;
  late List<Weight> items;
  late List<Weight> monthItems;
  late List<Spot> spots;

  var isInput = true;
  var yearMonth = DateTime.now(); //
  final textController = TextEditingController();

  @override
  void onInit() async {
    pref = await SharedPreferences.getInstance();
    textController.text = '0.0';
    items = initItems();
    monthItems = getMonthItem();
    spots = getSpots();
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
    monthItems.clear();
    spots.clear();
    monthItems = getMonthItem();
    spots = getSpots();
    update();
  }

  void minMonth() {
    yearMonth = DateTime(yearMonth.year, yearMonth.month - 1);
    monthItems.clear();
    spots.clear();
    monthItems = getMonthItem();
    spots = getSpots();
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
    for (Weight row in items) {
      if (row.date.contains(getMonth())) {
        list.add(row);
      }
    }
    return list;
  }

  List<Spot> getSpots() {
    List<Spot> list = [];
    if (items == null) {
      for (Weight row in getInstanceList()) {
        double date = int.parse(row.date.substring(8,10)).toDouble();
        list.add(Spot(date, row.weight));
      }
    } else {
      for (Weight row in items) {
        if (row.date.contains(getMonth())) {
          double date = int.parse(row.date.substring(8, 10)).toDouble();
          list.add(Spot(date, row.weight));
        }
      }
    }

    if (list.isEmpty) {
      list.add(Spot(1, 50));
    }
    return list;
  }

  // preferences

  List<Weight> initItems() {
    String? list = pref.getString(key);
    if (list == null) {
      return getInstanceList();
      // return <Weight>[];  // 없으면 빈 list 반환
    } else {
      List list_ = jsonDecode(list);
      return list_.cast<Weight>();
    }
  }

  Weight getItem(int index) {
    return items[index];
  }

  void addItemRow(Weight item) {
    items.add(item);
  }

  void addItemData(String date, double weight) {
    items.add(Weight(date: date, weight: weight));
    pref.setString(key, jsonEncode(items));

    items.clear();
    items = initItems();
    monthItems = getMonthItem();
  }






  List<Weight> getInstanceList() {
    List<Weight> list = [];
    list.add(Weight(date: '2022.02.02', weight: 52));
    list.add(Weight(date: '2022.02.07', weight: 62));
    list.add(Weight(date: '2022.02.09', weight: 58));
    list.add(Weight(date: '2022.02.13', weight: 72));
    list.add(Weight(date: '2022.02.16', weight: 66));

    list.add(Weight(date: '2022.03.02', weight: 22));
    list.add(Weight(date: '2022.03.07', weight: 44));
    list.add(Weight(date: '2022.03.09', weight: 33));
    list.add(Weight(date: '2022.03.13', weight: 12));
    list.add(Weight(date: '2022.03.16', weight: 78));

    list.add(Weight(date: '2022.04.02', weight: 43));
    list.add(Weight(date: '2022.04.07', weight: 15));
    list.add(Weight(date: '2022.04.09', weight: 67));
    list.add(Weight(date: '2022.04.13', weight: 33));
    list.add(Weight(date: '2022.04.16', weight: 22));
    return list;
  }
}