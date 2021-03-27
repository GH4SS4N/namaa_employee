import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../main.dart';
import 'notEdit.dart';

class NotaficationsPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Container(
      child: Stack(
        children: [
          Column(
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
                            "التنبيهات",
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NotEdit()),
                            );
                          },
                          child: Container(
                            height: 86,
                            color: gray,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Icon(
                                            Icons.notifications,
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
          // Material(
          //   //elevation: 5,
          //   child: Container(
          //     padding: EdgeInsets.fromLTRB(0, 10, 20, 0),
          //     color: gray,
          //     child: Row(
          //       children: [
          //         Column(
          //           mainAxisSize: MainAxisSize.min,
          //           // mainAxisAlignment: MainAxisAlignment.center,
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Text(
          //               "التنبيهات",
          //               style: TextStyle(fontSize: 45, color: green),
          //             ),
          //             Text(
          //               "اليوم",
          //               style: TextStyle(fontSize: 20, color: darkgray),
          //             )
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
      color: Colors.black.withOpacity(0.5),
    );
  }
}
