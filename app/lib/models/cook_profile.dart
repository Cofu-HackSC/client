import 'package:app/models/user.dart';
import 'package:flutter/foundation.dart';

class CookProfile extends User {
  String insuranceProofURI, foodLicenseURI, deliveryDistance;

  CookProfile({
    this.insuranceProofURI,
    this.foodLicenseURI,
    this.deliveryDistance,
    @required String id,
    @required String name,
    @required String bio,
    @required String photoURL,
    @required String address,
    @required String location,
    @required bool emailContact,
    @required String contact,
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
}
