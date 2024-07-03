import 'package:flutter/material.dart';

import 'src/modules/core/theme/theme.dart';
import 'src/modules/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portifolio',
      theme: ThemeData(colorScheme: lightColorScheme),
      darkTheme: ThemeData(colorScheme: darkColorScheme),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
