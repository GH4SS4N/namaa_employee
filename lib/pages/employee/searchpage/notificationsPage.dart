import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:namaa_employee/pages/employee/searchpage/search.dart';
import 'package:namaa_employee/requests/reminderRequests.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
// import 'package:namaa_employee/pages/searchpage/search.dart';

//import '../main.dart';
import '../../../main.dart';
import 'notEdit.dart';

class NotaficationsPage extends ConsumerWidget {
  Future<void> _showMyDialog(context, ParseObject reminder) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
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
                          Text("phone number")
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
                          "نص التمبيه",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          reminder.get("note").toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(""),
                        Text(""),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Spacer(),
                            Text(reminder.get("createdAt").toString()),
                          ],
                        )
                      ],
                    )),
                Text(
                  'نص الرد',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                Text(
                  reminder.get("reply").toString(),
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
                                context.read(chosinReminderProvider).state =
                                    reminder;
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
        );
      },
    );
  }

  //List doners;

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final todayReminders = watch(todayReminderProvider).state;
    return Container(
      color: gray,
      child: Stack(
        children: [
          Column(
            children: [
              Material(
                //elevation: 20,
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 20, 0),
                  color: gray,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "التنبيهات",
                        style: TextStyle(fontSize: 45, color: green),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "اليوم",
                            style: TextStyle(fontSize: 20, color: darkgray),
                          ),
                          Text(
                            "20/12/2021",
                            style: TextStyle(fontSize: 20, color: darkgray),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey.withOpacity(0.0),
              ),
              // Text("data"),
              watch(connectionProvider).when(
                data: (parse) {
                  return Expanded(
                      child: RefreshIndicator(
                    onRefresh: () async {
                      getRemindersToday(context.read(userProvider).state)
                          .then((value) {
                        print(value.toString());
                        //TODO: Saud ,, i want to get the donors to use their information.
                        //
                        // if (value != null) {
                        //   print("in the if statment");
                        //   int _x = 0;
                        //   for (var item in value) {
                        //     print("in the for loop statment" +
                        //         "==========" +
                        //         item.toString());
                        //     ParseObject("ReminderDonor")
                        //         .getObject(item.get("donor"))
                        //         .then((value) {
                        //       //  doners[_x] = value[_x];
                        //       // print(value.results);
                        //     });
                        //   }
                        //   //print("doners ==== " + doners.toString());
                        // }
                        //print(doners.toString());
                        context.read(todayReminderProvider).state = value;
                      });
                    },
                    key: _refreshIndicatorKey,
                    child: context.read(todayReminderProvider).state == null
                        ? ListView(children: [
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: Text("nothing")),
                              ),
                            ),
                          ])
                        : ListView.builder(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            shrinkWrap: true,
                            itemCount: context
                                .read(todayReminderProvider)
                                .state
                                .length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  _showMyDialog(context, todayReminders[index]);
                                },
                                child: Container(
                                  height: 86,
                                  color: gray,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 0, 0, 0),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
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
                                                  Text(context
                                                      .read(
                                                          todayReminderProvider)
                                                      .state[index]
                                                      .get("name")
                                                      .toString()),
                                                  Text("program-time")
                                                ],
                                              ),
                                              Spacer(),
                                              Text(context
                                                  .read(todayReminderProvider)
                                                  .state[index]
                                                  .get("createdAt")
                                                  .toString())
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
                            }),
                  ));
                },
                loading: () => Container(
                    child: Center(child: CircularProgressIndicator())),
                error: (e, stack) {
                  return Scaffold(
                      body:
                          Container(child: Center(child: Text(e.toString()))));
                },
              ),
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
    );
  }
}
