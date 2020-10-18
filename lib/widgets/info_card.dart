import 'package:covid19trackerv2/Localizations/localization_methods.dart';
import 'package:covid19trackerv2/widgets/line_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoCard extends StatelessWidget {

  final String title;

  final String effectedNumber;
  final Color iconColor;
  final Function function;
  final Color  cardColor;
  final historyData;

  InfoCard({this.title, this.effectedNumber, this.iconColor, this.function,this.cardColor,this.historyData});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context,constrains)
    {
      return Container(

        
        margin: EdgeInsets.all(5),
        child: GestureDetector(
          onTap: function,
          child: Container(

            width: MediaQuery.of(context).size.width/2-10,
            decoration: BoxDecoration(
                color: cardColor,
              borderRadius: BorderRadius.circular(8)
            ),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: iconColor.withOpacity(.12),
                            shape: BoxShape.circle
                          ),

                          child: SvgPicture.asset('assests/pictures/running.svg',
                          height: 12,
                            width: 12,
                            color: iconColor,
                          )
                        ),


                        Text(getTranslated(context,title),
                          maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),

                      ],
                    ),
                  ),

                  Padding(padding: EdgeInsets.only(bottom: 5),
                  child: Row(
                    children: <Widget>[

                      Padding(padding: EdgeInsets.all(5),
                      child:RichText(text: TextSpan(
                        style: TextStyle(
                          color: Color(0xff1e2432)
                        ),
                        children: [
                          TextSpan(
                            text: '$effectedNumber \n',
                            style: Theme.of(context).textTheme.headline.copyWith(
                              fontWeight: FontWeight.bold
                            )
                          ),

                          TextSpan(
                            text: getTranslated(context,'People'),
                            style: TextStyle(
                              fontSize: 10,
                              height: 2
                            )
                          )

                        ]

                      )),
                      ),


                      Expanded(

                          child: LineChartReport(
                            historyData:historyData,
                            title: this.title,

                          ) )

                    ],
                  ),
                  )

                ],
              ),
            ) ,
          ),
        ),
      );

    });
  }
}
