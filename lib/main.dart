import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:self_check/ui/main_buttons.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: 'AIzaSyD-Dpy17_SACuLjQFyMrU8HHC5yT4qaZak',
        appId: 'com.example.self_check_web',  // com.example.self_check <- 로 지정하면 Android App Name과 같아서 에러 나타남
        projectId: 'self-check-952f6',
        messagingSenderId: 'Sender_Ansang'
    )
        //Todo : messagingSenderId 의 기능 파악하기
  );

  final SharedPreferences pref = await SharedPreferences.getInstance();
  // KakaoContext.clientId = '791630015f9f2b0c5852135052434fee';
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Self-Check',
      theme: ThemeData( primarySwatch: Colors.blue ),
      home: MainButtons(),
      /*initialRoute: 'c',
      routes: {
        'a' : (context) => MyHomePage(),
        'b' : (context) => Ui_first(),
        'c' : (context) => LoginSignupScreen()
      },*/
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