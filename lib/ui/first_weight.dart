import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:self_check/controller/weight_controller.dart';

final controller = Get.put(WeightController());
const List<Color> gradientColors = [
  Color(0xff23b6e6),
  // Color(0xff02d39a),
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
                        setChart()
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

LineChart setChart() {
  return LineChart( // Chart
      LineChartData(
          minX: 1,
          maxX: 31,
          minY: 50,
          maxY: 80,
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                  color: Colors.black,
                  strokeWidth: 1,
              );
            },
          ),
          titlesData: FlTitlesData(       // 타이틀들 설정
              show: true,
              bottomTitles: SideTitles(   // 하단 타이틀 설정
                  showTitles: true,
                  textStyle: titleStyle(),
                  getTitles: (value) {    //
                    if (value % 5 == 0) {
                      return value.toString();
                    } else {
                      return '';
                    }
                  }
              ),

              leftTitles: SideTitles( // 왼쪽 타이틀 설정
                showTitles: true,
                textStyle: titleStyle(),
                getTitles: (value) {
                  switch (value.toInt()) {
                    case 1:
                      return '20Kg';
                    case 2:
                      return '40Kg';
                    case 3:
                      return '60Kg';
                    case 4:
                      return '80Kg';
                  }
                  return '';
                },
              )
          ),

          borderData: FlBorderData( // 테두리 지정
            show: true,
            border: Border.all(color: Colors.black, width: 1),
          ),

          lineBarsData: [ // 입력될 데이터
            LineChartBarData(
              spots: controller.getSpots(), // 한사이클 7개,
              isCurved: true,
              colors: gradientColors,
              barWidth: 3,
              isStrokeCapRound: true,
              dotData: FlDotData( show: true ),
              belowBarData: BarAreaData(
                show: true,
                colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
              ),
            )
          ]
      )
  );
}

TextStyle titleStyle() {    // Chart Title TextStyle
  return const TextStyle(
      color: Colors.blueAccent,
      fontWeight: FontWeight.bold,
      fontSize: 15
  );
}

/*
void getMonthData() {

  controller.items
}*/
