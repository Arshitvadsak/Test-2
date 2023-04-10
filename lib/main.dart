import 'package:flutter/material.dart';
import 'package:viva2/screens/GST.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => GstCalculator(),
      },
    ),
  );
}
