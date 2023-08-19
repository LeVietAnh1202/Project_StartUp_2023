import 'package:app_startup/presentation/resources/app_resources.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartSample5 extends StatefulWidget {
  const LineChartSample5({
    super.key,
    Color? gradientColor1,
    Color? gradientColor2,
    Color? gradientColor3,
    Color? indicatorStrokeColor,
  })  : gradientColor1 = gradientColor1 ?? AppColors.contentColorBlue,
        gradientColor2 = gradientColor2 ?? AppColors.contentColorPink,
        gradientColor3 = gradientColor3 ?? AppColors.contentColorRed,
        indicatorStrokeColor = indicatorStrokeColor ?? AppColors.mainTextColor1;

  final Color gradientColor1;
  final Color gradientColor2;
  final Color gradientColor3;
  final Color indicatorStrokeColor;

  @override
  State<LineChartSample5> createState() => _LineChartSample5State();
}

class _LineChartSample5State extends State<LineChartSample5> {
  // List<int> showingTooltipOnSpots = [1, 2, 3, 5];
  List<int> showingTooltipOnSpots = [];

  List<FlSpot> get allSpots => const [
        FlSpot(0, 100),
        FlSpot(1, 100),
        FlSpot(2, 90),
        FlSpot(3, 80),
        FlSpot(4, 70),
        FlSpot(5, 60),
        FlSpot(6, 50),
        FlSpot(7, 40),
        FlSpot(8, 45),
        FlSpot(9, 60),
        FlSpot(10, 70),
        FlSpot(11, 75),
        FlSpot(12, 80),
        FlSpot(13, 85),
        FlSpot(14, 90),
        FlSpot(15, 95),
        FlSpot(16, 100),
        FlSpot(17, 105),
        FlSpot(18, 110),
        FlSpot(19, 120),
        FlSpot(20, 130),
        FlSpot(21, 140),
        FlSpot(22, 120),
        FlSpot(23, 110),
        FlSpot(24, 100),
      ];

  Widget bottomTitleWidgets(double value, TitleMeta meta, double chartWidth) {
    final style = TextStyle(
      fontWeight: FontWeight.bold,
      color: AppColors.contentColorPink,
      fontFamily: 'Digital',
      fontSize: 18 * chartWidth / 500,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0';
        break;
      // case 1:
      //   text = '1';
      //   break;
      case 2:
        text = '2';
        break;
      // case 3:
      //   text = '3';
      //   break;
      case 4:
        text = '4';
        break;
      // case 5:
      //   text = '5';
      //   break;
      case 6:
        text = '6';
        break;
      // case 7:
      //   text = '7';
      //   break;
      case 8:
        text = '8';
        break;
      // case 9:
      //   text = '9';
      //   break;
      case 10:
        text = '10';
        break;
      // case 11:
      //   text = '11';
      //   break;
      case 12:
        text = '12';
        break;
      // case 13:
      //   text = '13';
      //   break;
      case 14:
        text = '14';
        break;
      // case 15:
      //   text = '15';
      //   break;
      case 16:
        text = '16';
        break;
      // case 17:
      //   text = '17';
      //   break;
      case 18:
        text = '18';
        break;
      // case 19:
      //   text = '19';
      //   break;
      case 20:
        text = '20';
        break;
      // case 21:
      //   text = '21';
      //   break;
      case 22:
        text = '22';
        break;
      // case 23:
      //   text = '23';
      //   break;
      case 24:
        text = '0';
        break;

      default:
        return Container();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 10);

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        '$value',
        style: style,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final lineBarsData = [
      LineChartBarData(
        showingIndicators: showingTooltipOnSpots,
        spots: allSpots,
        isCurved: true,
        barWidth: 4,
        shadow: const Shadow(
          blurRadius: 8,
        ),
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            colors: [
              widget.gradientColor1.withOpacity(0.4),
              widget.gradientColor2.withOpacity(0.4),
              widget.gradientColor3.withOpacity(0.4),
            ],
          ),
        ),
        dotData: const FlDotData(show: false),
        gradient: LinearGradient(
          colors: [
            widget.gradientColor1,
            widget.gradientColor2,
            widget.gradientColor3,
          ],
          stops: const [0.1, 0.4, 0.9],
        ),
      ),
    ];

    final tooltipsOnBar = lineBarsData[0];

    return AspectRatio(
      aspectRatio: 1, // tỷ lệ khung hình (2.5)
      child: Padding(
        // padding: const EdgeInsets.symmetric(
        //   horizontal: 20,
        //   vertical: 20,
        // ),
        padding: EdgeInsets.only(bottom: 10, top: 30.0, right: 20.0),
        child: LayoutBuilder(builder: (context, constraints) {
          return LineChart(
            LineChartData(
              showingTooltipIndicators: showingTooltipOnSpots.map((index) {
                return ShowingTooltipIndicators([
                  LineBarSpot(
                    tooltipsOnBar,
                    lineBarsData.indexOf(tooltipsOnBar),
                    tooltipsOnBar.spots[index],
                  ),
                ]);
              }).toList(),
              lineTouchData: LineTouchData(
                enabled: true,
                handleBuiltInTouches: false,
                touchCallback:
                    (FlTouchEvent event, LineTouchResponse? response) {
                  if (response == null || response.lineBarSpots == null) {
                    return;
                  }
                  if (event is FlTapUpEvent) {
                    final spotIndex = response.lineBarSpots!.first.spotIndex;
                    setState(() {
                      if (showingTooltipOnSpots.contains(spotIndex)) {
                        showingTooltipOnSpots.remove(spotIndex);
                      } else {
                        showingTooltipOnSpots.add(spotIndex);
                      }
                    });
                  }
                },
                mouseCursorResolver:
                    (FlTouchEvent event, LineTouchResponse? response) {
                  if (response == null || response.lineBarSpots == null) {
                    return SystemMouseCursors.basic;
                  }
                  return SystemMouseCursors.click;
                },
                getTouchedSpotIndicator:
                    (LineChartBarData barData, List<int> spotIndexes) {
                  return spotIndexes.map((index) {
                    return TouchedSpotIndicatorData(
                      const FlLine(
                        color: Colors.pink,
                      ),
                      FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) =>
                            FlDotCirclePainter(
                          radius: 8,
                          color: lerpGradient(
                            barData.gradient!.colors,
                            barData.gradient!.stops!,
                            percent / 100,
                          ),
                          strokeWidth: 2,
                          strokeColor: widget.indicatorStrokeColor,
                        ),
                      ),
                    );
                  }).toList();
                },
                touchTooltipData: LineTouchTooltipData(
                  tooltipBgColor: Colors.pink,
                  tooltipRoundedRadius: 8,
                  getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
                    return lineBarsSpot.map((lineBarSpot) {
                      return LineTooltipItem(
                        lineBarSpot.y.toString(),
                        const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }).toList();
                  },
                ),
              ),
              lineBarsData: lineBarsData,
              minY: 0,
              titlesData: FlTitlesData(
                leftTitles: const AxisTitles(
                  axisNameWidget: Text('kWh'),
                  axisNameSize: 24,
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 35,
                  ),
                ),
                // leftTitles: const AxisTitles(
                //     sideTitles: SideTitles(reservedSize: 44, showTitles: true)),
                // leftTitles: AxisTitles(
                //   sideTitles: SideTitles(
                //     showTitles: true,
                //     interval: 1,
                //     // getTitlesWidget: (value, meta) {
                //     //   return bottomTitleWidgets(
                //     //     value,
                //     //     meta,
                //     //     constraints.maxWidth,
                //     //   );
                //     // },
                //     getTitlesWidget: leftTitleWidgets,
                //     reservedSize: 30,
                //   ),
                // ),
                bottomTitles: AxisTitles(
                  axisNameWidget: const Text('Time'),
                  axisNameSize: 24,
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      return bottomTitleWidgets(
                        value,
                        meta,
                        constraints.maxWidth,
                      );
                    },
                    reservedSize: 30,
                  ),
                ),
                rightTitles: const AxisTitles(
                  // axisNameWidget: Text('count'),
                  // sideTitles: SideTitles(
                  //   showTitles: false,
                  //   reservedSize: 0,
                  // ),
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: const AxisTitles(
                  // axisNameWidget: Text(
                  //   'Wall clock',
                  //   textAlign: TextAlign.left,
                  // ),
                  axisNameSize: 24,
                  sideTitles: SideTitles(
                    showTitles: false,
                    reservedSize: 0,
                  ),
                ),
              ),
              gridData: const FlGridData(show: false),
              borderData: FlBorderData(
                show: true,
                border: const Border(
                    left: BorderSide(color: AppColors.borderColor),
                    bottom: BorderSide(color: AppColors.borderColor),),
              ),
            ),
          );
        }),
      ),
    );
  }
}

// /// Lerps between a [LinearGradient] colors, based on [t]
// Color lerpGradient(List<Color> colors, List<double> stops, double t) {
//   if (colors.isEmpty) {
//     throw ArgumentError('"colors" is empty.');
//   } else if (colors.length == 1) {
//     return colors[0];
//   }

//   if (stops.length != colors.length) {
//     stops = [];

//     /// provided gradientColorStops is invalid and we calculate it here
//     colors.asMap().forEach((index, color) {
//       final percent = 1.0 / (colors.length - 1);
//       stops.add(percent * index);
//     });
//   }

//   for (var s = 0; s < stops.length - 1; s++) {
//     final leftStop = stops[s];
//     final rightStop = stops[s + 1];
//     final leftColor = colors[s];
//     final rightColor = colors[s + 1];
//     if (t <= leftStop) {
//       return leftColor;
//     } else if (t < rightStop) {
//       final sectionT = (t - leftStop) / (rightStop - leftStop);
//       return Color.lerp(leftColor, rightColor, sectionT)!;
//     }
//   }
//   return colors.last;
// }

/// Lerps between a vertical [LinearGradient] colors, based on [t]
Color lerpGradient(List<Color> colors, List<double> stops, double t) {
  if (colors.isEmpty) {
    throw ArgumentError('"colors" is empty.');
  } else if (colors.length == 1) {
    return colors[0];
  }

  if (stops.length != colors.length) {
    stops = [];

    /// provided gradientColorStops is invalid and we calculate it here
    colors.asMap().forEach((index, color) {
      final percent = 1.0 / (colors.length - 1);
      stops.add(percent * index);
    });
  }

  for (var s = 0; s < stops.length - 1; s++) {
    final topStop = stops[s];
    final bottomStop = stops[s + 1];
    final topColor = colors[s];
    final bottomColor = colors[s + 1];
    if (t <= topStop) {
      return topColor;
    } else if (t < bottomStop) {
      final sectionT = (t - topStop) / (bottomStop - topStop);
      return Color.lerp(topColor, bottomColor, sectionT)!;
    }
  }
  return colors.last;
}
