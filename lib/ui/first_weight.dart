import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:self_check/controller/weight_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/weight.dart';

final controller = Get.put(WeightController());
const List<Color> gradientColors = [
  Color(0xff23b6e6),
  Color(0xff02d39a),
];

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
                                  style: TextStyle( package: controller.textController.text ),
                                  controller: controller.textController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.fromLTRB( 20, 0, 20, 0 ),
                                      labelText: '몸무게',
                                      hintText: '55.5',
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all( Radius.circular(5) ),
                                          borderSide: BorderSide( color: Colors.blue)
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all( Radius.circular(5) ),
                                          borderSide: BorderSide( color: Colors.blue )
                                      )
                                  ),
                                  onChanged: (value) {
                                    controller.validator(value);
                                  },
                                )
                            ),
                            SizedBox(width: 10),
                            Text('Kg',
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
                                onPressed: () {
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
                                onPressed: () {
                                  double val = double.parse(
                                      controller.textController.text);
                                  if (val > 0) {
                                    controller.textController.text =
                                        (val - 0.1).toStringAsFixed(1);
                                  }
                                }
                            ),
                            SizedBox(width: 50),
                            GestureDetector(
                                onTap: () {
                                  controller.addItemData(
                                      DateFormat('yyyy.MM.dd').format(
                                          DateTime.now()),
                                      double.parse(
                                          controller.textController.text)
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
                          ],
                        )
                      ],
                    ),
                  )
                else
                  Center(
                        child: Column(
                          children: [
                            SizedBox(height: 10),
                            Container(
                              padding: EdgeInsets.symmetric( vertical: 3, horizontal: 15 ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 15,
                                        spreadRadius: 2
                                    )
                                  ]
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(onPressed: () { controller.minMonth(); },
                                      icon: Icon(Icons.keyboard_arrow_left)),
                                  SizedBox(width: 10),
                                  Text( controller.getMonth() ),
                                  SizedBox(width: 10),
                                  IconButton(onPressed: () { controller.plusMonth(); },
                                      icon: Icon(Icons.keyboard_arrow_right))
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            setChart2()
                          ],
                        ),
                  )
              ],
            ),
          );
        }
    );
  }
}

Widget setChart2() {
  return SfCartesianChart(
    primaryXAxis: CategoryAxis(),
    legend: Legend(isVisible: false),                   // 우측에 선에 대한 설명 표시
      palette: gradientColors,
    tooltipBehavior: TooltipBehavior(
        enable: true,
      format: 'point.x 일 : point.y Kg'
    ),
    series: <ChartSeries<Weight, String>>[
      LineSeries<Weight, String>(
          dataSource: controller.monthItems,
          xValueMapper: (Weight row, _) => row.date.substring(8,10),
          yValueMapper: (Weight row, _) => row.weight,
          name: 'Weight',
          // Enable data label
          dataLabelSettings: DataLabelSettings(isVisible: true))
    ]
  );
}
