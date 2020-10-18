import 'package:covid19trackerv2/Localizations/localization_methods.dart';
import 'package:covid19trackerv2/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CountryScreen extends StatefulWidget {
  @override
  _CountryScreenState createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  List countryData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: countryData == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: countryData == null ? 0 : countryData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey[200],
                              offset: Offset(0, 10),
                              blurRadius: 10),
                        ]),
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                countryData[index]['country'],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Image.network(
                                countryData[index]['countryInfo']['flag'],
                                width: 50,
                                height: 60,
                              )
                            ],
                          ),
                        ),
                        Expanded(
                            child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text( getTranslated(context, 'Confirmed') +' '+
                                  countryData[index]['cases'].toString(),
                              style: TextStyle(color: Colors.red,
                                  fontWeight: FontWeight.bold),

                              ),

                              Text(getTranslated(context, 'Active') +' '+
                                  countryData[index]['active'].toString(),
                                style: TextStyle(color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),

                              Text(getTranslated(context, 'Recovered') +' '+
                                  countryData[index]['recovered'].toString(),
                                style: TextStyle(color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(getTranslated(context, 'Death') +' '+
                                  countryData[index]['deaths'].toString(),
                                style: TextStyle(color: Colors.grey[800],
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                );
              }),
    );
  }

  fetchTopCountries() async {
    NetworkHelper networkHelper =
        NetworkHelper('https://corona.lmao.ninja/v2/countries?sort=cases');

    var data = await networkHelper.getData();
    countryData = data;

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchTopCountries();
  }
}
