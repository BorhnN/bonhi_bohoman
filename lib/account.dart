class Account {
  String name;
  String accNo;
  int amountReceived;
  bool isEnabled;
  String type;

  Account.fromMap(Map<dynamic, dynamic> value) {
    name = value['name'];
    accNo = value['acc_no'].toString();
    amountReceived = value['amount_received'];
    isEnabled = value['enabled'];
    type = value['type'];
  }
  String toString() {
    return "Name: $name, account Number: $accNo";
  }
}
