import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:namaa_employee/SupportPages/SMassagesPage.dart';
import 'package:namaa_employee/SupportPages/SentBroudCast.dart';
import 'package:namaa_employee/customer%20pages/AddCharity.dart';
import 'package:namaa_employee/customer%20pages/CharityPage.dart';
import 'package:namaa_employee/pages/employee/searchpage/ServayPage.dart';
import 'package:namaa_employee/pages/employee/searchpage/notificationsPage.dart';
import 'package:namaa_employee/pages/employee/searchpage/search.dart';
import 'package:namaa_employee/pages/employee/searchpage/widgets/searchWidgit.dart';
import 'package:namaa_employee/requests/donorRequests.dart';
import 'package:namaa_employee/welcoming%20pages/customerCreationPage.dart';
import 'package:namaa_employee/welcoming%20pages/welcomePage.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import 'AccuntentPages/AccuntantCharityPage.dart';
import 'AccuntentPages/AccuntantSearchPage.dart';
import 'customer pages/BroudCast.dart';
import 'drawer/ddrawer.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

const Color yallow = Color.fromRGBO(255, 202, 40, 1);
const Color green = Color.fromRGBO(46, 125, 50, 1);
const Color darkgray = Color.fromRGBO(97, 97, 97, 1);
const Color gray = Color.fromRGBO(243, 243, 243, 1);

const appId = "OzrokmU22cgyApcIL7XMkNvADiuxuro1B5SRJ8Yy";
const serverUrl = "https://parseapi.back4app.com/";
const clientKey = "yQXy4KHzCutNlZOtToTsRU7AsHXqMts6oPaloj58";

final pageStateProvider = StateProvider<int>((ref) {
  return 2;
});

final connectionProvider = FutureProvider<Parse>(
  (ref) async => await Parse().initialize(
    appId,
    serverUrl,
    clientKey: clientKey,
    //fileDirectory: (await getExternalStorageDirectory()).path,
  ),
);

final programsProvider = StateProvider<List<ParseObject>>((ref) => null);

final announcementsProvider = StateProvider<List<ParseObject>>((ref) => null);

final getDonationsProvider = StateProvider<List<ParseObject>>((ref) => null);

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
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
      home: watch(connectionProvider).when(
        data: (parse) {
          getPrograms()
              .then((value) => context.read(programsProvider).state = value);
          return SafeArea(child: WelcomePagex());
        },
        loading: () =>
            Container(child: Center(child: CircularProgressIndicator())),
        error: (e, stack) {
          return Scaffold(
              body: Container(child: Center(child: Text(e.toString()))));
        },
      ),
    );
  }
}

class EmployeeApp extends ConsumerWidget {
  Future<void> _showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final pageState = watch(pageStateProvider).state;
    return Scaffold(
      key: _scaffoldKey,
      drawer: OwnerDrawer(),
      resizeToAvoidBottomInset: false,
      body: pageState == 1
          ? NotaficationsPage()
          : pageState == 2
              ? SingleChildScrollView(child: Search())
              : SingleChildScrollView(child: ServayPage()),
      //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
      bottomNavigationBar: BottomAppBar(
        color: yallow,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {
                  _scaffoldKey.currentState.openDrawer();
                }),
            IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
                onPressed: () {
                  context.read(pageStateProvider).state = 1;
                }),
            Container(
              height: 1,
              width: 40,
            ),
            //Spacer(),
            IconButton(
                icon: Icon(
                  Icons.bar_chart_rounded,
                  color: Colors.white,
                ),
                onPressed: () {
                  context.read(pageStateProvider).state = 3;
                }),

            Container(
              height: 1,
              width: 40,
            ),
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

class CustomerApp extends ConsumerWidget {
  Future<void> _showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final pageState = watch(pageStateProvider).state;
    return watch(connectionProvider).when(
      data: (parse) {
        // getDonationsOf(user.donor)
        //     .then((value) => context.read(donerProvider).state = value[0]);
        getAnnouncements()
            .then((value) => context.read(announcementsProvider).state = value);
        getPrograms()
            .then((value) => context.read(programsProvider).state = value);
        return Scaffold(
          key: _scaffoldKey,
          drawer: OwnerDrawer(),
          resizeToAvoidBottomInset: false,
          body: pageState == 1
              ? CharityPage()
              : pageState == 2
                  ? SingleChildScrollView(child: AddCharityPage())
                  : BroudCastPage(),
          //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
          bottomNavigationBar: BottomAppBar(
            color: yallow,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      _scaffoldKey.currentState.openDrawer();
                    }),
                IconButton(
                    icon: Icon(
                      Icons.check_circle,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      context.read(pageStateProvider).state = 1;
                    }),
                Container(
                  height: 1,
                  width: 40,
                ),
                //Spacer(),
                IconButton(
                    icon: Icon(
                      Icons.campaign,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      context.read(pageStateProvider).state = 3;
                    }),

                Container(
                  height: 1,
                  width: 40,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
              backgroundColor: green,
              child: Icon(Icons.add),
              onPressed: () {
                context.read(pageStateProvider).state = 2;
              }),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        );
      },
      loading: () =>
          Container(child: Center(child: CircularProgressIndicator())),
      error: (e, stack) {
        return Scaffold(
            body: Container(child: Center(child: Text(e.toString()))));
      },
    );
  }
}

class AccuntantApp extends ConsumerWidget {
  Future<void> _showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final pageState = watch(pageStateProvider).state;
    return Scaffold(
      key: _scaffoldKey,
      drawer: OwnerDrawer(),
      resizeToAvoidBottomInset: false,
      body: pageState == 1
          ? AccuntantCharityPage()
          : pageState == 2
              ? SingleChildScrollView(child: AccuntantSearchPage())
              : BroudCastPage(),
      //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
      bottomNavigationBar: BottomAppBar(
        color: yallow,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {
                  _scaffoldKey.currentState.openDrawer();
                }),
            IconButton(
                icon: Icon(
                  Icons.history_rounded,
                  color: Colors.white,
                ),
                onPressed: () {
                  context.read(pageStateProvider).state = 1;
                }),
            Container(
              height: 1,
              width: 40,
            ),
            //Spacer(),
            // Container(
            //   height: 1,
            //   width: 40,
            // ),
            IconButton(
                icon: Icon(
                  Icons.campaign,
                  color: Colors.white,
                ),
                onPressed: () {
                  context.read(pageStateProvider).state = 3;
                }),

            Container(
              height: 1,
              width: 40,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: green,
          child: Icon(Icons.search),
          onPressed: () {
            context.read(pageStateProvider).state = 2;
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class SupportApp extends ConsumerWidget {
  Future<void> _showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final pageState = watch(pageStateProvider).state;
    return Scaffold(
      key: _scaffoldKey,
      drawer: OwnerDrawer(),
      resizeToAvoidBottomInset: false,
      body: pageState == 1
          ? SMassagesPage()
          : pageState == 2
              ? SingleChildScrollView(child: SendBroudCastPage())
              : BroudCastPage(),
      //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
      bottomNavigationBar: BottomAppBar(
        color: yallow,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {
                  _scaffoldKey.currentState.openDrawer();
                }),
            IconButton(
                icon: Icon(
                  Icons.mail_outline,
                  color: Colors.white,
                ),
                onPressed: () {
                  context.read(pageStateProvider).state = 1;
                }),
            Container(
              height: 1,
              width: 40,
            ),
            //Spacer(),
            IconButton(
                icon: Icon(
                  Icons.campaign,
                  color: Colors.white,
                ),
                onPressed: () {
                  context.read(pageStateProvider).state = 3;
                }),

            Container(
              height: 1,
              width: 40,
            ),
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
