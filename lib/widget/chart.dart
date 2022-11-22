import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ph_check/util/style.dart';

class Chart extends StatefulWidget {
  const Chart({super.key});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  bool showAvg = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.5,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: LineChart(
              showAvg ? monthData() : weekData(),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomWeekTitleWidgets(double value, TitleMeta meta) {
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = Text('S', style: normalTextStyle);
        break;
      case 2:
        text = Text('S', style: normalTextStyle);
        break;
      case 3:
        text = Text('R', style: normalTextStyle);
        break;
      case 4:
        text = Text('K', style: normalTextStyle);
        break;
      case 5:
        text = Text('J', style: normalTextStyle);
        break;
      case 6:
        text = Text('S', style: normalTextStyle);
        break;
      case 7:
        text = Text('M', style: normalTextStyle);
        break;
      default:
        text = Text('', style: normalTextStyle);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget bottomMonthTitleWidgets(double value, TitleMeta meta) {
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = Text('1', style: normalTextStyle);
        break;
      case 3:
        text = Text('3', style: normalTextStyle);
        break;
      case 6:
        text = Text('6', style: normalTextStyle);
        break;
      case 9:
        text = Text('9', style: normalTextStyle);
        break;
      case 12:
        text = Text('12', style: normalTextStyle);
        break;
      case 15:
        text = Text('15', style: normalTextStyle);
        break;
      case 18:
        text = Text('18', style: normalTextStyle);
        break;
      case 21:
        text = Text('21', style: normalTextStyle);
        break;
      case 24:
        text = Text('24', style: normalTextStyle);
        break;
      case 27:
        text = Text('27', style: normalTextStyle);
        break;
      case 30:
        text = Text('30', style: normalTextStyle);
        break;
      default:
        text = Text('', style: normalTextStyle);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0';
        break;
      case 7:
        text = '7';
        break;
      case 14:
        text = '14';
        break;
      default:
        return Container();
    }

    return Text(text, style: normalTextStyle, textAlign: TextAlign.left);
  }

  LineChartData weekData() {
    return LineChartData(
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomWeekTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 20,
          ),
        ),
      ),
      minX: 1,
      maxX: 7,
      minY: 0,
      maxY: 14,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(1, 7),
            FlSpot(2, 8),
            FlSpot(3, 7),
            FlSpot(4, 7),
            FlSpot(5, 6),
            FlSpot(6, 5),
            FlSpot(7, 6),
          ],
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          dotData: FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData monthData() {
    return LineChartData(
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomMonthTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 20,
          ),
        ),
      ),
      minX: 1,
      maxX: 30,
      minY: 0,
      maxY: 14,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(1, 7),
            FlSpot(3, 8),
            FlSpot(6, 7),
            FlSpot(9, 7),
            FlSpot(12, 6),
            FlSpot(15, 5),
            FlSpot(18, 7),
            FlSpot(21, 8),
            FlSpot(24, 8),
            FlSpot(27, 9),
            FlSpot(30, 7),
          ],
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          dotData: FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
