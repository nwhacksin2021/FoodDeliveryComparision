import 'deliverer.dart';

class CartPrice {
  //tax
  //delivery fee
  //service fee
  //amount of discount
  //

  double _taxRate;
  double _deliveryFee;
  double _serviceFee; //calculated
  //list of promos?
  Deliverer _deliverer;

  CartPrice(this._taxRate, this._deliveryFee, this._serviceFee,
      this._deliverer);

  Deliverer get deliverer => _deliverer;

  double get serviceFee => _serviceFee;

  double get deliveryFee => _deliveryFee;

  double get taxRate => _taxRate;


}