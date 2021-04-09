import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:namaa_employee/customer%20pages/widget/CDropdownMenu.dart';
import 'package:namaa_employee/requests/donorRequests.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
//import 'package:namaa_employee/pages/employee/searchpage/widgets/nameWidget.dart';

import '../main.dart';

class AddCharityPage extends ConsumerWidget {
  ParseObject donor;
  ParseObject program;
  String wireNumber;
  double amount;
  String note;
  final _formKey = GlobalKey<FormState>();

  void _actionperformed(BuildContext context) {
    if (_formKey.currentState.validate()) {
      //createDonation(donor, program, wireNumber, amount, note);
    }
  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final programs = watch(programsProvider).state;

    return Container(
      width: double.infinity,
      child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              //color: gray,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: Text(
                          "اضافه تبرع",
                          style: TextStyle(fontSize: 45, color: green),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: Container(
                            padding: EdgeInsets.all(20),
                            color: Colors.grey,
                            child: Icon(
                              Icons.money,
                              color: Colors.white.withOpacity(0.9),
                              size: 60,
                            )),
                      ),
                    ],
                  ),
                  Text("name"),
                  Text("05xxxxxxxx"),
                ],
              ),
            ),

            //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

            Form(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    CDropdown(
                        selectedState: programSelectedProvider,
                        options: programs == null
                            ? null
                            : programs
                                .map((parsepbject) =>
                                    parsepbject.get("name").toString())
                                .toList()),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: new TextFormField(
                        decoration: new InputDecoration(
                          suffixIcon: Icon(Icons.money),
                          labelText: "مبلغ التبرع",
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
                        onChanged: (val) {
                          amount = double.parse(val);
                        },
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
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
                          suffixIcon: Icon(Icons.search),
                          labelText: "رقم الحواله",
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
                        onChanged: (val) {
                          wireNumber = val;
                        },
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                        style: new TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      // width: MediaQuery.of(context).size.width * 0.66,
                      child: TextFormField(
                        enableInteractiveSelection: true,
                        expands: false,
                        minLines: null,
                        maxLines: null,
                        decoration: new InputDecoration(
                          suffixIcon: Icon(Icons.mail),
                          labelText: "ملاحطات اخرا",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(2.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                        onChanged: (val) {
                          note = val;
                        },
                        keyboardType: TextInputType.name,
                        style: new TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: FlatButton(
                        minWidth: 120,
                        onPressed: () {
                          //context.read(searchStateProvider).state = 3;
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            Text(
                              "موافق",
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
            )
          ]),
    );
  }
}
