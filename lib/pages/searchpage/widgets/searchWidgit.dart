import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../search.dart';

class SearchWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final searchState = watch(searchStateProvider).state;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: FlatButton(
              height: 57,
              onPressed: () {
                context.read(searchStateProvider).state = 2;
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Icon(
                  //   Icons.search,
                  //   color: Colors.white,
                  // ),
                  Text(
                    "بحث",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              color: green,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.66,
            child: new TextFormField(
              decoration: new InputDecoration(
                suffixIcon: Icon(Icons.phone_android),
                labelText: "رقم الجوال المتبرع",
                fillColor: Colors.white,
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(2.0),
                  borderSide: new BorderSide(),
                ),
                //fillColor: Colors.green
              ),
              validator: (val) {
                if (val.length == 0) {
                  return "Email cannot be empty";
                } else {
                  return null;
                }
              },
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
              style: new TextStyle(
                fontFamily: "Poppins",
              ),
            ),
          )
        ],
      ),
    );
  }
}
