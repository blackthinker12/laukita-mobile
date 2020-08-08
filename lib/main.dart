import 'package:flutter/material.dart';

import 'package:laukita_apps/ui/pages/pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Laukita',
      theme: ThemeData(
        primaryColor: Color(0xFFcc0001),
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      routes: {
        '/product_detail': (_) => ProductDetail(),
        '/scan': (_) => Scanner(),
        '/order_payment': (_) => OrderPayment(),
      },
    );
  }
}