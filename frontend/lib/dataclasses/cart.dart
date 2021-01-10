import 'dart:ui';
import 'package:flutter/cupertino.dart';

import '../card.dart';
import 'menuItems.dart';
import 'restaurant.dart';
import 'cartprice.dart';
import 'discount.dart';

class Cart{

  Set<MenuItem> _setOfMenuItems;
  Map<int, int> _mapOfMenuItems; // <menuItemId, quantity>
  Restaurant _restaurant;
  //List<CartPrice> _prices;
  //Discount _doorDashDiscount;
  //Discount _uberEatsDiscount;
  //Discount _skipTheDishesDiscount;

  // Cart(this._setOfMenuItems, this._mapOfMenuItems, this._restaurant,
  //     this._prices, this._doorDashDiscount, this._uberEatsDiscount,
  //     this._skipTheDishesDiscount);

  Cart(this._setOfMenuItems, this._mapOfMenuItems, this._restaurant);
  //Discount get skipTheDishesDiscount => _skipTheDishesDiscount;

  //Discount get uberEatsDiscount => _uberEatsDiscount;

  //Discount get doorDashDiscount => _doorDashDiscount;

  //List<CartPrice> get price => _prices;

  Restaurant get restaurant => _restaurant;

  Map<int, int> get mapOfMenuItems => _mapOfMenuItems;

  Set<MenuItem> get setOfMenuItems => _setOfMenuItems;

}


class PriceCardItem implements ListItem {
  final String name;
  final int quantity;
  final double price;

  PriceCardItem(this.name, this.quantity, this.price);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      name,
      style: TextStyle(fontSize: 24.0),
    );
  }

  @override
  Widget buildSubtitle(BuildContext context) {
    return Text(
      quantity.toString(),
      style: TextStyle(fontSize: 16.0),
    );
  }
}