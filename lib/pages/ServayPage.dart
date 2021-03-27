import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../main.dart';

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
                Text(
                  "استبيان",
                  style: TextStyle(fontSize: 45, color: green),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("امسح شعار الترميز لنقييم \n       تجربة المتبرع"),
                SizedBox(
                  height: 30,
                ),
                Material(
                  elevation: 5,
                  child: Container(
                    color: green,
                    height: 340,
                    width: 340,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              color: green,
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "الاستعلام",
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(
                    Icons.bar_chart_sharp,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 100,
          )
        ],
      ),
    );
  }
}
