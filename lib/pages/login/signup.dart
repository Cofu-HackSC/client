import 'dart:convert';

import 'package:app/components/custom_text_field.dart';
import 'package:app/models/session.dart';
import 'package:flutter/material.dart';
import 'package:app/components/button.dart';
import 'package:app/global/app_theme.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';

import '../../components/themed_text.dart';

class SignUpPage extends StatefulWidget {
  final Session session;

  const SignUpPage({@required this.session});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController usernameController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController bioController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  double lat;
  double long;

  String get username => usernameController.text;
  String get name => nameController.text;
  String get bio => bioController.text;
  String get address => addressController.text;
  String get password => passwordController.text;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Scaffold(
        body: Stack(
          children: [
            ListView(
              padding: EdgeInsets.only(top: 100),
              children: [
                CustomTextField(
                  controller: usernameController,
                  labelText: 'Username',
                ),
                CustomTextField(
                  controller: nameController,
                  labelText: 'Name',
                ),
                CustomTextField(
                  controller: bioController,
                  labelText: 'Bio',
                ),
                CustomTextField(
                  controller: addressController,
                  labelText: 'Address',
                  onSubmit: getLocationFromAddress,
                  trailing: IconButton(
                    color: Colors.black,
                    icon: Icon(
                      Icons.location_pin,
                      color: Colors.black,
                    ),
                    onPressed: () async {
                      print('PRESSED');
                      PermissionStatus permission =
                          await Location.instance.hasPermission();
                      bool hasPermission =
                          permission == PermissionStatus.granted ||
                              permission == PermissionStatus.grantedLimited;
                      if (hasPermission) {
                        getLocation();
                      } else {
                        permission =
                            await Location.instance.requestPermission();
                        hasPermission =
                            permission == PermissionStatus.granted ||
                                permission == PermissionStatus.grantedLimited;
                        if (hasPermission) {
                          getLocation();
                        }
                      }
                    },
                  ),
                ),
                CustomTextField(
                  controller: passwordController,
                  labelText: 'Password',
                ),
                SizedBox(height: 22),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Button(
                    'Sign Up',
                    onPressed: () async {
                      await login();
                    },
                  ),
                )
              ],
            ),
            Container(
              height: 89,
              color: AppTheme.buttonText,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ThemedText(
                      'Sign Up',
                      type: Type.h1,
                    ),
                  ),
                  Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40), topRight: Radius.circular(40)),
    );
  }

  Future<void> login() {
    return http
        .post(
      'https://cofu-305406.wl.r.appspot.com/auth/signup',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'username': username,
        'name': name,
        'bio': bio,
        'address': address,
        'password': password,
        'lat': lat,
        'long': long
      }),
    )
        .then((value) {
      switch (value.statusCode) {
        case 200:
          widget.session.fromSetCookie(value.headers['set-cookie']);
          return Navigator.of(context).pushNamed("/home");
        default:
          print(value.body);
          return null;
      }
    });
  }

  void getLocationFromAddress(String value) async {
    http
        .get(
      'https://maps.googleapis.com/maps/api/geocode/json?address=' +
          value +
          '&key=' +
          'AIzaSyBK957EpSptpEX7pVJ4yV47-BMQ6EVTQjA',
    )
        .then((value) {
      lat = jsonDecode(value.body)['geometry']['location']['lat'];
      long = jsonDecode(value.body)['geometry']['location']['lng'];
    });
  }

  void getLocation() async {
    LocationData data = await Location.instance.getLocation();

    http
        .get('https://maps.googleapis.com/maps/api/geocode/json?latlng=' +
            data.latitude.toString() +
            ',' +
            data.longitude.toString() +
            '&key=' +
            'AIzaSyBK957EpSptpEX7pVJ4yV47-BMQ6EVTQjA')
        .then((value) {
      print('VALUEEEEE');
      if (jsonDecode(value.body)['results'][0]['formatted_address'] != null) {
        lat = data.latitude;
        long = data.longitude;
        addressController.text =
            jsonDecode(value.body)['results'][0]['formatted_address'];
      }
    });
  }
}
