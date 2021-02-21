import 'dart:io';

import 'package:app/components/button.dart';
import 'package:app/components/custom_text_field.dart';
import 'package:app/components/spaced_row.dart';
import 'package:app/components/themed_text.dart';
import 'package:app/global/app_theme.dart';
import 'package:app/models/session.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import '../models/cook_profile.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'cook_profile.dart';

class PostFoodPage extends StatefulWidget {
  final CookProfile profile;
  final Session session;

  const PostFoodPage({
    @required this.profile,
    @required this.session,
  });

  @override
  _PostFoodPageState createState() => _PostFoodPageState();
}

class _PostFoodPageState extends State<PostFoodPage> {
  PanelController controller;

  final TextEditingController nameController = TextEditingController();
  bool pickup = true, delivery = false;
  int stock;
  final TextEditingController costController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController ingredientsController = TextEditingController();

  File image;

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
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      color: AppTheme.backgroundLighGray.withOpacity(0.96),
      minHeight: 0,
      maxHeight: 570,
      parallaxEnabled: true,
      parallaxOffset: 0.02,
      panel: Padding(
        padding: EdgeInsets.only(bottom: 0),
        child: SizedBox(
          height: 560,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            child: ListView(
              padding: EdgeInsets.only(top: 10, bottom: 80),
              children: [
                CustomTextField(
                  labelText: 'Name',
                  controller: nameController,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ThemedText('Pickup'),
                      Switch.adaptive(
                        activeColor: AppTheme.logoGreen,
                        onChanged: (bool value) => setState(
                          () {
                            pickup = value;
                          },
                        ),
                        value: pickup,
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
                      Switch.adaptive(
                        activeColor: AppTheme.logoGreen,
                        onChanged: (bool value) => setState(
                          () {
                            delivery = value;
                          },
                        ),
                        value: delivery,
                      ),
                    ],
                  ),
                ),
                SpacedRow(
                  ThemedText('Order Quantity'),
                  Row(children: [
                    IconButton(
                      icon: Icon(Icons.arrow_drop_down),
                      onPressed: () => setState(() {
                        if (stock > 1) stock--;
                      }),
                    ),
                    ThemedText(stock.toString()),
                    IconButton(
                      icon: Icon(Icons.arrow_drop_up),
                      onPressed: () => setState(() {
                        stock++;
                      }),
                    ),
                  ]),
                ),
                Divider(),
                CustomTextField(
                  labelText: 'Cost',
                  controller: costController,
                  trailing: Icon(
                    Icons.attach_money,
                  ),
                ),
                Divider(),
                TextButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (c) => CookProfilePage(
                        widget.profile,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Hero(
                        tag: widget.profile.id,
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
                          ThemedText(widget.profile.name),
                          ThemedText(
                            'View your profile ➡️',
                            type: Type.subtitle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(),
                CustomTextField(
                  labelText: 'Description',
                  controller: descriptionController,
                ),
                Divider(),
                CustomTextField(
                  labelText: 'Ingredients',
                  controller: ingredientsController,
                ),
                Divider(),
                SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Button(
                      'Post',
                      onPressed: () async {
                        MultipartRequest req = MultipartRequest(
                          'POST',
                          Uri.parse(
                            'https://cofu-305406.wl.r.appspot.com/item',
                          ),
                        );
                        req.headers['Cookie'] =
                            'connect.sid=' + widget.session.session;

                        req.fields.addAll({
                          'name': nameController.text,
                          'pickup': pickup.toString(),
                          'delivery': delivery.toString(),
                          'cost': costController.text,
                          'description': descriptionController.text,
                          'ingredients': ingredientsController.text,
                          'stock': stockController.text,
                        });

                        req.files.add(
                          await MultipartFile.fromPath(
                            'file',
                            image.path,
                          ),
                        );

                        req.send();

                        showCupertinoDialog(
                          context: context,
                          builder: (c) => CupertinoAlertDialog(
                            title: Text(
                              'We are processing your post',
                            ),
                            content:
                                Text('It will be visible in a few minutes.'),
                          ),
                        ).then((c) {
                          Navigator.pop(
                            c,
                          );
                          Navigator.pop(
                            context,
                          );
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: TextButton(
        onPressed: () {
          print('image');
          ImagePicker().getImage(source: ImageSource.camera).then((value) {
            setState(() {
              image = File(value.path);
            });
          });
          // Add image
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
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
            if (image?.existsSync() ?? false)
              Image.file(
                image,
                height: double.infinity,
                fit: BoxFit.fill,
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
