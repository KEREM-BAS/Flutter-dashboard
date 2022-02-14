// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:orhunproje/constants.dart';
import 'package:orhunproje/screens/components/header.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:async';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late List<LiveData> chartData;
  late ChartSeriesController _chartSeriesController;

  @override
  void initState() {
    chartData = getChartData();
    Timer.periodic(const Duration(milliseconds: 50), updateDataSource);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const Header(),
            const SizedBox(height: defaultPadding),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    height: 500,
                    color: bgColor,
                  ),
                ),
                const SizedBox(width: defaultPadding),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.all(defaultPadding),
                    height: 500,
                    decoration: const BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      children: [
                        const Text(
                          "Patient name",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        SfCartesianChart(
                          series: <LineSeries<LiveData, int>>[
                            LineSeries<LiveData, int>(
                              onRendererCreated:
                                  (ChartSeriesController controller) {
                                _chartSeriesController = controller;
                              },
                              dataSource: chartData,
                              color: blackcolor,
                              xValueMapper: (LiveData sales, _) => sales.time,
                              yValueMapper: (LiveData sales, _) => sales.speed,
                              width: 3,
                            ),
                          ],
                          primaryXAxis: NumericAxis(
                            majorGridLines: const MajorGridLines(width: 0),
                            edgeLabelPlacement: EdgeLabelPlacement.shift,
                            interval: 3,
                          ),
                          primaryYAxis: NumericAxis(
                            axisLine: const AxisLine(width: 0),
                            majorTickLines: const MajorTickLines(size: 0),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(defaultPadding),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2, color: blackcolor.withOpacity(0.15)),
                            borderRadius: const BorderRadius.all(
                                Radius.circular(defaultPadding)),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 30,
                                height: 30,
                                child: Image.asset("file.png"),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  List<int> number = [
    50,
    50,
    50,
    50,
    60,
    60,
    50,
    50,
    90,
    50,
    50,
    60,
    50,
    50,
    50,
    50,
    50
  ];

  int time = 19;
  int plus = 0;

  void updateDataSource(Timer timer) {
    if (plus == 17) {
      plus = 0;
    }
    chartData.add(
      LiveData(
        time++,
        number[plus++],
      ),
    );
    chartData.removeAt(0);
    _chartSeriesController.updateDataSource(
        addedDataIndex: chartData.length - 1, removedDataIndex: 0);
  }
}

List<LiveData> getChartData() {
  return <LiveData>[
    LiveData(0, 50),
    LiveData(1, 50),
    LiveData(2, 50),
    LiveData(3, 50),
    LiveData(4, 60),
    LiveData(5, 60),
    LiveData(6, 50),
    LiveData(7, 50),
    LiveData(8, 90),
    LiveData(9, 50),
    LiveData(10, 50),
    LiveData(11, 60),
    LiveData(12, 50),
    LiveData(13, 50),
    LiveData(14, 50),
    LiveData(15, 50),
    LiveData(16, 50),
    LiveData(17, 50),
    LiveData(18, 50)
  ];
}

class LiveData {
  LiveData(this.time, this.speed);
  final int time;
  final int speed;
}
