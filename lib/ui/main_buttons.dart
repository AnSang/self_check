import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:self_check/controller/sreen_controller.dart';
import 'package:self_check/ui/bottom_userinfo.dart';
import 'package:self_check/ui/bottom_week.dart';
import 'package:self_check/ui/first_weight.dart';
import 'package:self_check/ui/second_wake.dart';

import 'package:get/get.dart';

BuildContext? _context;
final ScreenController controller = Get.put(ScreenController());
final List<Widget> buttonScreens = setScreens();
final List<Widget> bottomScreens = setBottom();

class MainButtons extends StatelessWidget {
  const MainButtons({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    _context = context;
    setScreens();
    setBottom();
      return GetBuilder<ScreenController>(
          init: ScreenController(),
          builder: (controller) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('안상'),
              ),
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.grey,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white.withOpacity(.40),
                selectedFontSize: 12,
                unselectedFontSize: 12,
                currentIndex: controller.showBottomIndex,
                onTap: (index) {
                  if (index == 0) {
                    controller.setScreen(index);
                    controller.setButtonView(true);
                  } else {
                    controller.setButtonView(false);
                  }
                  controller.setBottom(index);
                },
                items: [
                  BottomNavigationBarItem(label:'홈', icon: Icon(Icons.home)),
                  BottomNavigationBarItem(label:'주간 통계', icon: Icon(Icons.bar_chart)),
                  BottomNavigationBarItem(label:'내 정보', icon: Icon(Icons.account_circle_outlined)),
                ],
              ),
              body: controller.isButtonView ? // true : false
                buttonScreens[controller.showScreenIndex] : bottomScreens[controller.showBottomIndex]
            );
          });

  }
}

Widget setCenter(BuildContext context) {
  return Container(
    margin: EdgeInsets.all(10),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              setButton('몸무게'),
              setButton('기상시간'),
            ],
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              setButton('만보기'),
              setButton('담배 \n 하루 돈 사용량'),
            ],
          )
        ],
      ),
    ),
  );
}

Widget setButton(String btnName) {
  return MaterialButton(
      key: ValueKey(btnName),
      color: Colors.blue,
      elevation: 5,
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.all(Radius.circular(10)) ),
      minWidth: (MediaQuery.of(_context!).size.width - 40) / 2,
      height: 100,
      child: Text(
        btnName,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          letterSpacing: 3
        ),
      ),

      onPressed: () {
        if (btnName.contains('몸무게')){
          controller.setScreen(1);
        } else if (btnName.contains('기상시간')) {
          controller.setScreen(2);
        }
      }
  );
}

void flutterToast(String text) {
  Fluttertoast.showToast(msg: text,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.redAccent,
      fontSize: 20.0,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT);
}

List<Widget> setScreens() {
  List<Widget> list = [];
  list.add(setCenter(_context!));
  list.add(FirstWeight());
  list.add(SecondWake());
  return list;
}

List<Widget> setBottom() {
  List<Widget> list = [];
  list.add(setCenter(_context!));
  list.add(Bottom_Weather());
  list.add(Bottom_UserInfo());
  return list;
}