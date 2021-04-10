import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:namaa_employee/welcoming%20pages/welcomePage.dart';

import '../main.dart';

class LoginPage extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();

  void _actionperformed(BuildContext context) {
    if (_formKey.currentState.validate()) {
      //createDonation(donor, program, wireNumber, amount, note);
    }
  }

  @override
  Widget build(BuildContext context, watch) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.arrow_forward,
                        size: 50,
                      ),
                      onPressed: () {
                        context.read(welcomePageStateProvider).state = 1;
                      })
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: Text(
                  "التسجيل ",
                  style: TextStyle(fontSize: 45, color: green),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: new TextFormField(
                  decoration: new InputDecoration(
                    suffixIcon: Icon(Icons.phone_android),
                    labelText: "رقم الجوال",
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
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: new TextFormField(
                  obscureText: true,
                  decoration: new InputDecoration(
                    suffixIcon: Icon(Icons.lock),
                    labelText: "كلمه المرور",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(2.0),
                      borderSide: new BorderSide(),
                    ),
                    //fillColor: Colors.green
                  ),
                  validator: (val) =>
                      val.length < 6 ? 'Password too short.' : null,
                  // onSaved: (val) => _password = val,
                  // obscureText: _obscureText,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: FlatButton(
                    height: 60,
                    color: green,
                    onPressed: () {
                      _actionperformed(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "تسجيل",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
