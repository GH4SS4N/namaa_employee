import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:namaa_employee/pages/ServayPage.dart';
import 'package:namaa_employee/pages/notificationsPage.dart';
import 'package:namaa_employee/pages/searchpage/search.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

const Color yallow = Color.fromRGBO(255, 202, 40, 1);
const Color green = Color.fromRGBO(46, 125, 50, 1);
const Color darkgray = Color.fromRGBO(97, 97, 97, 1);
const Color gray = Color.fromRGBO(243, 243, 243, 1);

final pageStateProvider = StateProvider<int>((ref) {
  return 1;
});

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child,
        );
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final pageState = watch(pageStateProvider).state;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: pageState == 1
          ? NotaficationsPage()
          : pageState == 2
              ? SingleChildScrollView(child: Search())
              : SingleChildScrollView(child: ServayPage()),
      bottomNavigationBar: BottomAppBar(
        color: yallow,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              //mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: IconButton(
                      icon: Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        context.read(pageStateProvider).state = 1;
                      }),
                ),
                Text(
                  "تنبيه",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            //Spacer(),
            Stack(
              alignment: Alignment.bottomCenter,
              //mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: IconButton(
                      icon: Icon(
                        Icons.bar_chart_rounded,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        context.read(pageStateProvider).state = 3;
                      }),
                ),
                Text(
                  "اراء المتبرعين",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            //IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: green,
          child: Icon(Icons.add),
          onPressed: () {
            context.read(pageStateProvider).state = 2;
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}