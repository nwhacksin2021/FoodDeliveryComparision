import 'package:flutter/material.dart';
import 'package:food_delivery/card.dart';
import 'package:food_delivery/dataclasses/cart.dart';
import 'package:food_delivery/menuItemsListPage.dart';
import 'dart:convert';

import 'dataclasses/menuItems.dart';

class RestaurantListPage extends StatelessWidget {

  final Set<ListItem> items;

  RestaurantListPage({Key key, @required this.items}) : super(key: key);

  // List<ListItem> listOfMenu = [
  //   HeadingItem("McDonalds"), MessageItem("Big Mac", "\$10.95"),
  //   MessageItem("Cheese Burgher", "\$9.87"),
  //   MessageItem("Double Cheese", "\$9.99")
  // ];

  Set<MenuItem> listOfMenu = Set.from([
    MenuItem(1, "Tasty Food", 9.99, "Delicious food with delicious description", ["abc", "def"])
  ]);

  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Select a restaurant"),
      ),
      body: ListView.builder(
        // Let the ListView know how many items it needs to build.
        itemCount: items.length,
        // Provide a builder function. This is where the magic happens.
        // Convert each item into a widget based on the type of item it is.
        itemBuilder: (context, index) {
          final item = items[index];

          return ListTile(
            title: item.buildTitle(context),
            subtitle: item.buildSubtitle(context),
            onTap: () {
              //List<MenuItem> list = fetchAlbum().list;

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MenuPage (
                      items: listOfMenu
                    )),
              );
            },
          );
        },
      ),
    );
  }
}

// Future<Album> fetchAlbum() async {
//   final response = await http.get('https://url.com/api/menu/1');
//
//   // if (response.statusCode == 200) {
//   //   // If the server did return a 200 OK response,
//   //   // then parse the JSON.
//   return Album.fromJson(jsonDecode(response.body));
//   // } else {
//   //   // If the server did not return a 200 OK response,
//   //   // then throw an exception.
//   //   throw Exception('Failed to load album');
//   // }
// }
//
// class Album {
//   final int responseCode;
//   final List<MenuItem> list;
//
//   Album({this.responseCode, this.list});
//
//   factory Album.fromJson(Map<String, dynamic> json) {
//     return Album(
//       responseCode: json['response_code'],
//       list: json['payload'],
//     );
//   }
//
//
// }