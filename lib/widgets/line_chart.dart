import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';


class LineChartReport extends StatelessWidget {
  final Map historyData;
  final String title;


  LineChartReport({this.historyData,this.title});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(aspectRatio: 2.2,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false,),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots:getSpots(),
              isCurved: true,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
              colors: [Color(0xff0d8e53)],
              barWidth: 4,
            ),

          ]
        )
      ),
    );
  }


  List<FlSpot>getSpots()
  {

    if(this.historyData==null)

    return [
      FlSpot(0, .5),
      FlSpot(1, 1.15),
      FlSpot(2, .5),
      FlSpot(3, .7),
      FlSpot(4, .2),
      FlSpot(5, 2),
      FlSpot(6, 1.5),
      FlSpot(7, 1.7),
      FlSpot(8, 1),
      FlSpot(9, 2.8),
      FlSpot(10, 2.5),
      FlSpot(11, 2.65),
    ];
    else
      {

        List<FlSpot> list =List<FlSpot>();

        var map=Map<String,dynamic>.from(historyData[getName()]);

        int i = 0;
        for(int item in map.values)
          {

            list.add(FlSpot(i.toDouble(), item.toDouble()));
            i++;
          }
        return list;
      }

  }

  String getName()
  {
    switch(this.title)
    {
      case'Confirmed':
        return 'cases';
        break;

      case'Recovered':
        return'recovered';
        break;

        case'Death':
        return'deaths';
        break;

      default:
        return'';
    }

  }

}


