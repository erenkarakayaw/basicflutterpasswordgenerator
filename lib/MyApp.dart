import 'package:flutter/material.dart';
import 'appBody.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: appBody(),
      );
  }


}