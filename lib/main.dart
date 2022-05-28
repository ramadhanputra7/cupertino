import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Cupertino"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Platform.isIOS
                ? showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1999),
                    lastDate: DateTime(2030))
                : showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        color: Color.fromARGB(255, 248, 241, 241),
                        child: CupertinoDatePicker(
                          onDateTimeChanged: (datetime) {
                            print(datetime);
                          },
                          mode: CupertinoDatePickerMode.date,
                          initialDateTime: DateTime.now(),
                        ),
                      );
                    });
          },
          child: Text(
            "Alert Dialog",
          ),
        ),
      ),
    );
  }
}
