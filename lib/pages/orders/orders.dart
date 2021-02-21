import 'package:app/components/feed_tile.dart';
import 'package:app/components/header.dart';
import 'package:app/components/orders_tile.dart';
import 'package:app/models/cook_profile.dart';
import 'package:app/models/item.dart';
import 'package:app/models/sale.dart';
import 'package:app/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<Sale> orders = [
  new Sale(
    item: new Item(
      itemID: 'sdgsdgsdgesr',
      sellerID: 'sdgsdg',
      photoURL: 'sdg',
      name: 'Jason\'s Pretzels',
      avgItemRating: 4.6,
      delivery: true,
      pickup: true,
      ingredients: 'Flour, Milk, Yeast, Olive Oil, Sugar, Salt, Baking Soda',
      description: 'A yummy yummy for your tummy treat made by yours truely.',
      cost: 1.60,
      stock: 16,
      cook: CookProfile(
        name: 'Jason Telanoff',
        bio: 'Likes Eating... A lot',
        address: '1234 ThisIsThe Way, Some City',
        emailContact: true,
        contact: 'jason.telanoff@gmail.com',
        id: 'asdfje',
      ),
    ),
    amount: 3,
    buyer: new User(),
    buyerID: 'aje;fj ',
    fulfilled: true,
    hide: false,
    pickup: true,
    rating: null,
    ratingText: '',
    saleID: 'erjere',
    totalCost: 4.80,
  ),
];

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        Header('Orders'),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CupertinoSearchTextField(),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (c, i) => orders[i].hide
                ? Container()
                : OrderTile(
                    sale: orders[i],
                  ),
            childCount: orders.length,
          ),
        )
      ],
    );
  }
}

enum LoadState {
  Error,
  Loading,
  Loaded,
}
