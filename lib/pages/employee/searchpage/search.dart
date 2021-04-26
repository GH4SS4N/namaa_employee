import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:namaa_employee/pages/employee/searchpage/widgets/infoWidget.dart';
import 'package:namaa_employee/pages/employee/searchpage/widgets/nameWidget.dart';
import 'package:namaa_employee/pages/employee/searchpage/widgets/searchWidgit.dart';

import '../../../main.dart';
// import 'package:namaa_employee/pages/searchpage/widgets/infoWidget.dart';
// import 'package:namaa_employee/pages/searchpage/widgets/nameWidget.dart';
// import 'package:namaa_employee/pages/searchpage/widgets/searchWidgit.dart';

// import '../../main.dart';

// const Color yallow = Color.fromRGBO(255, 202, 40, 1);
// //const Color green = Color.fromRGBO(46, 125, 50, 1);
// const Color darkgray = Color.fromRGBO(97, 97, 97, 1);
// const Color gray = Color.fromRGBO(243, 243, 243, 1);

final searchStateProvider = StateProvider<int>((ref) {
  return 1;
});

class Search extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final searchState = watch(searchStateProvider).state;
    final phoneNum = watch(phoneNumberProvider).state;
    final donor = watch(donerProvider).state;
    return Container(
      width: double.infinity,
      child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              //color: gray,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: Text(
                          context.read(phoneNumberProvider).state == ""
                              ? "البحث"
                              : context.read(phoneNumberProvider).state != "" &&
                                      context.read(donerProvider).state == null
                                  ? "اضافه متبرع"
                                  : "صفحة متبرع",
                          style: TextStyle(fontSize: 45, color: green),
                        ),
                      ),
                      context.read(phoneNumberProvider).state != ""
                          ? IconButton(
                              icon: Icon(
                                Icons.arrow_forward,
                                size: 50,
                              ),
                              onPressed: () {
                                context.read(reminderProvider).state = null;
                                context.read(donerProvider).state = null;
                                context.read(phoneNumberProvider).state = "";
                                context.read(nameProvider).state = "";
                                context.read(searchStateProvider).state = 1;
                              })
                          : Container()
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          child: context.read(phoneNumberProvider).state == ""
                              ? Icon(
                                  Icons.person_search,
                                  color: green,
                                  size: 100,
                                )
                              : context.read(phoneNumberProvider).state != "" &&
                                      context.read(donerProvider).state == null
                                  ? Icon(
                                      Icons.person_add,
                                      color: green,
                                      size: 100,
                                    )
                                  : Icon(
                                      Icons.person,
                                      color: green,
                                      size: 100,
                                    )),
                    ],
                  ),
                  context.read(nameProvider).state != ""
                      ? Text(context.read(nameProvider).state)
                      : Container(),
                  context.read(phoneNumberProvider).state != ""
                      ? Text(context.read(phoneNumberProvider).state)
                      : Container()
                ],
              ),
            ),

            //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

            context.read(phoneNumberProvider).state == ""
                ? SearchWidget()
                : context.read(donerProvider).state == null
                    ? NameWidget()
                    : InfoWidget()
          ]),
    );
  }
}
