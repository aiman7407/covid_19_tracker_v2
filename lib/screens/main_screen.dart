import 'package:covid19trackerv2/Localizations/localization_methods.dart';
import 'package:covid19trackerv2/screens/country_screen.dart';
import 'package:covid19trackerv2/services/networking.dart';
import 'package:covid19trackerv2/src/constants.dart';
import 'package:covid19trackerv2/widgets/change_language_bottom_sheet.dart';
import 'package:covid19trackerv2/widgets/info_panel.dart';
import 'package:covid19trackerv2/widgets/most_effected.dart';
import 'package:covid19trackerv2/widgets/world_wide_panel.dart';
import 'package:flutter/material.dart';



class MainScreen extends StatefulWidget {


  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


  var worldData;
  var topCountriesData;
  var historicalData;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              height: 100,
              color: Colors.orange[100],
              child: Text(
                getLangCode(context)==ENGLISH? kQuote :kQueteAr ,

                style: TextStyle(
                  color: Colors.orange[800],
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),),
            ),

            Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(getTranslated(context, 'World_Wide'),
                    style:TextStyle(fontSize: 19,fontWeight: FontWeight.bold) ,),
                ),
                ChangeLanguageBottomSheet(),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CountryScreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: kPrimaryBlack,
                          borderRadius:BorderRadius.circular(15) ),
                      padding: EdgeInsets.all(7),

                        child: Text(getTranslated(context, 'Regional'),
                          style:TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white

                          ) ,)),
                  ),
                ),
              ],
            ),


            worldData==null ?CircularProgressIndicator() :
            WorldWidePanel(worldParsedData: worldData,
              historyParsedData: historicalData,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(getTranslated(context, 'Most_Affected_Countries'),
                style:TextStyle(
                  fontSize: 20,fontWeight: FontWeight.bold) ,),
            ),


            topCountriesData==null ?CircularProgressIndicator():   MostEffectedWidget(countryData: topCountriesData,) ,

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InfoPanel(),
          ),


          ],
        ),

      ),
    );
  }



  fetchWorldWideData()
  async{


    NetworkHelper networkHelper=NetworkHelper(
        'https://corona.lmao.ninja/v2/all'
    );


    var data = await networkHelper.getData();

    worldData=data;




    setState(() {
    });



  }

  fetchTopCountries()
  async{

    NetworkHelper networkHelper=NetworkHelper(
        'https://corona.lmao.ninja/v2/countries?sort=cases'
    );

    var data = await networkHelper.getData();
    topCountriesData=data;


    setState(() {
    });



  }

  fetchHistoryData()
 async {

   NetworkHelper networkHelper=NetworkHelper(
       'https://corona.lmao.ninja/v2/historical/all'
   );

   var data = await networkHelper.getData();
   historicalData=data;

   setState(() {
   });




 }

  @override
  void initState() {

    fetchWorldWideData();
    fetchTopCountries();
    fetchHistoryData();
  }
}
