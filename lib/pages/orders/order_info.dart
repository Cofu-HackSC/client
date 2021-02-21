import 'package:app/components/button.dart';
import 'package:app/components/themed_text.dart';
import 'package:app/global/app_theme.dart';
import 'package:app/models/item.dart';
import 'package:app/models/sale.dart';
import 'package:app/pages/feed/order.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../cook_profile.dart';

class OrderInfoPage extends StatefulWidget {
  final Sale sale;
  OrderInfoPage({@required this.sale});

  @override
  _OrderInfoPageState createState() => _OrderInfoPageState();
}

class _OrderInfoPageState extends State<OrderInfoPage> {
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
      panel: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ThemedText(
              widget.sale.item.name,
              type: Type.h1,
            ),
            Stars(widget.sale.item.avgItemRating),
            Divider(),
            ThemedText('${widget.sale.amount} x \$' +
                widget.sale.item.cost.toStringAsFixed(2)),
            ThemedText(
              widget.sale.pickup ? 'Pickup' : 'Delivery',
            ),
            Divider(),
            TextButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (c) => CookProfilePage(widget.sale.item.cook))),
              child: Row(
                children: [
                  Hero(
                    tag: widget.sale.item.cook.id,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/example_profile.jpg',
                        height: 70,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ThemedText(widget.sale.item.cook.name),
                      ThemedText('View more from this chef >',
                          type: Type.subtitle),
                    ],
                  ),
                ],
              ),
            ),
            Divider(),
            ThemedText(
              widget.sale.item.description,
              type: Type.subtitle,
              textAlign: TextAlign.left,
            ),
            Divider(),
            ThemedText(
              widget.sale.item.ingredients,
              type: Type.subtitle,
              textAlign: TextAlign.left,
            ),
            Divider(),
            SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: Button(
                'Cancel Order',
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (c) => OrderPage(
                              widget.sale.item,
                              pickup: false,
                            ))),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Hero(
            child: Image.asset(
              'assets/example_img.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
            ),
            tag: widget.sale.item.itemID,
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
          if (widget.sale.fulfilled)
            Positioned(
              top: 60,
              right: 8,
              child: FloatingActionButton(
                tooltip: 'Fulfilled',
                mini: true,
                child: Icon(Icons.check),
                onPressed: () {},
                backgroundColor: AppTheme.logoGreen,
              ),
            )
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
