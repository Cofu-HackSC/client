import 'package:app/components/button.dart';
import 'package:app/components/themed_text.dart';
import 'package:app/global/app_theme.dart';
import 'package:app/models/item.dart';
import 'package:app/pages/order.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ItemInfoPage extends StatefulWidget {
  final Item item;
  ItemInfoPage({@required this.item});

  @override
  _ItemInfoPageState createState() => _ItemInfoPageState();
}

class _ItemInfoPageState extends State<ItemInfoPage> {
  PanelController controller;

  @override
  void initState() {
    controller = new PanelController();
    openPanel();
    super.initState();
  }

  void openPanel() async {
    await Future.delayed(const Duration(milliseconds: 300));
    controller.open();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SlidingUpPanel(
      isDraggable: false,
      controller: controller,
      margin: EdgeInsets.symmetric(horizontal: 8),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16), topRight: Radius.circular(16)),
      color: AppTheme.backgroundLighGray,
      minHeight: 0,
      maxHeight: 570,
      parallaxEnabled: true,
      parallaxOffset: 0.02,
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
                  widget.item.name,
                  type: Type.h1,
                ),
                Stars(widget.item.avgItemRating),
                Divider(),
                ThemedText('\$' + widget.item.cost.toStringAsFixed(2)),
                ThemedText(
                    '${widget.item.delivery ? widget.item.pickup ? 'Delivery and Pickup' : 'Delivery' : widget.item.pickup ? 'Pickup' : 'Error'}'),
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
                          ThemedText(widget.item.cook.name),
                          ThemedText('View more from this chef >',
                              type: Type.subtitle),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(),
                ThemedText(
                  widget.item.description,
                  type: Type.subtitle,
                  textAlign: TextAlign.left,
                ),
                Divider(),
                ThemedText(
                  widget.item.ingredients,
                  type: Type.subtitle,
                  textAlign: TextAlign.left,
                ),
                Divider(),
                SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: Button(
                    'Reserve Pickup',
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (c) => OrderPage(
                                  widget.item,
                                  pickup: true,
                                ))),
                  ),
                ),
                SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: Button(
                    'Order for Delivery',
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (c) => OrderPage(
                                  widget.item,
                                  pickup: false,
                                ))),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Hero(
            child: Image.asset(
              'assets/example_img.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
            ),
            tag: widget.item.itemID,
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
