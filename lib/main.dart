import 'package:flutter/material.dart';
import 'package:ostello_intern_assignement/provider/search_bar_filter_provider.dart';
import 'package:ostello_intern_assignement/screens/first_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<SearchBarFilterProvider>(
          create: (_) => SearchBarFilterProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FirstScreen(),
    );
  }
}
