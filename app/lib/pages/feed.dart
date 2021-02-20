import 'package:app/components/feed_tile.dart';
import 'package:app/components/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        Header('Feed'),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: CupertinoSearchTextField(),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            FeedTile(),
          ]),
        )
      ],
    );
  }
}
