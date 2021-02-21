import 'package:app/components/button.dart';
import 'package:app/components/custom_text_field.dart';
import 'package:app/components/themed_text.dart';
import 'package:app/global/app_theme.dart';
import 'package:app/models/item.dart';
import 'package:app/pages/feed/order.dart';
import 'package:flutter/material.dart';
import '../models/cook_profile.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'cook_profile.dart';

CookProfile me = new CookProfile(
  id: 'ejf;eji;ef ',
  name: 'Jason Telanoff',
  bio: 'This is my bio',
  photoURL: 'url',
  address: '1834 12th Street, Santa Monica, CA',
  location: '',
  emailContact: true,
  contact: 'jason.telanoff@gmail.com',
);

class PostFoodPage extends StatefulWidget {
  @override
  _PostFoodPageState createState() => _PostFoodPageState();
}

class _PostFoodPageState extends State<PostFoodPage> {
  PanelController controller;
  Item item;

  @override
  void initState() {
    controller = new PanelController();
    item = new Item(
      pickup: false,
      delivery: false,
    );
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
      panel: Padding(
        padding: EdgeInsets.only(bottom: 60),
        child: SizedBox(
          height: 560,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            child: ListView(
              // padding: EdgeInsets.only(top: 32, bottom: 80),
              children: [
                CustomTextField(
                  labelText: 'Name',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ThemedText('Pickup'),
                      Switch(
                        activeColor: AppTheme.logoGreen,
                        onChanged: (bool value) =>
                            setState(() => item.pickup = value),
                        value: item.pickup,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ThemedText('Delivery'),
                      Switch(
                        activeColor: AppTheme.logoGreen,
                        onChanged: (bool value) =>
                            setState(() => item.delivery = value),
                        value: item.delivery,
                      ),
                    ],
                  ),
                ),
                Divider(),
                CustomTextField(
                  labelText: 'Cost',
                  trailing: Icon(Icons.attach_money),
                ),
                // Delivery and pickup
                Divider(),
                TextButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (c) => CookProfilePage(me))),
                  child: Row(
                    children: [
                      Hero(
                        tag: me.id,
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
                          ThemedText(me.name),
                          ThemedText('View your profile >',
                              type: Type.subtitle),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(),
                CustomTextField(
                  labelText: 'Description',
                ),
                Divider(),
                CustomTextField(
                  labelText: 'Ingredients',
                ),
                Divider(),
                SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: Button(
                    'Post',
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (c) => OrderPage(
                                  item,
                                  pickup: false,
                                ))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: TextButton(
        onPressed: () {
          // Add image
        },
        child: Stack(
          children: [
            Image.asset(
              'assets/background.png',
              fit: BoxFit.cover,
              height: double.infinity,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 500,
              child: Center(
                  child: Icon(
                Icons.camera_alt,
                size: 60,
                color: AppTheme.primary,
              )),
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
