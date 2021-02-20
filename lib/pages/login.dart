import 'dart:ui';

import 'package:app/components/button.dart';
import 'package:app/components/themed_text.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final PanelController panelController = new PanelController();

  String get username => usernameController.text;
  String get password => passwordController.text;

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      controller: panelController,
      backdropEnabled: true,
      minHeight: 0,
      maxHeight: MediaQuery.of(context).size.height * 0.9,
      borderRadius: BorderRadius.circular(
        40,
      ),
      defaultPanelState: PanelState.CLOSED,
      panel: ClipRRect(
        child: Scaffold(
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: ThemedText(
                    'Sign Up',
                    type: Type.h1,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Username',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Name',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Bio',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Location',
                    fillColor: Colors.grey[300],
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.location_pin,
                      ),
                    ),
                    filled: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Password',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                ),
              ),
            ],
          ),
        ),
        borderRadius: BorderRadius.circular(
          40,
        ),
      ),
      body: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/example_img.jpg',
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height - 300,
                ),
                Container(
                  color: Colors.white,
                  height: 300,
                ),
              ],
            ),
            CustomScrollView(
              reverse: true,
              slivers: [
                SliverToBoxAdapter(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    child: Container(
                      color: Colors.white,
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'COFU',
                              style: TextStyle(
                                fontSize: 40,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TextField(
                              controller: usernameController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Username',
                                fillColor: Colors.grey[300],
                                filled: true,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TextField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Password',
                                fillColor: Colors.grey[300],
                                filled: true,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: Button(
                                'Sign In',
                                onPressed: () {},
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: SelectableText(
                              'Sign Up',
                              onTap: () => panelController.open(),
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
