import 'package:flutter/material.dart';
import 'home_page.dart';
import 'injection.dart' as inject;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //initialization
  await inject.init();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arias Weather',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
          colorScheme: const ColorScheme.light(
              primary: Colors.black54,
              primaryContainer: Colors.white,
              onPrimaryContainer: Colors.white,
              secondaryContainer: Colors.white,
              onSecondaryContainer: Colors.white,
              tertiaryContainer: Colors.white,
              onTertiaryContainer: Colors.white,
              error: Colors.red)
      ),

      home: HomePage(),
    );
  }
}
