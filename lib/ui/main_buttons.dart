import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:self_check/ui/first_weight.dart';
import 'package:self_check/ui/second_wake.dart';

import 'package:get/get.dart';

final ScreenController controller = Get.put(ScreenController());
late final BuildContext _context;
final List<Widget> screens = setScreens();

class ScreenController extends GetxController {
  var showScreenIndex = 0;

  void setScreen(int index) {
    showScreenIndex = index;
    update();
  }
}

class MainButtons extends StatefulWidget {
  const MainButtons({Key? key}) : super(key: key);

  @override
  State<MainButtons> createState() => MainButtonsState();
}

class MainButtonsState extends State<MainButtons> {

  @override
  Widget build(BuildContext context) {
    _context = context;
    setScreens();
    return Scaffold(
      appBar: AppBar(
        title: Text('Self-Check'),
        centerTitle: true,
        elevation: 0.0,
      ),

      drawer: setDrawer(),

      body: screens[controller.showScreenIndex],
    );
  }
}

Drawer setDrawer() {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          accountName: Text('accosuntName'),
          accountEmail: Text('accountEmail'),
          onDetailsPressed: () { flutterToast('Toast Test'); },
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0)
              )
          ),
        ),
        ListTile(
          leading: Icon(
              Icons.home,
              color: Colors.blue[800]
          ),
          title: Text('Home'),
          onTap: () {
            print('Home Tap');
          },
          trailing: Icon(Icons.add),
        ),
        ListTile(
          leading: Icon(
              Icons.home,
              color: Colors.blue[800]
          ),
          title: Text('Home'),
          onTap: () {
            print('Home Tap');
          },
          trailing: Icon(Icons.add),
        ),
        ListTile(
          leading: Icon(
              Icons.home,
              color: Colors.blue[800]
          ),
          title: Text('Home'),
          onTap: () {
            print('Home Tap');
          },
          trailing: Icon(Icons.add),
        ),
      ],
    ),
  );
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
              setButton('aaaa'),
              setButton('bbbb'),
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
      minWidth: (MediaQuery.of(_context).size.width - 40) / 2,
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
  list.add(setCenter(_context));
  list.add(First_weight());
  list.add(Second_wake());
  return list;
}