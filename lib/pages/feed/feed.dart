import 'package:app/components/feed_tile.dart';
import 'package:app/components/header.dart';
import 'package:app/models/cook_profile.dart';
import 'package:app/models/item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  final List<Item> items;
  FeedPage(this.items);

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
