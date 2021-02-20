import 'package:app/models/user.dart';

class CookProfile extends User {
  String insuranceProofURI, foodLicenseURI, deliveryDistance;

  CookProfile(
      {this.insuranceProofURI, this.foodLicenseURI, this.deliveryDistance});
}
