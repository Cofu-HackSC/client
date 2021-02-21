import 'dart:convert';

import 'package:app/models/session.dart';
import 'package:app/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class CookProfile extends User {
  String insuranceProofURI, foodLicenseURI, deliveryDistance;

  CookProfile({
    this.insuranceProofURI,
    this.foodLicenseURI,
    this.deliveryDistance,
    String id,
    String name,
    String bio,
    String photoURL,
    String address,
    String location,
    bool emailContact,
    String contact,
  }) : super(
          id: id,
          name: name,
          bio: bio,
          photoURL: photoURL,
          address: address,
          location: location,
          emailContact: emailContact,
          contact: contact,
        );

  factory CookProfile.fromJSON(dynamic json) => CookProfile(
        id: json['id'],
        name: json['name'].toString(),
        bio: json['bio'],
        photoURL: json['photourl'],
        location: json['location'].toString(),
        address: json['address'],
      );

  static Future<CookProfile> load(Session session) async {
    Response json =
        await get('https://cofu-305406.wl.r.appspot.com/me', headers: {
      'Cookie': 'connect.sid=' + session.session,
    });
    try {
      CookProfile profile = CookProfile.fromJSON(jsonDecode(json.body)[0]);

      return profile;
    } catch (e) {
      throw e;
    }
  }
}
