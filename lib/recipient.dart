import 'dart:core';

class Recipient {
  String fullName;
  String contact;
  String location;
  String occupation;

  Recipient.fromMap(Map<dynamic, dynamic> value) {
    fullName = value['fullName'];
    contact = value['contact'];
    location = value['location'];
    occupation = value['occupation'];
  }
  String toString() {
    return "Name: $fullName, Address: $location";
  }
}
