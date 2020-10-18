class Language
{
  final int id;
  final String name;
  final String flag;
  final String languageCode;

  Language({this.id, this.name, this.flag, this.languageCode});


  static List<Language> languageList() {

    return <Language>[
      Language(id: 1,name: 'English',flag: 'us',languageCode:'en'),
      Language(id: 2,name: 'Arabic',flag: 'eg',languageCode:'ar'),
    ];
}

}