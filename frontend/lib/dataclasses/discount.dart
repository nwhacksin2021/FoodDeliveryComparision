class Discount {

  bool _hasPass;
  bool _hasPromotion;

  Discount(this._hasPass, this._hasPromotion);

  bool get hasPromotion => _hasPromotion;

  bool get hasPass => _hasPass;

}