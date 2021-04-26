import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../main.dart';

class ServayPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 20, 0),
            //color: gray,
            child: Row(
              children: [
                Text("استبيان", style: TextStyle(fontSize: 45, color: green)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("امسح شعار الترميز لنقييم \n       تجربة المتبرع"),
              SizedBox(height: 30),
              Material(
                elevation: 5,
                child: Container(
                  child: QrImage(
                    data:
                        "https://docs.google.com/forms/d/18MqZ4gUHqI53p4jZuenTmyQZb_ghGyN0fWwEbywntnM/edit",
                    version: QrVersions.auto,
                    size: 340,
                  ),
                  //color: green,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              color: green,
              onPressed: () {
                launch(
                  "https://docs.google.com/forms/d/18MqZ4gUHqI53p4jZuenTmyQZb_ghGyN0fWwEbywntnM/edit#responses",
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.bar_chart_sharp, color: Colors.white),
                  Text("النتائج", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
          SizedBox(height: 100)
        ],
      ),
    );
  }
}
