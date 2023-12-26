import 'package:doctor_appointment/components/custom_App_bar.dart';
import 'package:doctor_appointment/providers/doctors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myDoctorRateProvider = Provider.of<doctors>(context);
    return Scaffold(
      appBar: CustomAppbar(
        appTitle: 'Dashboard',
        icon: FaIcon(
          Icons.arrow_back_ios,
        ),
      ),
      body: Consumer<doctors>(
        builder: (context, doc, index) {
          return SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height*0.97,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  KPIWidget(
                    title: 'Minimum Rating for doctors ',
                    value: myDoctorRateProvider.getMinRating(),
                  ),
                  KPIWidget(
                    title: 'Maximum Rating for doctors',
                    value: myDoctorRateProvider.getMaxRating(),
                  ),
                   KPIWidget(
                    title: 'Average Rating for doctors',
                    value: myDoctorRateProvider.getAverageRating(),
                  ),
                  SizedBox(height: 10),
                      
                  Expanded(
                    child: DonutChartWidget(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class KPIWidget extends StatelessWidget {
  final String title;
  final double value;

  const KPIWidget({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            value.toString(),
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}

class DonutChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('Intermediate', 30, Colors.blue),
      ChartData('high', 40, Colors.green),
      ChartData('low', 20, Colors.orange),
      ChartData('Not specify', 10, Colors.red),
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Reviews charts",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SfCircularChart(
            legend: const Legend(
              isVisible: true,
              borderColor: Colors.black,
              borderWidth: 2,
            ),
            series: <CircularSeries>[
              DoughnutSeries<ChartData, String>(
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.label,
                  yValueMapper: (ChartData data, _) => data.value,
                  pointColorMapper: (ChartData data, _) => data.color,
                  dataLabelSettings: DataLabelSettings(
                    isVisible: true,
                  ),
                  explode: true),
            ],
          ),
        ],
      ),
    );
  }
}

class ChartData {
  final String label;
  final int value;
  final Color color;

  ChartData(this.label, this.value, this.color);
}
