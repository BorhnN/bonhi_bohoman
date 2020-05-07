import 'dart:core';

class Recipient {
  String name;
  String phone;
  String address;
  String photo;

  Recipient.fromMap(Map<dynamic, dynamic> value) {
    name = value['name'];
    phone = value['phone'];
    address = value['address'];
    photo = value['photo'];
  }
  String toString() {
    return "Name: $name, Address: $address";
  }
}
