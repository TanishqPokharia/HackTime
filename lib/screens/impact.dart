import 'package:flutter/material.dart';
import 'package:hack_time/extensions.dart';
import 'package:hack_time/screens/home.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class ImpactScreen extends ConsumerWidget {
  const ImpactScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Card(
            child: Padding(padding: EdgeInsets.all(20.rs),child: Column(
              children: [
                Text("Carbon Footprint Reduction",style: context.textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold
                ),),
                Container(
                    height: 500.rs,
                    width: 500.rs,
                    child: RadialBarChart())
                
              ],
            ),),
          ),
          Padding(
            padding: EdgeInsets.all(20.rs),
            child: const FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SavingsCard(icon: Icon(Icons.energy_savings_leaf_outlined,color: Colors.green,), title: "Carbon Saved", value: "250 kg"),
                  SavingsCard(icon: Icon(Icons.air_outlined,color: Colors.blue,), title: "Air Quality Improved", value: "15%")
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


class RadialBarChart extends StatefulWidget {
  const RadialBarChart({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RadialBarChartState();
  }
}

class _RadialBarChartState extends State<RadialBarChart> {
  late List<ChartData> _chartData;

  @override
  void initState() {
    _chartData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
      Center(
        child: SfCircularChart(
          legend: Legend(isVisible: true,isResponsive: true),
          series: <RadialBarSeries>[
            RadialBarSeries<ChartData, String>(
              radius: "90%",
              cornerStyle: CornerStyle.bothCurve,
              dataSource: _chartData,
              xValueMapper: (ChartData data, _) => data.day,
              yValueMapper: (ChartData data, _) => data.value,
              dataLabelSettings: DataLabelSettings(isVisible: true,borderRadius: 20.rs,labelPosition: ChartDataLabelPosition.outside),
              maximumValue: 100, // Maximum value for the radial bars
            ),
          ],
        ),
    );
  }

  // Data for Monday to Sunday with values between 50 and 100
  List<ChartData> getChartData() {
    return [
      ChartData('Monday', 85),
      ChartData('Tuesday', 72),
      ChartData('Wednesday', 90),
      ChartData('Thursday', 65),
      ChartData('Friday', 75),
      ChartData('Saturday', 92),
      ChartData('Sunday', 80),
    ];
  }
}

// Data model for the chart
class ChartData {
  final String day;
  final double value;

  ChartData(this.day, this.value);
}
