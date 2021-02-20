import 'package:app/models/user.dart';

class CookProfile extends User {
  String insuranceProofURI, foodLicenseURI, deliveryDistance;

  CookProfile({
    this.insuranceProofURI,
    this.foodLicenseURI,
    this.deliveryDistance,
    id,
    name,
    bio,
    photoURL,
    address,
    provider,
    providerID,
    location,
    isCook,
    emailContact,
    contact,
  }) : super(
          id: id,
          name: name,
          bio: bio,
          photoURL: photoURL,
          address: address,
          provider: provider,
          providerID: providerID,
          location: location,
          isCook: isCook,
          emailContact: emailContact,
          contact: contact,
        );
}
