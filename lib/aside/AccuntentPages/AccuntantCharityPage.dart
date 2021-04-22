import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../main.dart';
//import '../main.dart';

class AccuntantCharityPage extends ConsumerWidget {
  // Function x;
  // NotaficationsPage({this.x});

  Future<void> _showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      //barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          //title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.person,
                        size: 60,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "غسان احمد",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text("date")
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    color: green,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'البرنامج:',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Text("كسوه",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20))
                          ],
                        ),
                        Container(
                          height: 1,
                          width: double.maxFinite,
                          color: Colors.white,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'رقم الحواله:',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Text("19028329083019",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20))
                          ],
                        ),
                        Container(
                          height: 1,
                          width: double.maxFinite,
                          color: Colors.white,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'المبلغ :',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Text("500",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20))
                          ],
                        ),
                        Container(
                          height: 1,
                          width: double.maxFinite,
                          color: Colors.white,
                        ),
                        Text(
                          'تفاصيل اخرا:',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Text("كسوه",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        Container(
                          height: 1,
                          width: double.maxFinite,
                          color: Colors.white,
                        ),
                        Text(""),
                        Text(""),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Spacer(),
                            Text("2021/12/2"),
                          ],
                        )
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    color: Colors.black.withOpacity(0.5),
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipOval(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.all(5),
                              color: Colors.white,
                              child: Icon(
                                Icons.check_circle,
                                color: green,
                              ),
                            ),
                          ),
                        ),
                        ClipOval(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.all(5),
                              color: Colors.white,
                              child: Icon(Icons.history_rounded),
                            ),
                          ),
                        ),
                        ClipOval(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                                padding: EdgeInsets.all(5),
                                color: Colors.white,
                                child: Icon(
                                  Icons.cancel,
                                  color: Colors.red.withRed(-60),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(''),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      //color: green,

                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "حفظ",
                            style: TextStyle(fontSize: 20),
                          )),
                    ),
                    Container(
                      //color: green,

                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "اغلاق",
                            style: TextStyle(fontSize: 20),
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
          // actions: <Widget>[
          //   TextButton(
          //     child: Text('Approve'),
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //     },
          //   ),
          // ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 20, 0),
            color: gray,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "المعاملات",
                  style: TextStyle(fontSize: 45, color: green),
                ),
                Row(
                  //mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "اليوم   ",
                      style: TextStyle(fontSize: 20, color: darkgray),
                    ),
                    Text(
                      "20/12/2021  ",
                      style: TextStyle(fontSize: 20, color: darkgray),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            height: 0.5,
            color: Colors.grey.withOpacity(0.0),
          ),
          // Text("data"),
          Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  shrinkWrap: true,
                  itemCount: 50,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        _showMyDialog(context);
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => NotEdit()),
                        //   );
                      },
                      child: Container(
                        height: 86,
                        color: gray,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Icon(
                                        Icons.check_circle,
                                        size: 40,
                                        color: green,
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("name"),
                                        Text("program-time")
                                      ],
                                    ),
                                    Spacer(),
                                    Text("history")
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 1,
                                color: Colors.grey.withOpacity(0.5),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }))
          //
        ],
      ),
      color: Colors.black.withOpacity(0.5),
    );
  }
}
