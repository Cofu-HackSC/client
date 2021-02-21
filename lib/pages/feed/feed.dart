import 'package:app/components/feed_tile.dart';
import 'package:app/components/header.dart';
import 'package:app/models/cook_profile.dart';
import 'package:app/models/item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<Item> items;

  @override
  void initState() {
    super.initState();
    items = [
      new Item(
        itemID: 'sdgsdgsdgesr',
        sellerID: 'sdgsdg',
        photoURL: 'example_img.jpg',
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
      new Item(
        itemID: 'eihf',
        sellerID: 'eiu hfds',
        photoURL: 'example_img2.jpg',
        name: 'Jason\'s Burger',
        avgItemRating: 4.2,
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
          id: 'fewms',
        ),
      ),
    ];
  }

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
            ),
            childCount: items.length,
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
