import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_delivery/card.dart';
import 'package:food_delivery/dataclasses/menuItems.dart';

import 'cartItemsPage.dart';

class menuItemsListPage extends StatelessWidget {

  final List<ListItem> items;

  menuItemsListPage({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Select a menu"),
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
            //trailing:,
            onTap: () {
              _showDialog(context);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => cartItemsPage (
                )),
          );
        },
        child: Icon(Icons.shopping_cart),

      ),
    );
  }
}

class QuantityWidget extends StatefulWidget {

  //const QuantityWidget ({ Key key }) : super(key: key);
  int count;

  @override
  _QuantityWidgetState createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends State<QuantityWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(color: const Color(0xFFFFE306));
  }
}

_showDialog(BuildContext context) {
  TextEditingController ct = new TextEditingController();
  return showDialog(context: context, builder: (context) {
    return AlertDialog(
        title: Text("Quantity?"),
        content: TextField(controller: ct,),
        actions: [
          MaterialButton(
              elevation: 5.0,
              child: Text("Submit"),
              onPressed: () {
              }
          )
        ]
    );
  });
}