import 'package:flutter/material.dart';

import 'package:ecommerce_watch_store/view/home/home_widget.dart';
import 'package:ecommerce_watch_store/view/detail_product/detail_product_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Watch Shop',
      theme: ThemeData(fontFamily: 'Raleway'),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => const HomeWidget(),
        '/home/detail_product': (context) {
          final id = ModalRoute.of(context)?.settings.arguments;
          if (id is int) {
            return DetailProductWidget(watchId: id);
          } else {
            return const DetailProductWidget(watchId: 0);
          }
        },
      },
      initialRoute: '/home',
    );
  }
}
