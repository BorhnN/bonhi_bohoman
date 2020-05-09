class Donor{
  String name;
  String phone;
  String address;
  String photo;
  
  Donor.fromMap(Map<dynamic, dynamic> value) {
    name = value['name'];
    phone = value['phone'];
    address = value['address'];
    photo = value['photo'];
  }
  String toString() {
    return "Name: $name, Address: $address";
  }
}