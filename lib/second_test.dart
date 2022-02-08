import 'package:flutter/material.dart';

class Second_test extends StatelessWidget {
  const Second_test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Row(
        children: [
          IconButton(onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.shopping_cart)
          )
        ],
      ),
    );
  }
}