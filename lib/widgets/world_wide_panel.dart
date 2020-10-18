import 'package:covid19trackerv2/widgets/info_card.dart';
import 'package:flutter/material.dart';




class WorldWidePanel extends StatelessWidget {

  final worldParsedData;
  final historyParsedData;


  WorldWidePanel({this.worldParsedData,this.historyParsedData});

  @override
  Widget build(BuildContext context) {
    return  GridView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2,
      ),
      children: <Widget>[

        InfoCard(
          historyData: historyParsedData,
          cardColor: Colors.red[100],
          title: 'Confirmed',
          iconColor: Colors.red,
          effectedNumber: worldParsedData['cases'].toString(),
          function: (){},
        ),
        InfoCard(
          historyData: null,
          cardColor: Colors.blue[100],
           title:'Active',
          iconColor: Colors.blue,
          effectedNumber: worldParsedData['active'].toString(),
          function: (){},

        ),
        InfoCard(
          historyData: historyParsedData,
          cardColor: Colors.green[100],
          title: 'Recovered',
          iconColor: Colors.green,
          effectedNumber: worldParsedData['recovered'].toString(),
          function: (){},
        ),
        InfoCard(
          historyData: historyParsedData,
          cardColor:Colors.grey[400] ,
          title: 'Death',
          iconColor: Colors.black,
          effectedNumber: worldParsedData['deaths'].toString(),
          function: (){},
        ),

      ],
    );
  }




}







//
//class StatuesPanel extends StatelessWidget {
//
//  final Color textColor;
//  final Color panelColor;
//  final String text;
//  final String textNumbers;
//
//
//  StatuesPanel({this.textColor, this.text,this.textNumbers,this.panelColor});
//
//  @override
//  Widget build(BuildContext context) {
//    return Padding(
//      padding: const EdgeInsets.all(8.0),
//      child: Container(
//        decoration: BoxDecoration(
//          borderRadius:BorderRadius.all(Radius.circular(7)) ,
//          color: panelColor,
//        ),
//
//        height: 80,
//        width: MediaQuery.of(context).size.width,
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text(text,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: textColor),),
//            Text(textNumbers,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: textColor),)
//          ],
//        ),
//
//      ),
//    );
//  }
//}
