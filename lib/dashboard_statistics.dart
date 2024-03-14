import 'package:booky/book.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'data_manager.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pie_chart/pie_chart.dart';

class DashboardStatisticsTab extends StatefulWidget {
  const DashboardStatisticsTab({Key? key}) : super(key: key);

  @override
  State<DashboardStatisticsTab> createState() =>
      _DashboardStatisticsTabTabState();
}

class _DashboardStatisticsTabTabState extends State<DashboardStatisticsTab> {
  final DataManager manager = DataManager();

  @override
  Widget build(BuildContext context) {
    return Consumer<DataManager>(
      builder: (context, manager, child) {
        return ListView(
          // Use ListView for scrolling
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Average Rating",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RatingBar.builder(
                          itemSize: 30,
                          initialRating: averageRating(manager.myBooks),
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Color(0xFF141D29),
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Text(
                            "${averageRating(manager.myBooks)}/5",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Genres",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: PieChart(dataMap: convertMapToDouble(createMap(manager.myBooks))),
                  ),
                  Text(
                    "Reading stats",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SfCartesianChart(
                      primaryYAxis: const NumericAxis(
                        title: AxisTitle(
                          text: 'Books read',
                        ),
                      ),
                      primaryXAxis: const CategoryAxis(
                        title: AxisTitle(
                          text: 'Month',
                        ),
                      ),
                      series: <CartesianSeries>[
                        LineSeries<ChartData, String>(
                            dataSource: [
                              ChartData('Jan', 1, Colors.red),
                              ChartData('Feb', 2, Colors.green),
                              ChartData('Mar', 2, Colors.blue),
                              ChartData('Apr', 1, Colors.pink),
                              ChartData('May', 0, Colors.black),
                              ChartData('Jun', 2, Colors.cyan),
                              ChartData('Jul', 1, Colors.purple),
                            ],
                            pointColorMapper:(ChartData data, _) => data.color,
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y
                        )
                      ]
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  double averageRating(List<Book> myBooks) {
    double avgRating = 0.0;
    double sum = 0.0;
    for (int i = 0; i < myBooks.length; i++) {
      sum += myBooks[i].myRating;
    }
    avgRating = sum / myBooks.length;
    return double.parse(avgRating.toStringAsFixed(1));
  }

}
class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}

Map<String, int> createMap(List<Book> myBooks) {
  Map<String, int> genreCounts = {};
  for (var book in myBooks) {
    if (genreCounts.containsKey(book.genre)) {
      genreCounts[book.genre] = genreCounts[book.genre]! + 1;
    } else {
      genreCounts[book.genre] = 1;
    }
  }
  return genreCounts;
}

Map<String, double> convertMapToDouble(Map<String, int> map) {
  Map<String, double> result = {};
  map.forEach((key, value) {
    result[key] = value.toDouble();
  });
  return result;
}


