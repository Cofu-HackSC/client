import 'package:app/models/cook_profile.dart';
import 'package:app/models/user.dart';
import 'package:flutter/foundation.dart';
import 'item.dart';

class Sale {
  String saleID, sellerID, buyerID, itemID, ratingText;
  int amount;
  double totalCost, rating;
  bool hide, pickup, fulfilled;
  Item item;
  CookProfile cook;
  User buyer;

  Sale({
    @required this.saleID,
    @required this.sellerID,
    @required this.buyerID,
    @required this.itemID,
    @required this.ratingText,
    @required this.amount,
    @required this.totalCost,
    @required this.rating,
    @required this.hide,
    @required this.pickup,
    @required this.fulfilled,
    @required this.item,
    @required this.cook,
    @required this.buyer,
  });
}
