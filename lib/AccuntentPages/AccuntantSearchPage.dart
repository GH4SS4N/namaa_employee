import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../main.dart';
import 'ASearchWidgets/ASearchWidgit.dart';
import 'ASearchWidgets/AinfoWidget.dart';

final searchStateProvider = StateProvider<int>((ref) {
  return 1;
});

class AccuntantSearchPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final searchState = watch(searchStateProvider).state;
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
                          searchState == 1
                              ? "البحث"
                              : searchState == 2
                                  ? "اضافه متبرع"
                                  : "صفحة متبرع",
                          style: TextStyle(fontSize: 45, color: green),
                        ),
                      ),
                      searchState != 1
                          ? IconButton(
                              icon: Icon(
                                Icons.arrow_forward,
                                size: 50,
                              ),
                              onPressed: () {
                                context.read(searchStateProvider).state = 1;
                              })
                          : Container()
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          child: searchState == 1
                              ? Icon(
                                  Icons.person_search,
                                  color: green,
                                  size: 100,
                                )
                              : searchState == 2
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
                  searchState == 3 ? Text("name") : Container(),
                  searchState == 3 || searchState == 2
                      ? Text("05XXXXXXXX")
                      : Container()
                ],
              ),
            ),

            //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

            searchState == 3 ? AInfoWidget() : ASearchWidget()
          ]),
    );
  }
}
