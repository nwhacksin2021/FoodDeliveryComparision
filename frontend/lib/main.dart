import 'package:flutter/material.dart';
import 'restaurantListPage.dart' as RestaurantListPage;
import './dataclasses/restaurant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        fontFamily: 'insaniburger',
        primarySwatch: Colors.blue,
      ),
      home: EnterAddressForm(),
    );
  }
}

// Create a Form widget.
class EnterAddressForm extends StatefulWidget {
  @override
  EnterAddressFormState createState() {
    return EnterAddressFormState();
  }
}

class EnterAddressFormState extends State<EnterAddressForm> {
  final _formKey = GlobalKey<FormState>();
  final textController =
      TextEditingController(); //textController.text retrieves the text in the controller

  Future<List<Restaurant>> _futureRestaurants;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Food Delivery Comparision App"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Image.asset('assets/dingdonglogo.png', scale: 0.9),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
              ),
              Text(
                'Enter in your address',
                style: TextStyle(fontSize: 22.0),
              ),
              Text(
                'Format address as: address, city, province',
                style: TextStyle(fontSize: 12.0),
              ),
              Container(
                margin: EdgeInsets.all(25),
                child: TextFormField(
                  controller: textController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter an address';
                    }
                    if (value.split(",").length != 3) {
                      // should have 3 parts
                      return 'Please enter the correct address format';
                    }
                    return null;
                  },
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22.0),
                ),
              ),
              Container(
                child: FlatButton(
                  child: Text(
                    'Continue',
                    style: TextStyle(fontSize: 22.0),
                  ),
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  onPressed: () {
//                    return showDialog(
//                      context: context,
//                      builder: (context) {
//                        return AlertDialog(
//                          // Retrieve the text the that user has entered by using the
//                          // TextEditingController.
//                          content: Text(textController.text.split(",")[1].trim() + textController.text.split(",")[2].trim()),
//                        );
//                      },
//                    );
                    if (_formKey.currentState.validate()) {
                      setState(() {
                        _futureRestaurants = fetchRestaurants(textController
                            .text
                            .split(",")[1]
                            .trim()
                            .toLowerCase()); //get the city
                      });

                      _futureRestaurants.then((restaurants) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    RestaurantListPage.RestaurantListScreen(
                                        restaurants: restaurants)));
                      }).catchError((onError) {
                        print(onError.toString());
                      });
                    }
                    //textController.clear();
                  },
                ),
              ),
              Text('nwHacks2021. Made by nwHackers 2021')
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
