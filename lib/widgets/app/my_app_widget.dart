import 'package:flutter/material.dart';

import 'package:ecommerce_watch_store/widgets/home/home_widget.dart';
import 'package:ecommerce_watch_store/widgets/detail_product/detail_product_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Watch Shop',
      theme: ThemeData(fontFamily: 'Raleway'),
      routes: {
        '/home': (context) => const HomeWidget(),
        '/home/detail_product': (context) => const DetailProductWidget(),
      },
      initialRoute: '/home',
    );
  }
}
