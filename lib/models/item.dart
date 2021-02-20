import 'package:app/models/cook_profile.dart';
import 'package:flutter/foundation.dart';

class Item {
  String itemID, sellerID, name, photoURL, ingredients, description;
  double cost, avgItemRating;
  int stock;
  bool delivery, pickup;

  CookProfile cook;

  Item({
    @required this.itemID,
    @required this.sellerID,
    @required this.name,
    @required this.photoURL,
    @required this.ingredients,
    @required this.description,
    @required this.cost,
    @required this.avgItemRating,
    @required this.stock,
    @required this.delivery,
    @required this.pickup,
    @required this.cook,
  });
}
