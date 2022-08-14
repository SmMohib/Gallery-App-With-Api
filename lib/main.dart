import 'package:flutter/material.dart';
import 'package:glarryapp/ApiDara/Provider.dart';
import 'package:glarryapp/ApiDara/api.dart';
import 'package:glarryapp/ApiDara/gridDemo.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<GProvider>(create: (_) => GProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
