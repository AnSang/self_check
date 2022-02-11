import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:self_check/main.dart';
import 'package:self_check/utils/color_util.dart';
import 'package:self_check/utils/textStyle.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  // TextEditingController id_contr = TextEditingController();
  // TextEditingController pw_contr = TextEditingController();

  bool isLoginScreen = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('로그인'),
            backgroundColor: Colors.blue,
            centerTitle: true
        ),
      body: LoginBody(),
    );
  }

  Stack LoginBody() => Stack(
      children: [
        Positioned(
            child: Container(color: Colors.teal)
        ),
        Positioned(
          top: 60,
          child: Container(
            padding: EdgeInsets.all(15),
            height: MediaQuery.of(context).size.height - 210,   // Device Size 가져오기
            width: MediaQuery.of(context).size.width - 40,      // Device Size 가져오기
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30, ), // 좌우 20, 상하 30 Margin
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 15,
                  spreadRadius: 5
                )
              ]
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                            isLoginScreen = true;
                        });
                      },
                      child: Column(
                        children: [
                          Text(
                            'LOGIN',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: isLoginScreen ? Color_Util.activeColor : Color_Util.textColor1
                            ),
                          ),
                          // if(isLoginScreen)
                          Container(
                            margin: EdgeInsets.only(top: 3),
                            height: 2,
                            width: 55,
                            color: isLoginScreen ? Colors.orange : Colors.white
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                            isLoginScreen = false;
                        });
                      },
                      child: Column(
                        children: [
                          Text(
                            'SIGN UP',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: isLoginScreen ? Color_Util.textColor1 : Color_Util.activeColor
                            ),
                          ),
                          // if(!isLoginScreen)
                          Container(
                            margin: EdgeInsets.only(top: 3),
                            height: 2,
                            width: 55,
                            color: isLoginScreen ? Colors.white : Colors.orange
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                    child: Form(
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.account_circle),
                                iconColor: Color_Util.iconColor,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color_Util.textColor1
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(35))
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color_Util.textColor1
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(35))
                                ),
                                hintText: 'User email',
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: Color_Util.textColor1
                                ),
                                contentPadding: EdgeInsets.all(10)
                            ),
                          ),
                          SizedBox(height: 8),
                          TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.account_circle),
                                iconColor: Color_Util.iconColor,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color_Util.textColor1
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(35))
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color_Util.textColor1
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(35))
                                ),
                                hintText: 'User email',
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: Color_Util.textColor1
                                ),
                                contentPadding: EdgeInsets.all(10)
                            ),
                          ),
                          SizedBox(height: 8),
                          TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.account_circle),
                                iconColor: Color_Util.iconColor,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color_Util.textColor1
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(35))
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color_Util.textColor1
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(35))
                                ),
                                hintText: 'User email',
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: Color_Util.textColor1
                                ),
                                contentPadding: EdgeInsets.all(10)
                            ),
                          )
                        ],
                      ),
                    )
                )


              ],
            ),
          ),
        ),
        Positioned(
          top: 200,
          right: 0,
          left: 0,
          child: Center(
            child: Container(
              padding: EdgeInsets.all(15),
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50)
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.orange,
                        Colors.red
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight
                    ),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0,1)
                      )
                    ]
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white
                  ),
                ),
              ),
          )
        ),
      ],
    );

  GestureDetector body_ui_Button(String buttonName) => GestureDetector(
    onTap: () {
      setState(() {
        if (buttonName == 'LOGIN') {
          isLoginScreen = true;
        } else {
          isLoginScreen = false;
        }
      });
    },
    child: Column(
      children: [
        Text(
          buttonName,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isLoginScreen ? Color_Util.activeColor : Color_Util.textColor1
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 3),
          height: 2,
          width: 55,
          color: isLoginScreen ? Colors.orange : Colors.black,
        )
      ],
    ),
  );
}

/*class LoginState extends State<Login> {
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
                        labelStyle: TextStyle_Util.s_20_blue
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
                              onPressed: () { login_kakao(); },
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
  
  Future<void> login_kakao() async {
    String authCode = await AuthCodeClient.instance.request();
    print(authCode);
  }
}*/