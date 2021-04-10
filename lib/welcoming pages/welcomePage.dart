import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:namaa_employee/main.dart';
import 'package:namaa_employee/welcoming%20pages/customerCreationPage.dart';
import 'package:namaa_employee/welcoming%20pages/loginPage.dart';

final welcomePageStateProvider = StateProvider<int>((ref) {
  return 1;
});

class WelcomePagex extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final elcomPageState = watch(welcomePageStateProvider).state;
    return context.read(welcomePageStateProvider).state == 1
        ? WelcomePage()
        : context.read(welcomePageStateProvider).state == 2
            ? LoginPage()
            : CustomerCreationPage();
  }
}

class WelcomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 50,
            ),
            Container(
              height: 300,
              width: 300,
              //color: green,
              child: Image.asset("assets/N.png"),
            ),
            Text(
              "نماء",
              style: TextStyle(fontSize: 20),
            ),
            Container(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: FlatButton(
                  height: 50,
                  color: green,
                  onPressed: () {
                    context.read(welcomePageStateProvider).state = 2;
                    // _actionperformed(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        " تسجيل الدخول",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  )),
            ),
            Text(
              "حساب جديد ",
              style: TextStyle(fontSize: 45, color: green),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlatButton(
                    height: 50,
                    color: green,
                    onPressed: () {
                      // _actionperformed(context);
                    },
                    child: Text(
                      "موضف",
                      style: TextStyle(color: Colors.white),
                    )),
                FlatButton(
                    height: 50,
                    color: green,
                    onPressed: () {
                      context.read(welcomePageStateProvider).state = 3;
                      // _actionperformed(context);
                    },
                    child: Text(
                      "متبرع",
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
