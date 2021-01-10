import 'package:flutter/material.dart';
import 'package:food_delivery/card.dart';

class menuItemsListPage extends StatelessWidget {

  final List<ListItem> items;

  menuItemsListPage({Key key, @required this.items}) : super(key: key);

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
            onTap: () {
              _showDialog(context);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: Icon(Icons.shopping_cart),

      ),
    );
  }
}