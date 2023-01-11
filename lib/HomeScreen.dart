import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'Model/Property.dart';
import 'Services/TodoService.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //final _category = TodoService();
  List<Property> property = [];
  List<Property> property2 = [];
  var catalogdata;
  DateTime? date;

  String formatDate(DateTime date) => DateFormat("yyyy-MM-dd").format(date);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      loadData("Default");
    });
  }

  Future<void> loadData(var data) async {
    if (data == "Default") {
      print("Default");
      //getJsonData();
      property = [];
      var data = await rootBundle.loadString('Assets/Data.json');
      catalogdata = json.decode(data);
      print("data is ------$catalogdata");
      for (var datalist in catalogdata) {
        property.add(Property.fromJson(datalist));
      }

      setState(() {});
    } else if (data == "Latest First") {
      // getJsonData();
      print("latest");
      property = [];
      var data = await rootBundle.loadString('Assets/Data.json');
      catalogdata = json.decode(data);
      print("data is ------$catalogdata");
      for (var datalist in catalogdata) {
        property.add(Property.fromJson(datalist));
      }
      // print(DateFormat.yMMMd().format(DateTime.now()));

      DateTime? date;

      //String formatDate(DateTime date) => DateFormat("MMMM d").format(date);
      //List<Property> _myList = [];
      print(DateTime.now().toString());
      DateFormat inputFormat = DateFormat('dd-MMM-yyyy');
      print(
          "format date is ${DateFormat('dd-MMM-yyyy').format(DateTime.parse(property[1].date.toString()))}");
      //property.sort((a,b)=> DateFormat('dd-MMM-yyyy').format(DateTime.parse(a.date.toString())).compareTo(DateFormat('dd-MMM-yyyy').format(DateTime.parse(b.date.toString()))));
      property.sort((a, b) => (DateTime.parse(a.date.toString()))
          .compareTo((DateTime.parse(b.date.toString()))));

      setState(() {});
    } else if (data == "Latest Last") {
      // getJsonData();
      print("latest");
      property = [];
      var data = await rootBundle.loadString('Assets/Data.json');
      catalogdata = json.decode(data);
      print("data is ------$catalogdata");
      for (var datalist in catalogdata) {
        property.add(Property.fromJson(datalist));
      }
      // print(DateFormat.yMMMd().format(DateTime.now()));

      DateTime? date;

      //String formatDate(DateTime date) => DateFormat("MMMM d").format(date);
      //List<Property> _myList = [];
      print(DateTime.now().toString());
      DateFormat inputFormat = DateFormat('dd-MMM-yyyy');
      print(
          "format date is ${DateFormat('dd-MMM-yyyy').format(DateTime.parse(property[1].date.toString()))}");
      //property.sort((a,b)=> DateFormat('dd-MMM-yyyy').format(DateTime.parse(a.date.toString())).compareTo(DateFormat('dd-MMM-yyyy').format(DateTime.parse(b.date.toString()))));
      property.sort((a, b) => (DateTime.parse(b.date.toString()))
          .compareTo((DateTime.parse(a.date.toString()))));

      setState(() {});
    } else if (data == "Price-Low to High") {
      var data = await rootBundle.loadString('Assets/Data.json');
      catalogdata = json.decode(data);
      print("data is ------$catalogdata");
      for (var datalist in catalogdata) {
        property.add(Property.fromJson(datalist));
      }
      property.sort(
        (a, b) => (int.parse(a.price!.toString()))
            .compareTo(int.parse(b.price!.toString())),
      );
    }
    else if (data == "Price-High to Low") {
      var data = await rootBundle.loadString('Assets/Data.json');
      catalogdata = json.decode(data);
      print("data is ------$catalogdata");
      for (var datalist in catalogdata) {
        property.add(Property.fromJson(datalist));
      }
      property.sort(
        (a, b) => (int.parse(b.price!.toString()))
            .compareTo(int.parse(a.price!.toString())),
      );
    }

    // property.sort();
    /* print(property[0].address);
    print(property[0].date);

    for (var i = 0; i < property.length; i++) {
      print(property[i].propertyName);
      print(property[i].active);
    }*/
  }

  loadData2(var date) async {


    property2.clear();
    property.clear();
    DateTime date2=DateTime.parse(date.toString());
   // var date1 = DateFormat('dd-MMM-yyyy').format(DateTime.parse(date.toString()));
   // DateTime date2 = DateTime.parse(date1);


    print("date2 is $date2");
   // DateTime inputDate = DateTime.parse(date.toString());
   //var parseDate = DateFormat("yyyy-MM-dd").parse(DateTime.parse(date.toString()));
    print(
        "format date is ${DateFormat('yyyy-MM-dd').format(DateTime.parse(date.toString()))}");

    //print("input date is $parseDate");

    property.clear();
    var data = await rootBundle.loadString('Assets/Data.json');
    catalogdata = json.decode(data);
    //print("data is ------$catalogdata");

    for (var datalist in catalogdata) {

      property2.add(Property.fromJson(datalist));
      /* if(date2.isAtSameMomentAs(DateTime.parse(catalogdata['date'].toString()))){
        print("data match");
        property.add(Property.fromJson(datalist));
        print(property[0].date);
        print(property[1].date);
      }
      else
        {
          print("data not match");
        }*/}
      for (int i = 0; i < property2.length; i++) {
        if(date2.isAfter(DateTime.parse(property2[i].date.toString())))
          {
            print("data match");
            property.add(Property(
                id: property2[i].id,
                image: property2[i].image,
                date: property2[i].date,
                active: property2[i].active,
                address: property2[i].address,
                isFeatured: property2[i].isFeatured,
                price: property2[i].price,
                propertyName: property2[i].propertyName,
                propertyStatus: property2[i].propertyStatus,
                propertyType: property2[i].propertyType));
          }
     //   print("date is:${date2}");
       // print("catalog is------${DateTime.parse(catalogdata[i]['date'])}");

      /*  if (DateFormat('yyyy-MM-dd').format(DateTime.parse(date.toString())).isAtSameMomentAs(DateFormat('yyyy-MM-dd').format(DateTime.parse(property2[i].date.toString())))) {
          print("ifdate is:${date2}");
          print("ifcatalog is------${DateTime.parse(catalogdata[i]['date'])}");
          print("data match");
          property.add(Property(
              id: property2[i].id,
              image: property2[i].image,
              date: property2[i].date,
              active: property2[i].active,
              address: property2[i].address,
              isFeatured: property2[i].isFeatured,
              price: property2[i].price,
              propertyName: property2[i].propertyName,
              propertyStatus: property2[i].propertyStatus,
              propertyType: property2[i].propertyType));
        }*/

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 1)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PopupMenuButton(
                      icon: Icon(Icons.filter_alt),
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            child: Text("Default"),
                            onTap: () {
                              loadData("Default");
                            },
                          ),
                          PopupMenuItem(
                            child: Text("Latest First"),
                            onTap: () {
                              setState(() {
                                loadData("Latest First");
                              });
                            },
                          ),
                          PopupMenuItem(
                            child: Text("Latest Last"),
                            onTap: () {
                              setState(() {
                                loadData("Latest Last");
                              });
                            },
                          ),
                          PopupMenuItem(
                            child: Text("Price-Low to High"),
                            onTap: () {
                              setState(() {
                                loadData("Price-Low to High");
                              });
                            },
                          ),
                          PopupMenuItem(
                            child: Text("Price-High to Low"),
                            onTap: () {
                              setState(() {
                                loadData("Price-High to Low");
                              });
                            },
                          ),
                        ];
                      },
                    ),
                    Text(
                      date != null
                          ? DateFormat('yyyy-MM-dd').format(date!)
                          : "",
                      style: TextStyle(fontSize: 20),
                    ),
                    InkWell(
                        onTap: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime(2023),
                                  firstDate: DateTime(2020),
                                  lastDate: DateTime(2025))
                              .then((value) {
                            setState(() {
                              date = value;
                              print(DateFormat('yyyy-MM-dd').format(date!));
                            });
                            loadData2(date);
                          });
                        },
                        child: Icon(Icons.calendar_month))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child:
              ListView.builder(
                itemCount: property.length,
                itemBuilder: (context, index) {
                  return
                    /*Card(color:Colors.red );*/
                    Container(
                    height: 350,
                    width: double.infinity,
                    // color: Colors.red,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 1)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: Colors.black, width: 1),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        property[index].image.toString()),
                                    fit: BoxFit.fill)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("${property[index].propertyName.toString()}"),
                          SizedBox(
                            height: 10,
                          ),
                          Text(property[index].date.toString()),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Price: ${property[index].price.toString()}"),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Status: ${property[index].active.toString()}")
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
