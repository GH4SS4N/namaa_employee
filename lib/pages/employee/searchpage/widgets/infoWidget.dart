import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:namaa_employee/pages/employee/searchpage/notEdit.dart';
import 'package:namaa_employee/pages/employee/searchpage/widgets/searchWidgit.dart';

import '../../../../main.dart';
//import '../search.dart';

class InfoWidget extends ConsumerWidget {
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    //final searchState = watch(searchStateProvider).state;
    final reminderState = watch(reminderProvider).state;

    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: Text(
                  "التنبيهات",
                  style: TextStyle(fontSize: 25, color: green),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipOval(
                  child: Container(
                    color: Colors.black.withOpacity(0.3),
                    child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NotEdit()),
                          );
                        }),
                  ),
                ),
              )
            ],
          ),
          Card(
            color: gray,
            elevation: 8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: reminderState == null
                  ? [
                      Container(
                          height: 86,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "لا يوجد تنبيهات",
                                style: TextStyle(fontSize: 20, color: darkgray),
                              ),
                            ],
                          ))
                    ]
                  : reminderState
                      .map(
                        (reminder) => InkWell(
                          onTap: () {
                            context.read(chosinReminderProvider).state =
                                reminder;
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
                                            Text(formatter
                                                .format(reminder.get("date"))
                                                .toString()),
                                            Text("program-time")
                                          ],
                                        ),
                                        Spacer(),
                                        Text(
                                          formatter
                                              .format(reminder.get("createdAt"))
                                              .toString(),
                                          style: TextStyle(color: green),
                                        )
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
            ),
          ),
        ],
      ),
    );
  }
}
