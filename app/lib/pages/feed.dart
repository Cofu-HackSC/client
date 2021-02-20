import 'package:app/components/feed_tile.dart';
import 'package:app/components/header.dart';
import 'package:app/models/cook_profile.dart';
import 'package:app/models/item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  final List<Item> items = [
    new Item(
      name: 'Pretzels',
      avgItemRating: 4.6,
      delivery: true,
      pickup: true,
      ingredients: 'Flour, Milk, Yeast, Olive Oil, Sugar, Salt, Baking Soda',
      description: 'A yummy yummy for your tummy treat made by yours truely.',
      cost: 1.60,
      stock: 16,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        Header('Feed'),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CupertinoSearchTextField(),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (c, i) => FeedTile(
                item: items[i],
                cook: new CookProfile(
                    name: 'Jason Telanoff',
                    bio: 'Likes Eating... A lot',
                    address: '1234 ThisIsThe Way',
                    emailContact: true,
                    contact: 'jason.telanoff@gmail.com')),
            childCount: items.length,
          ),
        )
      ],
    );
  }
}
