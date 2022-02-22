import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

final controller = Get.put(WeightController());

class WeightController extends GetxController {
  var isInput = false;
  final textController = TextEditingController();

  @override
  void onClose() {
    textController.dispose();
    super.dispose();
  }

  void setInput(bool value) {
    isInput = value;
    update();
  }

  String validator(String value) {
    if (value.isEmpty) {
      return 'Please this field must be filled';
    }
    return '';
  }
}

class First_weight extends StatelessWidget {
  const First_weight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WeightController>(
      init: WeightController(),
      builder: (controller) {
        return Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    color: controller.isInput ? Colors.blueAccent : Colors.white,
                    shape: RoundedRectangleBorder( borderRadius: BorderRadius.all(Radius.circular(5)) ),
                    child: Text(
                      '입력',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3
                      ),
                    ),
                    onPressed: () { controller.setInput(true); },
                  ),
                  MaterialButton(
                    color: controller.isInput ? Colors.white : Colors.blueAccent,
                    shape: RoundedRectangleBorder( borderRadius: BorderRadius.all(Radius.circular(5)) ),
                    child: Text(
                      '기록',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3
                      ),
                    ),
                    onPressed: () { controller.setInput(false); },
                  )
                ],
              ),

              SizedBox(height: 10),

              // 입력 or 기록 화면
              if (controller.isInput)
                Container(
                  padding: EdgeInsets.only(top: (MediaQuery.of(context).size.height / 5)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: 170,
                              child: TextFormField(
                                controller: controller.textController,
                                validator: (value) { controller.validator(value!); },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                    labelText: '몸무게',
                                    hintText: '55.5',
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(5)),
                                        borderSide: BorderSide(color: Colors.blue)
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(5)),
                                        borderSide: BorderSide(color: Colors.blue)
                                    )
                                ),
                              )
                          ),
                          SizedBox(width: 10),
                          Text( 'Kg',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaterialButton(
                              minWidth: 3,
                              color: Colors.blue,
                              child: Text(
                                '+',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                              onPressed: (){}
                          ),
                          MaterialButton(
                              minWidth: 3,
                              color: Colors.blue,
                              child: Text(
                                '-',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                              onPressed: (){}
                          ),
                          SizedBox(width: 50),
                          MaterialButton(
                              minWidth: 3,
                              color: Colors.blue,
                              child: Text(
                                '저장',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                              onPressed: (){}
                          )
                        ],
                      )
                    ],
                  ),
                )
              else
                Container(
                  color: Colors.blue,
                  height: 300,
                  width: 300,
                )
            ],
          ),
        );
      }
    );
  }
}