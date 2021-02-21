import 'dart:convert';

import 'package:app/models/cook_profile.dart';
import 'package:app/models/session.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

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

  factory Item.fromJSON(dynamic json) => Item(
      avgItemRating: double.parse(json['averageitemrating'] ?? '0'),
      cook: new CookProfile(),
      cost: double.parse(json['cost']),
      delivery: json['delivery'],
      description: json['description'],
      ingredients: json['ingredients'],
      itemID: json['id'],
      name: json['name'],
      photoURL: json['photourl'],
      pickup: json['pickup'],
      sellerID: json['sellerid'],
      stock: json['stock']);

  static Future<List<Item>> load(Session session) async {
    Response json =
        await get('https://cofu-305406.wl.r.appspot.com/feeds/foods', headers: {
      'Cookie': 'connect.sid=' + session.session,
    });
    try {
      List<Item> items = [];
      print(Item.fromJSON(jsonDecode(json.body)[0]));
      jsonDecode(json.body).forEach((v) {
        print(v);
        items.add(Item.fromJSON(v));
      });

      print('hi');
      return items;
    } catch (e) {
      print('OK MAYBE THE PROBLEM IS HERE');
      print(e);
      throw e;
    }
  }
}
