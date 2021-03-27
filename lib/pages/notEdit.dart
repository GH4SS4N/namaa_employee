import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'searchpage/search.dart';

class NotEdit extends ConsumerWidget {
  DateTime _date = DateTime(2020, 11, 17);

  void _selectDate(BuildContext context) async {
    final DateTime newDate = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2017, 1),
      lastDate: DateTime(2022, 7),
      helpText: 'Select a date',
    );
    if (newDate != null) {
      _date = newDate;
    }
  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final searchState = watch(searchStateProvider).state;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  //color: gray,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                            child: Text(
                              "اضافة تنبيه",
                              style: TextStyle(fontSize: 45, color: green),
                            ),
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.arrow_forward,
                                size: 50,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              })
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
                                  Icons.notifications,
                                  color: Colors.white.withOpacity(0.9),
                                  size: 60,
                                )),
                          ),
                        ],
                      ),
                      Text("name"),
                      Text("05XXXXXXXX")
                    ],
                  ),
                ),

                //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                        child: Stack(
                          children: [
                            TextFormField(
                              decoration: new InputDecoration(
                                suffixIcon: Icon(Icons.calendar_today),
                                labelText: "التاريخ",
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
                            InkWell(
                              onTap: () {
                                _selectDate(context);
                                print("object");
                              },
                              child: Container(
                                //color: green,
                                height: 60,
                                width: double.maxFinite,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "حالة التكرار",
                            style: TextStyle(fontSize: 25, color: green),
                          ),
                        ],
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                          child: Container(
                              //@@@@@@@@@@@@@@@@@@@@
                              )),
                      Row(
                        children: [
                          Text(
                            "ملاحظات",
                            style: TextStyle(fontSize: 25, color: green),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                        child: TextFormField(
                          expands: false,
                          minLines: null,
                          maxLines: null,
                          decoration: new InputDecoration(
                            suffixIcon: Icon(Icons.note_add),
                            labelText: "ملاحظات المتبرع",
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
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                        child: TextFormField(
                          enableInteractiveSelection: true,
                          expands: false,

                          minLines: null,
                          maxLines: null,
                          decoration: new InputDecoration(
                            suffixIcon: Icon(Icons.mail),
                            labelText: "نص الرسالة الى المتبرع",
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlatButton(
                            height: 40,
                            onPressed: () {
                              Navigator.pop(context);
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
                          FlatButton(
                            height: 40,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                                Text(
                                  "حذف",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            color: Colors.red.withRed(-60),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
