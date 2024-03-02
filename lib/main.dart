import 'package:flutter/material.dart';
import 'screens/my_library.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Booky',
      theme: ThemeData(
        useMaterial3: false,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF141D29),
          secondary: const Color(0xFF58595B),
          background: const Color(0xFFDCE2EB),
          tertiary: const Color(0xFFFF4713)
        ),
      ),
      routes: {
        "/" : (context) => const MyLibrary(),
        //"/explore" : (context) => Explore(),
        //"/dashboard" : (context) => Dashboard(),
        //"/notes" : (context) => Notes(),
      },
      initialRoute: "/",
    );

  }
}



