import 'dart:html';

class User {
  String id, name, bio, photoURL, address, provider, providerID;
  Geolocation location;
  bool isCook, emailContact;
  String contact;

  User({
    this.id,
    this.name,
    this.bio,
    this.photoURL,
    this.address,
    this.provider,
    this.providerID,
    this.location,
    this.isCook,
    this.emailContact,
    this.contact,
  });
}
