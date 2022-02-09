import 'package:flutter/material.dart';
import 'package:self_check/main.dart';;

class Login extends StatefulWidget {
  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {

  TextEditingController id_contr = TextEditingController();
  TextEditingController pw_contr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('로그인'),
        backgroundColor: Colors.blue,
        centerTitle: true
      ),

      body: GestureDetector(
        onTap: () { FocusScope.of(context).unfocus(); },  // 바깥쪽 화면 터치시 Focus 해제 -> Keyboard 사라짐
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 50)),
              Center(
                child: Image(
                  image: AssetImage('assets/flower.png'),
                  width: 170.0,
                  height: 190.0,
                ),
              ),
              Form(
                  child: Theme(
                    data: ThemeData(
                      primaryColor: Colors.teal,
                      inputDecorationTheme: InputDecorationTheme(
                        labelStyle: TextStyle(
                          color: Colors.teal,
                          fontSize: 15
                        )
                      )
                    ),
                    child: Container(
                      padding: EdgeInsets.all(40.0),
                      child: Column(
                        children: [
                          TextField(
                            controller: id_contr,
                            decoration: InputDecoration( labelText: 'Enter dice'),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          TextField(
                            controller: pw_contr,
                            decoration: InputDecoration( labelText: 'Enter dice'),
                            keyboardType: TextInputType.emailAddress,
                            obscureText: true,
                          ),
                          SizedBox(height: 40),
                          ButtonTheme(
                            minWidth: 100,
                            height: 50,
                            child: RaisedButton(
                              color: Colors.orangeAccent,
                              onPressed: () { login(context); },
                              child: Icon(
                                  Icons.arrow_forward,
                                color: Colors.white,
                                size: 35,
                              ),
                            )
                          )
                        ],
                      ),
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }

  void login(BuildContext context) {
    // 웹서비스에서 로그인 정보 확인후 결과 값으로 표출
    if(id_contr.text != 'aaa' && pw_contr.text != 'bbb') {
    } else if (id_contr.text != 'aaa') {
      flutterToast('아이디가 맞지 않습니다.');
    } else if (pw_contr.text != 'bbb') {
      flutterToast('비밀번호가 맞지 않습니다.');
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> MyHomePage()));
      flutterToast('정상적으로 로그인 되었습니다.');
    }
  }
}