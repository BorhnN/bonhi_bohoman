import 'dart:convert';

import 'package:bonhi_bohoman/donor.dart';
import 'package:flutter/material.dart';

class DonorsFragment extends StatelessWidget {
  final List<Donor> list;

  DonorsFragment(this.list);
  @override
  Widget build(BuildContext context) {
    print(list.length);
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context,index){
        var item = list[index];
        return ListTile(
          title: Text(item.name),
          subtitle: Image.memory(base64Decode(item.photo)),
          trailing: Text(item.phone),

        );
      }
    );
  }
}
