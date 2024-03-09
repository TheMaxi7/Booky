import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data_manager.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class DashboardStatisticsTab extends StatefulWidget {
  const DashboardStatisticsTab({Key? key}) : super(key: key);

  @override
  State<DashboardStatisticsTab> createState() => _DashboardStatisticsTabTabState();
}

class _DashboardStatisticsTabTabState extends State<DashboardStatisticsTab> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataManager>(
      builder: (context, manager, child) {
        return ListView( // Use ListView for scrolling
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Average Rating"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RatingBar.builder(
                        itemSize: 30,
                        initialRating: 3.5,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                      const Expanded(
                        child: Text(
                          "20%",
                          textAlign: TextAlign.end,
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          "20%",
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                  const Text("Genres"),
                  PieChart(dataMap: dataMap),
                  const Text("Reading stats"),
                  SfSparkBarChart(
                    data: const <double>[2, 4, 6, 8, 10, 12, 14], // Sample data
                    color: Colors.green, // Bar color
                    borderColor: Colors.black, // Border color
                    borderWidth: 1, // Border width
                    axisLineColor: Colors.grey, // Axis line color
                    axisLineWidth: 2, // Axis line width
                    labelDisplayMode: SparkChartLabelDisplayMode.all,
                    labelStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}


Map<String, double> dataMap = {
  "Flutter": 5,
  "React": 3,
  "Xamarin": 2,
  "Ionic": 2,
};
