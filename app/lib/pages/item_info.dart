import 'package:app/components/button.dart';
import 'package:app/components/header.dart';
import 'package:app/components/themed_text.dart';
import 'package:app/global/app_theme.dart';
import 'package:app/models/cook_profile.dart';
import 'package:app/models/item.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ItemInfoPage extends StatelessWidget {
  final Item item;
  final CookProfile cook;
  ItemInfoPage({@required this.item, @required this.cook});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SlidingUpPanel(
      margin: EdgeInsets.symmetric(horizontal: 8),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16), topRight: Radius.circular(16)),
      color: AppTheme.backgroundLighGray,
      minHeight: 470,
      maxHeight: 570,
      parallaxEnabled: true,
      parallaxOffset: 0.2,
      padding: EdgeInsets.only(top: 16),
      panel: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ThemedText(
                  cook.name.split(' ')[0] + '\'s ' + item.name,
                  type: Type.h1,
                ),
                Stars(item.avgItemRating),
                Divider(),
                ThemedText('\$' + item.cost.toStringAsFixed(2)),
                ThemedText(
                    '${item.delivery ? item.pickup ? 'Delivery and Pickup' : 'Delivery' : item.pickup ? 'Pickup' : 'Error'}'),
                Divider(),
                TextButton(
                  onPressed: () {
                    // Go to the profile
                  },
                  child: Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/example_profile.jpg',
                          height: 70,
                        ),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ThemedText(cook.name),
                          ThemedText('View more from this chef >',
                              type: Type.subtitle),
                        ],
                      ),
                    ],
                  ),
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
                Divider(),
                SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: Button(
                    'Reserve Pickup',
                    onPressed: () {
                      // Order Pickup
                    },
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Button(
                    'Order for Delivery',
                    onPressed: () {
                      // Order Delivery
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/example_img.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
          ),
          AppBar(
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
            backgroundColor: Color(0x00),
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
