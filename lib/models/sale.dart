import 'package:app/models/cook_profile.dart';
import 'package:app/models/user.dart';
import 'package:flutter/foundation.dart';
import 'item.dart';

class Sale {
  String saleID, buyerID, ratingText;
  int amount;
  double totalCost, rating;
  bool hide, pickup, fulfilled;
  Item item;
  User buyer;

  Sale({
    @required this.saleID,
    @required this.buyerID,
    @required this.ratingText,
    @required this.amount,
    @required this.totalCost,
    @required this.rating,
    @required this.hide,
    @required this.pickup,
    @required this.fulfilled,
    @required this.item,
    @required this.buyer,
  });
}
