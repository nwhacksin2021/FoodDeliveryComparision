import 'menuItems.dart';
import 'restaurant.dart';
import 'cartprice.dart';
import 'discount.dart';

class Cart{

  Set<MenuItem> _setOfMenuItems;
  Map<int, int> _mapOfMenuItems; // <menuItemId, quantity>
  Restaurant _restaurant;
  List<CartPrice> _prices;
  Discount _doorDashDiscount;
  Discount _uberEatsDiscount;
  Discount _skipTheDishesDiscount;

  Cart(this._setOfMenuItems, this._mapOfMenuItems, this._restaurant,
      this._prices, this._doorDashDiscount, this._uberEatsDiscount,
      this._skipTheDishesDiscount);

  Discount get skipTheDishesDiscount => _skipTheDishesDiscount;

  Discount get uberEatsDiscount => _uberEatsDiscount;

  Discount get doorDashDiscount => _doorDashDiscount;

  List<CartPrice> get price => _prices;

  Restaurant get restaurant => _restaurant;

  Map<int, int> get mapOfMenuItems => _mapOfMenuItems;

  Set<MenuItem> get setOfMenuItems => _setOfMenuItems;


}