import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:namaa_employee/main.dart';
import 'package:namaa_employee/pages/employee/searchpage/widgets/searchWidgit.dart';
import 'package:namaa_employee/requests/reminderRequests.dart';

//import '../../../../main.dart';
import '../../../../main.dart';
import '../search.dart';

class NameWidget extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  String name;
  String phoneNumber;
  void _actionperformed(BuildContext context) {
    //createReminderDonor("Ghassan", "0588888888");
    if (_formKey.currentState.validate()) {
      _formKey.currentContext;
      createReminderDonor(name, phoneNumber)
          .whenComplete(() => print("object++"))
          .then((value) {
        context.read(nameProvider).state = name;
        getReminderDonors(context.read(phoneNumberProvider).state)
            .then((value) => context.read(donerProvider).state = value[0]);
        print(context.read(donerProvider).state.toString());
      });
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
                    return "name cannot be empty";
                  } else {
                    return null;
                  }
                },
                onChanged: (val) {
                  name = val;
                  phoneNumber = context.read(phoneNumberProvider).state;
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
                  _actionperformed(context);
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
      ),
    );
  }
}
