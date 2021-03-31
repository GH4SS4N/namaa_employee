import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../main.dart';

class BroudCastPage extends ConsumerWidget {
  // Function x;
  // NotaficationsPage({this.x});

  Future<void> _showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      //barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('رساله عامه'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  ' نص الرساله نص الرساله نص الرساله نص الرساله نص الرساله نص الرساله نص الرساله',
                  style: TextStyle(color: Colors.black),
                ),
                Text(''),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        //style: TextStyle(color: Colors.black),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "اغلاق",
                          style: TextStyle(fontSize: 10, color: Colors.black),
                        )),
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
          Material(
            //elevation: 20,
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 10, 20, 0),
              color: gray,
              child: Row(
                children: [
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "رسائل عامه",
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
                ],
              ),
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
                                        Icons.campaign,
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
        ],
      ),
      color: Colors.black.withOpacity(0.5),
    );
  }
}