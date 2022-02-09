import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:self_check/ui/login.dart';

import 'package:self_check/ui/ui_first.dart';
import 'package:self_check/ui/ui_second.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Self-Check',
      theme: ThemeData( primarySwatch: Colors.blue ),
      // home: MyHomePage(),
      initialRoute: 'd',
      routes: {
        'a' : (context) => MyHomePage(),
        'b' : (context) => Ui_first(),
        'c' : (context) => Ui_second(),
        'd' : (context) => Login()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Self-Check'),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          IconButton(
            icon:  Icon(Icons.search),
            onPressed: () {
              Navigator.pushNamed(context, 'b');
            },
          ),
        ],
      ),

      drawer: Drawer(
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
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: '아이디를 입력하세요.',
              ),
            ),
            TextField(
              style: TextStyle(
                fontStyle: FontStyle.italic
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: '비밀번호를 입력하세요.',
              ),
            )
          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

void flutterToast(String text) {
  Fluttertoast.showToast(msg: text,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.redAccent,
      fontSize: 20.0,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT);
}