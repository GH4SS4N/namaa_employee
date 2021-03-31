import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../main.dart';

class CharityPage extends ConsumerWidget {
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
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Icon(
                    Icons.check_circle,
                    size: 40,
                    color: green,
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
        ],
      ),
      color: Colors.black.withOpacity(0.5),
    );
  }
}
