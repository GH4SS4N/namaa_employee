import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:namaa_employee/pages/employee/searchpage/search.dart';
import 'package:namaa_employee/pages/employee/searchpage/widgets/searchWidgit.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import '../../../main.dart';
import '../../../requests.dart';

// import '../../searchpage/search.dart';

final dateProvider = StateProvider<DateTime>((ref) {
  return DateTime.now();
});

final chosinReminderProvider = StateProvider<ParseObject>((ref) {
  return null;
});

class NotEdit extends ConsumerWidget {
  DateTime _date = DateTime.now();
  String donerNot;
  String massage;
  final _formKey = GlobalKey<FormState>();

  void _actionperformed(BuildContext context) {
    if (_formKey.currentState.validate()) {
      createReminder(
              context.read(donerProvider).state,
              donerNot,
              massage,
              context.read(dateProvider).state.year,
              context.read(dateProvider).state.month,
              context.read(dateProvider).state.day)
          .whenComplete(() => Navigator.pop(context));
      //Navigator.pop(context);
    }
  }

  void _selectDate(BuildContext context) async {
    final DateTime newDate = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2017, 1),
      lastDate: DateTime(2022, 7),
      helpText: 'choose the date that you wish to be remined in',
    );
    if (newDate != null) {
      context.read(dateProvider).state = newDate;
    }
  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final date = watch(dateProvider).state;
    final searchState = watch(searchStateProvider).state;
    final _reminder = watch(chosinReminderProvider).state;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                                    _reminder != null
                                        ? context
                                            .read(chosinReminderProvider)
                                            .state = null
                                        : null;
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
                          Text(context.read(nameProvider).state),
                          Text(context.read(phoneNumberProvider).state)
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
                            padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                            child: Stack(
                              children: [
                                TextFormField(
                                  decoration: new InputDecoration(
                                    suffixIcon: Icon(Icons.calendar_today),
                                    labelText: context
                                        .read(dateProvider)
                                        .state
                                        .toString(),
                                    fillColor: Colors.white,
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(2.0),
                                      borderSide: new BorderSide(),
                                    ),
                                    //fillColor: Colors.green
                                  ),
                                  // validator: (val) {
                                  //   if (val.length == 0) {
                                  //     return "Email cannot be empty";
                                  //   } else {
                                  //     return null;
                                  //   }
                                  // },
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
                          // Row(
                          //   children: [
                          //     Text(
                          //       "حالة التكرار",
                          //       style: TextStyle(fontSize: 25, color: green),
                          //     ),
                          //   ],
                          // ),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
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
                              initialValue: _reminder == null
                                  ? null
                                  : _reminder.get("note"),
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
                              onChanged: (val) {
                                donerNot = val;
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
                              initialValue: _reminder == null
                                  ? null
                                  : _reminder.get("reply"),
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
                              onChanged: (val) {
                                massage = val;
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
                                  _actionperformed(context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
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
                                ),
                                color: green,
                              ),
                              FlatButton(
                                height: 40,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
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
        ),
      ),
    );
  }
}
