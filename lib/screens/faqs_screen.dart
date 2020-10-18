import 'package:covid19trackerv2/Localizations/localization_methods.dart';
import 'package:covid19trackerv2/src/constants.dart';
import 'package:flutter/material.dart';


class FaqsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(getTranslated(context, 'FAQs')),centerTitle: true,),
        body:ListView.builder(
            itemCount:questionAnswers.length ,
            itemBuilder: (context,index)
            {
              return ExpansionTile(

                title: Text(questionAnswers[index]['question'],
                  style: TextStyle(fontWeight: FontWeight.bold),),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(questionAnswers[index]['answer']),
                )

              ],
              );
            }
        )
    );
  }
}
