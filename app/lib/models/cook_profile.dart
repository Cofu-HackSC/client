import 'package:app/models/user.dart';
import 'package:flutter/foundation.dart';

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
}
