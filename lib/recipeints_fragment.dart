import 'dart:convert';

import 'package:bonhi_bohoman/recipient.dart';
import 'package:flutter/material.dart';

class RecipientsFragment extends StatelessWidget {
  RecipientsFragment(this.list);

  final List<Recipient> list;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        var item = list[index];
        return ListTile(
          title: Text(list[index].fullName),
          subtitle: Text(list[index].location),
        );
      },
    );
  }
}
