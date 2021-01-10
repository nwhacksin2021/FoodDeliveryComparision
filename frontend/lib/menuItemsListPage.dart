import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:food_delivery/card.dart';
import 'card.dart';
import 'dataclasses/menuItems.dart';

class MenuPage extends StatefulWidget {
  final List<MenuItem> items;

  MenuPage({Key key, @required this.items}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  Set<MenuItem> _items = HashSet();
  Map<int, int> _mapOfItemToQty = HashMap();

  @override MenuPage get widget => super.widget;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Select a menu"),
      ),
      body: ListView.builder(
        // Let the ListView know how many items it needs to build.
        itemCount: widget.items.length,
        // Provide a builder function. This is where the magic happens.
        // Convert each item into a widget based on the type of item it is.
        itemBuilder: (context, index) {
          final item = widget.items[index];

          MenuItem menuItem = MenuItem(
              item.id,
              item.name,
              item.price,
              item.description,
              item.listOfItemCategories);

          return ListTile(
            title: menuItem.buildTitle(context),
            subtitle: menuItem.buildSubtitle(context),
            onTap: () {
              _showDialog(context, menuItem);
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

  _showDialog(BuildContext context, MenuItem item) {
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
                  updateItem(item, ct.text);
                  return;
                }
            )
          ]
      );
    });
  }

  updateItem(MenuItem item, String quantity) {
    int qty = int.parse(quantity);
    setState(() {
      if (qty == 0) {
        if (_items.contains(item)) {
           _items.remove(item);
           _mapOfItemToQty.remove(item.id);
        }
      } else {
        _items.add(item);
        _mapOfItemToQty.update(item.id, (value) => value++, ifAbsent: () => 1);
      }
    });
    print(qty);
    print("hello world");
    print("Items $_items");
    print(_mapOfItemToQty);
  }

  // addItem(MenuItem item) {
  //   setState(() {
  //     if (_mapOfItemToQty.containsKey(item.id)) {
  //       _mapOfItemToQty.update(item.id, (value) => _mapOfItemToQty[item.id] + 1);
  //     } else {
  //       _items.add(item);
  //       _mapOfItemToQty[item.id] = 1;
  //     }
  //   });
  // }
  //
  // removeItem(MenuItem item) {
  //   setState(()  {
  //     int qty;
  //     if (_mapOfItemToQty.containsKey(item.id)) {
  //       qty = _mapOfItemToQty.update(item.id, (value) => _mapOfItemToQty[item.id]--);
  //     }
  //
  //     if (qty == 0) {
  //       _mapOfItemToQty.remove(item.id);
  //       _items.remove(item.id);
  //     }
  //   });
  // }
}