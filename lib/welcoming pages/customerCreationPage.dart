import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:namaa_employee/main.dart';

class CustomerCreationPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
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
                  onChanged: (val) {},
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
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: new TextFormField(
                  decoration: new InputDecoration(
                    suffixIcon: Icon(Icons.policy),
                    labelText: "رقم الاحوال",
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
                  decoration: new InputDecoration(
                    suffixIcon: Icon(Icons.money),
                    labelText: "رقم الحساب",
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
                child: new TextFormField(
                  obscureText: true,
                  decoration: new InputDecoration(
                    suffixIcon: Icon(Icons.lock_outline),
                    labelText: "تاكيد كلمه المرور",
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
                    onPressed: () {},
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
