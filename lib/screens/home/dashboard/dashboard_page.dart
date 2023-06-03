import 'package:crm/constants/text_string.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../utility/widget/appbar.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int totalLeads = 0;
  int wonLeads = 0;
  int lostLeads = 0;

  @override
  void initState() {
    super.initState();
    fetchLeadsData();
  }

  void fetchLeadsData() async {
    final snapshot = await FirebaseFirestore.instance.collection('Lead').get();
    final leads = snapshot.docs;

    setState(() {
      totalLeads = leads.length;
      wonLeads = leads.where((lead) => lead.data()['Status'] == 'Won').length;
      lostLeads = leads.where((lead) => lead.data()['Status'] == 'Lost').length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      appBar: const AppBarWidget(
        title: jAppbarDashboardPageTitle,
        centerTitle: false,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text('Total Leads: $totalLeads'),
              // Text('Won Leads: $wonLeads'),
              // Text('Lost Leads: $lostLeads'),
              const SizedBox(height: 20),
              const Text(' Pie Chart:'),
              SizedBox(
                height: 300,
                child: SfCircularChart(
                  series: <CircularSeries>[
                    PieSeries<PieChartModel, String>(
                      dataSource: [
                        PieChartModel('Won', wonLeads, Colors.green),
                        PieChartModel('Lost', lostLeads, Colors.red),
                      ],
                      xValueMapper: (PieChartModel data, _) => data.status,
                      yValueMapper: (PieChartModel data, _) => data.count,
                      dataLabelSettings: const DataLabelSettings(
                        isVisible: true,
                        labelPosition: ChartDataLabelPosition.inside,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text('Bar Graph:'),
              SizedBox(
                height: 300,
                child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  series: <ChartSeries>[
                    ColumnSeries<BarChartModel, String>(
                      dataSource: [
                        BarChartModel('Won', wonLeads),
                        BarChartModel('Lost', lostLeads),
                      ],
                      xValueMapper: (BarChartModel data, _) => data.status,
                      yValueMapper: (BarChartModel data, _) => data.count,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text('Line Graph:'),
              SizedBox(
                height: 300,
                child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  primaryYAxis: NumericAxis(),
                  series: <ChartSeries>[
                    LineSeries<LineChartModel, String>(
                      dataSource: [
                        LineChartModel('Day 1', 0),
                        LineChartModel('Day 2', 5),
                        LineChartModel('Day 3', 3),
                        LineChartModel('Day 4', 7),
                        LineChartModel('Day 5', 2),
                        LineChartModel('Day 6', 4),
                        LineChartModel('Day 7', 6),
                        LineChartModel(
                            '', 0), // dummy data for better visualization
                      ],
                      xValueMapper: (LineChartModel data, _) => data.day,
                      yValueMapper: (LineChartModel data, _) => data.count,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PieChartModel {
  final String status;
  final int count;
  final Color color;

  PieChartModel(this.status, this.count, this.color);
}

class BarChartModel {
  final String status;
  final int count;

  BarChartModel(this.status, this.count);
}

class LineChartModel {
  final String day;
  final int count;

  LineChartModel(this.day, this.count);
}
