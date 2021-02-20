import 'package:app/components/header.dart';
import 'package:app/components/themed_text.dart';
import 'package:app/global/app_theme.dart';
import 'package:app/models/item.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ItemInfoPage extends StatelessWidget {
  final Item item;
  ItemInfoPage(this.item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SlidingUpPanel(
      margin: EdgeInsets.symmetric(horizontal: 8),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16), topRight: Radius.circular(16)),
      color: AppTheme.backgroundLighGray,
      minHeight: 420,
      maxHeight: 560,
      parallaxEnabled: true,
      parallaxOffset: 0.2,
      panel: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ThemedText(
                  item.name,
                  type: Type.h1,
                ),
                Stars(item.avgItemRating),
                Divider(),
                ThemedText(
                    '${item.delivery ? item.pickup ? 'Delivery and Pickup' : 'Delivery' : item.pickup ? 'Pickup' : 'Error'}'
                    // type: Type.subtitle,
                    ),
                Divider(),
                ThemedText(
                  item.description,
                  type: Type.subtitle,
                ),
                Divider(),
                ThemedText(
                  item.ingredients,
                  type: Type.subtitle,
                ),
              ],
            ),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            collapsedHeight: 64,
            expandedHeight: 72,
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: Icon(
                Icons.chevron_left,
                color: AppTheme.primaryText,
                size: 40,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: ThemedText(
              'Item Info',
              type: Type.h1,
              color: AppTheme.primaryText,
            ),
            backgroundColor: Color(0x00),
          ),
          SliverFillRemaining(
            child: Image.asset(
              'assets/example_img.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
            ),
          ),
        ],
      ),
    ));
  }
}

class Stars extends StatelessWidget {
  final double stars;
  Stars(this.stars);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets;

    widgets = List.generate(
      stars.ceil(),
      (i) => i < stars.floor()
          ? Icon(
              Icons.star_rounded,
              color: AppTheme.star,
            )
          : ClipPath(
              clipper: BoxClipper(stars % 1),
              clipBehavior: Clip.hardEdge,
              child: Icon(
                Icons.star_rounded,
                color: AppTheme.star,
              )),
    );

    widgets.insert(0, ThemedText(stars.toString() + ' '));

    return Row(children: widgets);
  }
}

class BoxClipper extends CustomClipper<Path> {
  final double clipRatio;
  BoxClipper(this.clipRatio);

  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width * clipRatio, size.height);
    path.lineTo(size.width * clipRatio, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
