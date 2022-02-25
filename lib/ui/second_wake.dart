import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:analog_clock/analog_clock.dart';

import '../controller/wake_controller.dart';

final controller = Get.put(WakeController());

class SecondWake extends StatelessWidget {
  const SecondWake({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WakeController>(
        init: WakeController(),
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
                        color: controller.isInput ? Colors.blueAccent : Colors
                            .white,
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

                  if (controller.isInput)
                    Container(
                      padding: EdgeInsets.only(top: (MediaQuery.of(context).size.height / 7)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AnalogClock(
                                decoration: BoxDecoration(
                                    border: Border.all(width: 2, color: Colors.black),
                                    color: Colors.transparent,
                                    shape: BoxShape.circle
                                ),
                                secondHandColor: Colors.red,
                                width: 200,
                                height: 200,
                                hourHandColor: Colors.black,
                                minuteHandColor: Colors.black,
                                numberColor: Colors.black87,
                                textScaleFactor: 1.2,
                                datetime: DateTime.now(),
                                isLive: true,
                                showTicks: true,
                                showNumbers: true,
                                showAllNumbers: true,
                                showSecondHand: true,
                                showDigitalClock: true,
                              )
                            ],
                          ),
                          SizedBox(height: 30),
                          MaterialButton(
                              minWidth: 3,
                              color: Colors.blue,
                              child: Text(
                                '저장',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  letterSpacing: 10
                                ),
                              ),
                              onPressed: () {

                              }
                          )
                        ],
                      ),
                    )
                  else
                    Text('기상시간 기록 띄우기')
                ]
            ),
          );
        }
     );
  }
}
