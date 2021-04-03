import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:namaa_employee/pages/employee/searchpage/widgets/nameWidget.dart';

import '../main.dart';

class SendBroudCastPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
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
                          "اضافة رسائل عامة",
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
                              Icons.campaign,
                              color: Colors.white.withOpacity(0.9),
                              size: 60,
                            )),
                      ),
                    ],
                  ),

                  // Text(""),
                  // Text("05xxxxxxxx"),
                ],
              ),
            ),

            //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    // width: MediaQuery.of(context).size.width * 0.66,
                    child: TextFormField(
                      enableInteractiveSelection: true,
                      expands: false,

                      minLines: null,
                      maxLines: null,
                      decoration: new InputDecoration(
                        suffixIcon: Icon(Icons.campaign),
                        labelText: "نص الاعلان",
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
                      minWidth: 120,
                      onPressed: () {
                        //context.read(searchStateProvider).state = 3;
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.send,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "ارسال",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      color: green,
                    ),
                  ),
                ],
              ),
            )
          ]),
    );
  }
}