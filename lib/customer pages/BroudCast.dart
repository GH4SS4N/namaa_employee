import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:namaa_employee/ChatPage.dart';
import 'package:namaa_employee/pages/employee/searchpage/search.dart';

import '../main.dart';

//import '../main.dart';

class BroudCastPage extends ConsumerWidget {
  // Function x;
  // NotaficationsPage({this.x});

  Future<void> _showMyDialog(context, String x) async {
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
                  x,
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            color: gray,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "رسائل عامه",
                      style: TextStyle(fontSize: 45, color: green),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.headset_mic,
                              size: 40,
                              color: green,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChatPage()));
                            }),
                        Text(
                          "الدعم الفني",
                          style: TextStyle(color: green),
                        )
                      ],
                    )
                  ],
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
              child: Column(
            children: context
                .read(announcementsProvider)
                .state
                .map(
                  (reminder) => InkWell(
                    onTap: () {
                      _showMyDialog(context, reminder.get("text").toString());
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          reminder.get("createdAt").toString()),
                                      // Text("program-time")
                                    ],
                                  ),
                                  Spacer(),
                                  // Text(
                                  //   "history",
                                  //   style: TextStyle(color: green),
                                  // )
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
                  ),
                )
                .toList(),
          ))
        ],
      ),
      color: Colors.black.withOpacity(0.5),
    );
  }
}
