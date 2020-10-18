import 'package:covid19trackerv2/Localizations/localization_methods.dart';
import 'package:covid19trackerv2/models/Language.dart';
import 'package:covid19trackerv2/src/app_route.dart';
import 'package:flutter/material.dart';


class ChangeLanguageBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton(
          underline: SizedBox(),
          icon: Icon(Icons.language,color: Colors.orange,),

          items: Language.languageList().map<DropdownMenuItem<Language>>((lang) =>
          DropdownMenuItem(
              value: lang,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(lang.flag,style: TextStyle(fontSize: 20),),
                  Text(lang.name,style: TextStyle(fontSize: 20),),

                ],
              ))
          ).toList(),

          onChanged: (Language lang){
            _changeLanguage(context,lang);
          }),
    );
  }

  void _changeLanguage( context,Language lang) async{

    Locale _temp=await setLocale(lang.languageCode);
    AppRoute.setLocale(context, _temp);
  }
}
