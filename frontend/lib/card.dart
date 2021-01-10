import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//class to build list items
/// The base class for the different types of items the list can contain.
abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  Widget buildSubTitle(BuildContext context);
}

/// A ListItem that contains data to display a heading.
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.title,
    );
  }

  @override
  Widget buildSubTitle(BuildContext context) {
    return null;
  }
}

/// A ListItem that contains data to display a message.
class RestaurantCardItem implements ListItem {
  final String restaurantName;
  final DateTime openingTime;
  final DateTime closingTime;
  final String address;
  final List<int> providers;

  RestaurantCardItem(this.restaurantName, this.openingTime, this.closingTime,
      this.address, this.providers);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      restaurantName,
      style: TextStyle(fontSize: 24.0),
    );
  }

  @override
  Widget buildSubTitle(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "Open at: " +
              DateFormat('hh:mm:ss').format(openingTime) +
              " \n" +
              "Close at:" +
              DateFormat('hh:mm:ss').format(closingTime) +
              " " +
              " \n" +
              "Located at: " +
              address,
          style: TextStyle(fontSize: 16.0),
        ),
        Row(
          children: <Widget>[
            Text('Supported platforms:'),
            Padding(padding: EdgeInsets.all(10)),
            providers.contains(1)
                ? Image.asset('assets/skiplogo.png', scale: 12)
                : Icon(
                    Icons.clear,
                    color: Colors.transparent,
                    size: 40.0,
                  ), //can't use null or flutter doesn't like it
            providers.contains(2)
                ? Image.asset('assets/doordashlogo.jpg', scale: 12)
                : Icon(
                    Icons.clear,
                    color: Colors.transparent,
                    size: 40.0,
                  ),
            providers.contains(3)
                ? Image.asset('assets/ubereatslogo.png', scale: 100)
                : Icon(
                    Icons.clear,
                    color: Colors.transparent,
                    size: 40.0,
                  ),
          ],
        )
      ],
    );
  }
}
