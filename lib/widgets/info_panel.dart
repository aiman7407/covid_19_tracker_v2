import 'package:covid19trackerv2/Localizations/localization_methods.dart';
import 'package:covid19trackerv2/screens/faqs_screen.dart';
import 'package:covid19trackerv2/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        GestureDetector(
            onTap: (){

              Navigator.push(context, MaterialPageRoute(builder: (context)=>FaqsScreen() ));
            },
            child: FAQCard(text:  'FAQs',)),



        GestureDetector(
            onTap: (){

              launch('https://www.who.int/indonesia/news/novel-coronavirus/mythbusters');
            },
            child: FAQCard(text: 'Myth_Busters')),


      ],
    );
  }
}

class FAQCard extends StatelessWidget {

  String text;


  FAQCard({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: kPrimaryBlack,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            getTranslated(context, text),
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          Icon(Icons.arrow_forward,color: Colors.white,)
        ],
      ),
    );
  }
}
