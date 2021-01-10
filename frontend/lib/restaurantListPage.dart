import 'package:flutter/material.dart';
import 'package:food_delivery/card.dart';
import './dataclasses/menuItems.dart';
import 'package:food_delivery/menuItemsListPage.dart';

import 'dataclasses/menuItems.dart';

class RestaurantListPage extends StatelessWidget {

  final List<ListItem> items;

  RestaurantListPage({Key key, @required this.items}) : super(key: key);

  Future<List<MenuItem>> _menuList;

  List<ListItem> listOfMenu = [
    HeadingItem("McDonalds"), MessageItem("Big Mac", "\$10.95"),
    MessageItem("Cheese Burgher", "\$9.87"),
    MessageItem("Double Cheese", "\$9.99")
  ];

  @override
  Widget build(BuildContext context) {
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
              _menuList = fetchMenuList(1);

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        menuItemsListPage (
                          items: listOfMenu
                      //items: _menuList
                    )),
              );
            },
          );
        },
      ),
    );
  }
}