import 'package:flutter/material.dart';
import 'package:get/get.dart';

class First_weight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          ToggleButtons(
              children: [
                Text('입력'),
                Text('출력'),
              ],
              onPressed: (int index) {
                setState() {

                }
              },
              isSelected: [true,false]
          )
        ],
      ),
    );
  }
}