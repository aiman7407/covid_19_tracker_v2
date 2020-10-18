import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class SetLocalization
{
  final Locale locale;

  SetLocalization({this.locale});


  static SetLocalization of (BuildContext context)
  {
    return Localizations.of<SetLocalization>(context, SetLocalization);
  }

  String getCurrentCode()
  {

    return locale.languageCode;
  }

  Map<String,String> _localizedValue;

  static const LocalizationsDelegate<SetLocalization>localizationsDelegate=_GetLocalizedDelegate();

  Future load()
  async{

    String jsonStringValues=
    await rootBundle.loadString('assests/langs/${locale.languageCode}.json');

    Map <String,dynamic> mappedJson=json.decode(jsonStringValues);
    _localizedValue=mappedJson.map((key, value) => MapEntry(key,value.toString()));

  }


  String getTranslatedValue(String key)
  {

    return _localizedValue[key];
  }

}


class _GetLocalizedDelegate extends LocalizationsDelegate<SetLocalization>
{
  const _GetLocalizedDelegate();


  @override
  bool isSupported(Locale locale) {

    return['en','ar'].contains(locale.languageCode);
  }

  @override
  Future<SetLocalization> load(Locale locale) async{

    SetLocalization localization =SetLocalization(locale: locale );
    await localization.load();
    return localization;

  }

  @override
  bool shouldReload(LocalizationsDelegate<SetLocalization> old) {

    return false;
  }




}