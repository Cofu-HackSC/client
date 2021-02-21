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
        avgItemRating: 4.9,
        delivery: true,
        pickup: true,
        ingredients: 'Flour, Milk, Yeast, Olive Oil, Sugar, Salt, Baking Soda',
        description: 'A yummy yummy for your tummy treat made by yours truely.',
        cost: 1.60,
        stock: 16,
        cook: CookProfile(
          location: 'Los Angeles',
          photoURL: '',
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
        delivery: false,
        pickup: true,
        ingredients:
            'Flour, Beef, Milk, Onion, Cheddar Cheese, Avocado, Yeast, Tomato, Olive Oil, Sugar, Salt, Baking Soda, etc.',
        description:
            'The Burger is better than the side dish, which isn\'t included',
        cost: 8.45,
        stock: 10,
        cook: CookProfile(
          name: 'Jason Telanoff',
          bio: 'Likes Eating... A lot',
          address: '1234 ThisIsThe Way, Some City',
          emailContact: true,
          contact: 'jason.telanoff@gmail.com',
          id: 'fewms',
        ),
      ),
      new Item(
        itemID: 'eefdsaij',
        sellerID: ' fiaslkj fe',
        photoURL: 'example_img3.jpg',
        name: 'Jason\'s Pretzel Buns',
        avgItemRating: 4.8,
        delivery: true,
        pickup: true,
        ingredients:
            'Flour, Milk, Yeast, Olive Oil, Sugar, Salt, Baking Soda, etc.',
        description:
            'Slightly worse than normal pretzels, but great for burgers and sandwiches.',
        cost: 4.2,
        stock: 24,
        cook: CookProfile(
          name: 'Jason Telanoff',
          bio: 'Likes Eating... A lot',
          address: '1234 ThisIsThe Way, Some City',
          emailContact: true,
          contact: 'jason.telanoff@gmail.com',
          id: 'fewms',
        ),
      ),
      new Item(
        itemID: 'eir eipfdkljs',
        sellerID: ' nceiow ',
        photoURL: 'example_img4.jpg',
        name: 'Jason\'s Chocolate Apple Slices',
        avgItemRating: 4.2,
        delivery: true,
        pickup: false,
        ingredients: 'Apple, Chocolate',
        description: 'An oldie but a goodie.',
        cost: 0.75,
        stock: 36,
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
        ),
        SliverToBoxAdapter(
            child: SizedBox(
          height: 60,
        ))
      ],
    );
  }
}

enum LoadState {
  Error,
  Loading,
  Loaded,
}
