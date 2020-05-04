import 'package:flutter/material.dart';
import 'package:flutter_provider_demo/ui/views/login_view.dart';
import 'package:flutter_provider_demo/ui/views/main_page_view.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider_demo/provider_setup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainPageView(),
      ),
    );
  }
}