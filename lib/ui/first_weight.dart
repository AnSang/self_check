import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:self_check/controller/weight_controller.dart';

final controller = Get.put(WeightController());

class FirstWeight extends StatelessWidget {
  const FirstWeight({Key? key}) : super(key: key);

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
                  padding: EdgeInsets.only(top: (MediaQuery.of(context).size.height / 7)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: 170,
                              child: TextFormField(
                                style: TextStyle(
                                  package: controller.textController.text
                                ),
                                controller: controller.textController,
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
                                onChanged: (value) { controller.validator(value); },
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
                              onPressed: (){
                                double val = double.parse(controller.textController.text) + 0.1;
                                controller.textController.text = val.toStringAsFixed(1);
                              }
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
                              onPressed: (){
                                double val = double.parse(controller.textController.text);
                                if (val > 0) {
                                  controller.textController.text = (val - 0.1).toStringAsFixed(1);
                                }
                              }
                          ),
                          SizedBox(width: 50),
                          GestureDetector(
                              onTap: () {
                                controller.addItemData(
                                    DateFormat('yyyy.MM.dd').format(DateTime.now()),
                                    double.parse(controller.textController.text)
                                );
                              },
                            child: Text(
                              '저장',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            )
                          ),
                          /*MaterialButton(
                              minWidth: 3,
                              color: Colors.blue,
                              child: Text(
                                '저장',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                              onPressed: () {
                                controller.addItemData(
                                    DateFormat('yyyy.MM.dd').format(DateTime.now()),
                                    double.parse(controller.textController.text)
                                );
                              },
                          )*/
                        ],
                      )
                    ],
                  ),
                )
              /*else
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 500,
                      width: MediaQuery.of(context).size.width - 40,
                      color: Colors.blueAccent,
                      alignment: Alignment.center,
                      child: Text('item : $index'),
                    );
                  },
                )*/
            ],
          ),
        );
      }
    );
  }
}