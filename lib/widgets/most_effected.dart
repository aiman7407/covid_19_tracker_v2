import 'package:flutter/material.dart';

class MostEffectedWidget extends StatelessWidget {

 final List countryData;


 MostEffectedWidget({this.countryData});

 @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(

        shrinkWrap: true,
          itemCount: 20,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 2),
              child: Container(
                child: Row(
                  children: <Widget>[

                    Text('${index+1} -'.toString()),

                    Image.network(countryData[index]['countryInfo']['flag'],
                      height: 30,width: 30,),
                    SizedBox(width: 10,),

                    Text(countryData[index]['country']),
                    SizedBox(width: 10,),

                    Text(countryData[index]['deaths'].toString(),
                      style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold))

                  ],
                ),
              ),
            );
          }),
    );
  }
}
