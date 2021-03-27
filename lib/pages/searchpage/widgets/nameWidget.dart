import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../search.dart';

class NameWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final searchState = watch(searchStateProvider).state;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Container(
            // width: MediaQuery.of(context).size.width * 0.66,
            child: new TextFormField(
              decoration: new InputDecoration(
                suffixIcon: Icon(Icons.person),
                labelText: "اسم المتبرع",
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
              // inputFormatters: [
              //   WhitelistingTextInputFormatter.digitsOnly
              // ],
              keyboardType: TextInputType.name,
              style: new TextStyle(
                fontFamily: "Poppins",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: FlatButton(
              height: 57,
              onPressed: () {
                context.read(searchStateProvider).state = 3;
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  Text(
                    "اضافه",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              color: green,
            ),
          ),
        ],
      ),
    );
  }
}
