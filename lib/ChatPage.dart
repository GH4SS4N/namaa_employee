import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:namaa_employee/pages/employee/searchpage/search.dart';

import 'main.dart';

class ChatPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 10, 20, 10),
                color: gray,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "الدعم الفني",
                          style: TextStyle(fontSize: 45, color: green),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                icon: Icon(
                                  Icons.arrow_forward,
                                  size: 40,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 0.5,
                color: Colors.black.withOpacity(0.5),
              ),
              Expanded(
                  child: Container(
                color: gray,
                child: ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    shrinkWrap: true,
                    itemCount: 50,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Container(
                            color: green.withOpacity(0.8),
                            margin: EdgeInsets.all(8),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("data"),
                            ),
                          ),
                        ],
                      );
                    }),
              )),
              Container(
                height: 1,
                color: Colors.black.withOpacity(0.4),
              ),
              Container(
                color: yallow,
                padding: EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: FlatButton(
                        minWidth: MediaQuery.of(context).size.width * 0.23,
                        height: 57,
                        onPressed: () async {
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
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width * 0.73,
                      child: TextFormField(
                        enableInteractiveSelection: true,
                        expands: false,

                        minLines: null,
                        maxLines: null,
                        decoration: new InputDecoration(
                          suffixIcon: Icon(Icons.mail),
                          labelText: "نص الرسالة",
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
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
