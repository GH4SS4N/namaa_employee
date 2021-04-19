//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:namaa_employee/requests/reminderRequests.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
//import 'package:parse_server_sdk/parse_server_sdk.dart';

//import '../../../../requests.dart';
import '../../../../main.dart';
import '../search.dart';

final phoneNumberProvider = StateProvider<String>((ref) {
  return "";
});

final donerProvider = StateProvider<ParseObject>((ref) {
  return null;
});

final reminderProvider = StateProvider<List<ParseObject>>((ref) {
  return null;
});

final nameProvider = StateProvider<String>((ref) {
  return "";
});

class SearchWidget extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  String phoneNumber = "";

  void _actionperformed(BuildContext context) {
    //createReminderDonor("Ghassan", "0588888888");
    if (_formKey.currentState.validate()) {
      _formKey.currentContext;
      var x = getReminderDonors(phoneNumber).whenComplete(() {
        print(" x finished");
      }).then((value) {
        print("x=" + value.toString());
        if (value.toString() == "null") {
          print("object");
          context.read(phoneNumberProvider).state = phoneNumber;
          context.read(searchStateProvider).state = 2;
        } else {
          context.read(phoneNumberProvider).state = phoneNumber;
          context.read(nameProvider).state = value[0].get("name");

          context.read(donerProvider).state = value[0];
          getReminders(value[0])
              .whenComplete(() => print("getreminders = "))
              .then((value) {
            print(value.toString());
            context.read(reminderProvider).state = value;
            context.read(searchStateProvider).state = 3;
          });
        }
      });

      // then((value) {
      //   if (value.toString() == null) {
      //     x.read(nameProvider).state = "";
      //   } else {
      //     x.read(searchStateProvider).state = 3;
      //     print("object" + value.toString());
      //   }
      // });
    }
  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final searchState = watch(searchStateProvider).state;
    final phoneState = watch(phoneNumberProvider).state;
    final nameState = watch(nameProvider).state;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Form(
        key: _formKey,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: FlatButton(
                minWidth: MediaQuery.of(context).size.width * 0.27,
                height: 57,
                onPressed: () async {
                  _actionperformed(context);
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
              width: MediaQuery.of(context).size.width * 0.60,
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
                    return "cannot be empty";
                  } else if (val.length != 10) {
                    return "phone number leangth should be 10";
                  } else if (val.startsWith("05")) {
                    return null;
                  } else {
                    return "Phone number should start with 05";
                  }
                },
                maxLength: 10,
                maxLengthEnforced: true,
                onChanged: (vall) {
                  phoneNumber = vall;
                  print("PN = " + phoneNumber);
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
      ),
    );
  }
}
