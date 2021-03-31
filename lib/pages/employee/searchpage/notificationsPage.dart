import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:namaa_employee/pages/employee/searchpage/search.dart';
// import 'package:namaa_employee/pages/searchpage/search.dart';

//import '../main.dart';
import 'notEdit.dart';

class NotaficationsPage extends ConsumerWidget {
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
                        Text(
                          'نص التمبيه',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          'This is a demo alert dialog.',
                          style: TextStyle(color: Colors.white),
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
                Text(
                  'نص الرد',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                Text(
                  'This is a demo alert dialog.',
                  style: TextStyle(color: Colors.black),
                ),
                Text(''),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      //color: green,
                      child: Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "تم",
                                style: TextStyle(fontSize: 20),
                              )),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "الغاء",
                                style: TextStyle(fontSize: 20),
                              ))
                        ],
                      ),
                    ),
                    Container(
                      color: gray,
                      child: Row(
                        children: [
                          IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NotEdit()),
                                );
                              }),
                          IconButton(icon: Icon(Icons.chat), onPressed: () {})
                        ],
                      ),
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
