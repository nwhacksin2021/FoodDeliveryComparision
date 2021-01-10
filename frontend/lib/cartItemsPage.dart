import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/dataclasses/menuItems.dart';
import 'dataclasses/cart.dart';
import 'dataclasses/restaurant.dart';

class cartItemsPage extends StatelessWidget {

  final Cart item;

  cartItemsPage ({Key key, @required this.item}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Finish Your Order"),
      ),
      body: ListView.builder(
        // Let the ListView know how many items it needs to build.
        itemCount: 1,
        //itemCount: item.setOfMenuItems.length,
        // Provide a builder function. This is where the magic happens.
        // Convert each item into a widget based on the type of item it is.
        itemBuilder: (context, index) {
          //final i = item.setOfMenuItems.elementAt(index);

          // int quantity = item.mapOfMenuItems[i.id];
          // PriceCardItem card = new PriceCardItem(
          //     i.name,
          //     quantity,
          //     quantity * i.price
          // );

          int quantity = 2;
          PriceCardItem card = new PriceCardItem(
              "BigMac",
              quantity,
              quantity * 9.99
          );


          return ListTile(
            title: card.buildTitle(context),
            subtitle: card.buildSubtitle(context),
            trailing: Text('\$' + card.price.toString()),
          );
        },
      ),

    );
  }
}

// class Order extends StatelessWidget {
//   final String title;
//   Order({Key key, @required this.title}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Finish Order"),
//       ),
//         body: Center(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Text("Your Order", textAlign: TextAlign.left,),
//             ],
//           ),
//         ),
//     );
//   }
// }