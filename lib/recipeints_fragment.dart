import 'dart:convert';

import 'package:bonhi_bohoman/recipient.dart';
import 'package:flutter/material.dart';

class RecipientsFragment extends StatelessWidget {
  RecipientsFragment(this.list);

  final List<Recipient> list;
  @override
  Widget build(BuildContext context) {
    // print(list);
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          var item = list[index];
          return ListTile(
            title: Text(list[index].name),
            subtitle: Text(list[index].address),
            trailing: Image.memory(base64Decode(item.photo)),
          );
        });
  }
}

