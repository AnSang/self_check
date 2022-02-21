import 'package:flutter/material.dart';
import 'package:self_check/utils/color_util.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
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