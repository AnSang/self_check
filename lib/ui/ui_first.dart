import 'package:flutter/material.dart';

class Ui_first extends StatelessWidget {
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