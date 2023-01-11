import 'dart:convert';

import 'package:flutter/services.dart';

import '../Model/Property.dart';

class TodoService{
  List<Property> property = [];
  var catalogdata;
 // late List catalogdata;
  getJsonData()async
  {
    var data = await rootBundle.loadString('Assets/Data.json');
    catalogdata= json.decode(data);
    print("data is ------$catalogdata");
  }
  Future<void> loadData(var data,context) async
  {
    if(data=="Default")
      {

        print("Default");
        //getJsonData();
        property = [];
        var data = await rootBundle.loadString('Assets/Data.json');
        catalogdata= json.decode(data);
        print("data is ------$catalogdata");
        for (var datalist in catalogdata) {
          property.add(Property.fromJson(datalist));
        }

       // setState((){});
      }
    else if(data=="Latest First")
      {
       // getJsonData();
        print("latest");
        property = [];
        var data = await rootBundle.loadString('Assets/Data.json');
        catalogdata= json.decode(data);
       print("data is ------$catalogdata");
        for (var datalist in catalogdata) {
          property.add(Property.fromJson(datalist));


        }
        //List<Property> _myList = [];
        print(property[0].date);
        property.sort((a,b)=> a.date!.compareTo(b.date!));
        print(property[0].date);

      }
   // property.sort();
   /* print(property[0].address);
    print(property[0].date);

    for (var i = 0; i < property.length; i++) {
      print(property[i].propertyName);
      print(property[i].active);
    }*/
  }
}