import 'package:app/global/app_theme.dart';
import 'package:app/pages/post_food.dart';
import 'package:flutter/material.dart';

import '../components/feed_tile.dart';
import '../components/header.dart';
import '../components/themed_text.dart';
import '../models/cook_profile.dart';
import '../models/item.dart';

class CookProfilePage extends StatelessWidget {
  final CookProfile cook;
  final bool showBack;
  CookProfilePage(this.cook, {this.showBack = true});

  final List<Item> items = [
    new Item(
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: cook.id == me.id
            ? Padding(
                padding: const EdgeInsets.only(bottom: 48),
                child: FloatingActionButton(
                  backgroundColor: AppTheme.logoGreen,
                  elevation: 0,
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (c) => PostFoodPage())),
                  child: Icon(Icons.add),
                ),
              )
            : null,
        body: CustomScrollView(
          slivers: [
            Header(
              cook.name,
              showBack: showBack,
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 22),
                child: Center(
                  child: Hero(
                    tag: cook.id,
                    child: ClipRRect(
                      child: Image.asset(
                        'assets/example_profile.jpg',
                        height: 150,
                        width: 150,
                        fit: BoxFit.contain,
                      ),
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                ),
              ),
              ThemedText(cook.bio),
              ThemedText(
                cook.address,
                type: Type.subtitle,
              ),
              Divider(),
            ])),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (c, i) => FeedTile(item: items[i]),
                childCount: items.length,
              ),
            )
          ],
        ));
  }
}
