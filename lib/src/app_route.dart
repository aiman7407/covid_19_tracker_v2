import 'package:covid19trackerv2/Localizations/localization_methods.dart';
import 'package:covid19trackerv2/Localizations/set_localizations.dart';
import 'package:covid19trackerv2/screens/main_screen.dart';
import 'package:covid19trackerv2/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


class AppRoute extends StatefulWidget {


  static void setLocale(BuildContext context, Locale locale)
  {
_AppRouteState state =context.findAncestorStateOfType();
state.setLocale(locale);
  }

  @override
  _AppRouteState createState() => _AppRouteState();
}

class _AppRouteState extends State<AppRoute> {

  Locale _locale;
  void setLocale(Locale locale)
  {
    setState(() {
      _locale=locale;
    });
  }


  @override
  void didChangeDependencies() {
    getLocale().then((locale){
      setState(() {
        this._locale=locale;
      });

    } );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    if(_locale==null)
      {
        return Container(
          child: CircularProgressIndicator() ,
        );
      }

    else
    return MaterialApp(
      locale: _locale,
      supportedLocales:[
        Locale('en','US'),
        Locale('ar','EG'),

      ],
      localizationsDelegates:[
        SetLocalization.localizationsDelegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,

      ],
      localeResolutionCallback: (deviceLocal,supportedLocals)
      {
        for(var locale in supportedLocals)
          {
            if(locale.languageCode==deviceLocal.languageCode&&
            locale.countryCode==deviceLocal.countryCode)
              {
                return deviceLocal;
              }
          }
        return supportedLocals.first;
      }
      ,





      theme: ThemeData(
        primaryColor: kPrimaryBlack,
          fontFamily: kkFontFamily
      ),


      home: MainScreen(),
    );
  }
}
