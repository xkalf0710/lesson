import 'package:flutter/material.dart';
import 'package:lesson/Login.dart';
import 'package:lesson/provider/AuthProvider.dart';
import 'package:lesson/services/navigator_service.dart';
import 'package:lesson/services/setup.dart';
import 'package:lesson/utils/theme.dart';
import 'package:provider/provider.dart';


void main() {
  locatorSetup();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
    ],
      child: MaterialApp(
        title: 'Монгол бичиг',
        theme: ligthTheme,
        navigatorKey: locator<NavigatorService>().navigatorKey,
        initialRoute: "/",
        home: const Login(),
      ),
    );
  }
}

