import 'package:app/global/app_theme.dart';
import 'package:app/models/session.dart';
import 'package:app/pages/post_food.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/feed_tile.dart';
import '../components/header.dart';
import '../components/themed_text.dart';
import '../models/cook_profile.dart';
import '../models/item.dart';

class CookProfilePage extends StatelessWidget {
  final CookProfile cook;
  final bool isMe;
  final bool showBack;

  CookProfilePage(
    this.cook, {
    this.showBack = true,
    this.isMe = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: isMe
            ? Padding(
                padding: const EdgeInsets.only(bottom: 48),
                child: FloatingActionButton(
                  backgroundColor: AppTheme.logoGreen,
                  elevation: 0,
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (c) => PostFoodPage(
                        session: Provider.of<Session>(c),
                        profile: cook,
                      ),
                    ),
                  ),
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
            FutureBuilder<List<Item>>(
                builder: (c, s) {
                  if (s.connectionState != ConnectionState.done ||
                      !s.hasData ||
                      s.data == null) {
                    return SliverFillRemaining(
                        child: Center(child: CircularProgressIndicator()));
                  } else {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (c, i) => FeedTile(item: s.data[i]),
                        childCount: s.data.length,
                      ),
                    );
                  }
                },
                future: Item.load(
                  Provider.of<Session>(context),
                )),
          ],
        ));
  }
}
