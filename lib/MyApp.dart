import 'package:flutter/material.dart';
import 'appBody.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: appBody(),
        title: "Password Generator",
        theme: ThemeData(
          primarySwatch: Colors.blue,
          unselectedWidgetColor: Colors.white
        ),
      );
  }


}